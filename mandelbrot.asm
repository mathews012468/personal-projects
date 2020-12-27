.data
frameBuffer: .space 0x80000 #512wideX256highpixels
floatie: .float 0.0078125 #1/128

.text
#s0 contains base address of the array
la $s2, frameBuffer

#f0 contains 1/128
l.s $f0, floatie

#t0 <- 512, t1 <- 256
#this will be the bounds on the loops
#as I iterate through frameBuffer
li $t0, 512
li $t1, 256

#s0 <- x, s1 <- y
li $s0, 0
li $s1, 0

#s3 <- blue
li $s3, 0xFF

#f1 <- -2 as a float (x)
li $t4, -2
mtc1 $t4, $f1
cvt.s.w $f1, $f1

#f2 <- 1 as a float (y)
li $t4, 1
mtc1 $t4, $f2
cvt.s.w $f2, $f2

################################
#THE LOOP OF LOOPS##############
################################
nextRow:
beq $s1, $t1, exitOuter #end of everything
nextColumn:
beq $s0, $t0, exitInner #end of a row

mul.s $f3, $f1, $f1 #f3 <- re(z)^2
mul.s $f5, $f2, $f2 #f5 <- im(z)^2
sub.s $f3, $f3, $f5 
add.s $f3, $f3, $f1 #f3 <- new re(z)

mul.s $f4, $f1, $f2
li $t5, 2
mtc1 $t5, $f5
cvt.s.w $f5, $f5
mul.s $f4, $f4, $f5 
add.s $f4, $f4, $f2 #f4 <- new im(z)

#begin of loop
li $t2, 20
iterate:
beq $t2, $zero, endIterate
addi $t2, $t2, -1
#compute real part
mul.s $f6, $f3, $f3
mul.s $f7, $f4, $f4
sub.s $f6, $f6, $f7
add.s $f6, $f6, $f1

#compute imaginary part
mul.s $f7, $f3, $f4
mtc1 $t5, $f8
cvt.s.w $f8, $f8
mul.s $f7, $f7, $f8
add.s $f7, $f7, $f2

#put back in f3 and f4
mov.s $f3, $f6
mov.s $f4, $f7
j iterate

endIterate:
mul.s $f5, $f3, $f3
mul.s $f6, $f4, $f4
add.s $f5, $f5, $f6
sqrt.s $f5, $f5

li $t5, 2
mtc1 $t5, $f6
cvt.s.w $f6, $f6
c.lt.s $f5, $f6
bc1t larger

#compute offset of current element in array
sll $t2, $s1, 9 #t2 <- 512y
add $t2, $t2, $s0 #t2 <- 512y+x
sll $t2, $t2, 2 #t2 <- 4(512y+x) (right offset)

#compute memory address
add $t3, $s2, $t2

#color it blue
sw $s3, 0($t3)

larger:
add.s $f1, $f1, $f0 #f1 gets x plus 1/128
addi $s0, $s0, 1 #advance to the right one column
j nextColumn
exitInner:
li $s0, 0 #reset to leftmost column

#f1 <- x as a float (now 0)
li $t4, -2
mtc1 $t4, $f1
cvt.s.w $f1, $f1

sub.s $f2, $f2, $f0 #f2 gets y minus 1/128
addi $s1, $s1, 1 #advance down one row

j nextRow
exitOuter: