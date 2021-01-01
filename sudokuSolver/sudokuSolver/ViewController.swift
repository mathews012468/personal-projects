//
//  ViewController.swift
//  sudokuSolver
//
//  Created by Matthew Soto on 12/14/20.
//


//IN ENTITLEMENTS, APP SANDBOX SHOULD BE SET TO "NO"

import Cocoa

class ViewController: NSViewController {
    var selectedSquare = "0"
    var button = NSButton()
    var smtStatements = [String]()
    var numbersInGrid = Array(repeating: "0", count: 81)
    var smtFile = String()
    var buildTask:Process!
    var sudokuGrid = String()

    @IBOutlet weak var notPossible: NSTextField!
    
    @IBOutlet weak var button0: NSButton!
    @IBOutlet weak var button1: NSButton!
    @IBOutlet weak var button2: NSButton!
    @IBOutlet weak var button3: NSButton!
    @IBOutlet weak var button4: NSButton!
    @IBOutlet weak var button5: NSButton!
    @IBOutlet weak var button6: NSButton!
    @IBOutlet weak var button7: NSButton!
    @IBOutlet weak var button8: NSButton!
    @IBOutlet weak var button9: NSButton!
    @IBOutlet weak var button10: NSButton!
    @IBOutlet weak var button11: NSButton!
    @IBOutlet weak var button12: NSButton!
    @IBOutlet weak var button13: NSButton!
    @IBOutlet weak var button14: NSButton!
    @IBOutlet weak var button15: NSButton!
    @IBOutlet weak var button16: NSButton!
    @IBOutlet weak var button17: NSButton!
    @IBOutlet weak var button18: NSButton!
    @IBOutlet weak var button19: NSButton!
    @IBOutlet weak var button20: NSButton!
    @IBOutlet weak var button21: NSButton!
    @IBOutlet weak var button22: NSButton!
    @IBOutlet weak var button23: NSButton!
    @IBOutlet weak var button24: NSButton!
    @IBOutlet weak var button25: NSButton!
    @IBOutlet weak var button26: NSButton!
    @IBOutlet weak var button27: NSButton!
    @IBOutlet weak var button28: NSButton!
    @IBOutlet weak var button29: NSButton!
    @IBOutlet weak var button30: NSButton!
    @IBOutlet weak var button31: NSButton!
    @IBOutlet weak var button32: NSButton!
    @IBOutlet weak var button33: NSButton!
    @IBOutlet weak var button34: NSButton!
    @IBOutlet weak var button35: NSButton!
    @IBOutlet weak var button36: NSButton!
    @IBOutlet weak var button37: NSButton!
    @IBOutlet weak var button38: NSButton!
    @IBOutlet weak var button39: NSButton!
    @IBOutlet weak var button40: NSButton!
    @IBOutlet weak var button41: NSButton!
    @IBOutlet weak var button42: NSButton!
    @IBOutlet weak var button43: NSButton!
    @IBOutlet weak var button44: NSButton!
    @IBOutlet weak var button45: NSButton!
    @IBOutlet weak var button46: NSButton!
    @IBOutlet weak var button47: NSButton!
    @IBOutlet weak var button48: NSButton!
    @IBOutlet weak var button49: NSButton!
    @IBOutlet weak var button50: NSButton!
    @IBOutlet weak var button51: NSButton!
    @IBOutlet weak var button52: NSButton!
    @IBOutlet weak var button53: NSButton!
    @IBOutlet weak var button54: NSButton!
    @IBOutlet weak var button55: NSButton!
    @IBOutlet weak var button56: NSButton!
    @IBOutlet weak var button57: NSButton!
    @IBOutlet weak var button58: NSButton!
    @IBOutlet weak var button59: NSButton!
    @IBOutlet weak var button60: NSButton!
    @IBOutlet weak var button61: NSButton!
    @IBOutlet weak var button62: NSButton!
    @IBOutlet weak var button63: NSButton!
    @IBOutlet weak var button64: NSButton!
    @IBOutlet weak var button65: NSButton!
    @IBOutlet weak var button66: NSButton!
    @IBOutlet weak var button67: NSButton!
    @IBOutlet weak var button68: NSButton!
    @IBOutlet weak var button69: NSButton!
    @IBOutlet weak var button70: NSButton!
    @IBOutlet weak var button71: NSButton!
    @IBOutlet weak var button72: NSButton!
    @IBOutlet weak var button73: NSButton!
    @IBOutlet weak var button74: NSButton!
    @IBOutlet weak var button75: NSButton!
    @IBOutlet weak var button76: NSButton!
    @IBOutlet weak var button77: NSButton!
    @IBOutlet weak var button78: NSButton!
    @IBOutlet weak var button79: NSButton!
    @IBOutlet weak var button80: NSButton!
    
    //this gets called when you click a square on the grid
    @IBAction func square(_ sender: NSButton) {
        button = sender
        selectedSquare = sender.identifier?.rawValue ?? "-1";
        print(selectedSquare) //unnecessary, but shows you which square was clicked
    }
    
    //this gets called when you click a number in the grid on the right
    //sets the button that was most recently clicked in the sudoku grid to the number that was clicked
    @IBAction func numberChanged(_ sender: NSButton) {
        button.title = sender.title
        let index = Int(button.identifier?.rawValue ?? "-1")
        if index != -1 {
            numbersInGrid[index!] = button.title
        }
    }
    
    //this gets called when you click solve
    @IBAction func solvePuzzle(_ sender: Any) {
        
        //the following code adds statements corresponding to the numbers currently
        //displayed on the sudoku grid
        var assertion = String()
        var i = 0
        while i < 81 {
            if numbersInGrid[i] != "0" {
                assertion = "(assert (= p\(i) \(numbersInGrid[i])))"
                smtStatements.append(assertion)
                smtFile += "\(assertion)\n"
            }
            i += 1
        }
        
        //this puts the statements written above in a file called extraAssertions.txt
        //inside a folder named sudokuSolver in the Downloads directory
        let file = "extraAssertions.txt"
        if let dir = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first {
            var fileURL = dir.appendingPathComponent("sudokuSolver")
            fileURL.appendPathComponent(file)
            
            do {
                try smtFile.write(to: fileURL, atomically: true, encoding: .utf8)
            }
            catch {print(error)}

        }
        
        let buttons = [0: button0, 1: button1, 2: button2, 3: button3, 4: button4, 5: button5, 6: button6, 7: button7, 8: button8, 9: button9, 10: button10, 11: button11, 12: button12, 13: button13, 14: button14, 15: button15, 16: button16, 17: button17, 18: button18, 19: button19, 20: button20, 21: button21, 22: button22, 23: button23, 24: button24, 25: button25, 26: button26, 27: button27, 28: button28, 29: button29, 30: button30, 31: button31, 32: button32, 33: button33, 34: button34, 35: button35, 36: button36, 37: button37, 38: button38, 39: button39, 40: button40, 41: button41, 42: button42, 43: button43, 44: button44, 45: button45, 46: button46, 47: button47, 48: button48, 49: button49, 50: button50, 51: button51, 52: button52, 53: button53, 54: button54, 55: button55, 56: button56, 57: button57, 58: button58, 59: button59, 60: button60, 61: button61, 62: button62, 63: button63, 64: button64, 65: button65, 66: button66, 67: button67, 68: button68, 69: button69, 70: button70, 71: button71, 72: button72, 73: button73, 74: button74, 75: button75, 76: button76, 77: button77, 78: button78, 79: button79, 80: button80]
        
        //the following calls buildScript.sh, a shell script which calls another shell script
        //found inside the sudokuSolver folder
        let taskQueue = DispatchQueue.global(qos: DispatchQoS.QoSClass.background)
        taskQueue.async {
            guard let path = Bundle.main.path(forResource: "buildScript", ofType: ".sh")
            else {
                print("script didn't work")
                return
            }
            
            self.buildTask = Process()
            self.buildTask.launchPath = path
            
            self.buildTask.launch()
            self.buildTask.waitUntilExit()
            
            //output of the shell script goes into filledGrid.txt
            //the following puts the contents of filledGrid.txt inside the string sudokuGrid
            let newfile = "filledGrid.txt"
            if let dir = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first {
                var newfileUrl = dir.appendingPathComponent("SudokuSolver")
                newfileUrl.appendPathComponent(newfile)

                do {
                    self.sudokuGrid = try String(contentsOf: newfileUrl, encoding: .utf8)
                }
                catch {print(error)}
                print(self.sudokuGrid)
                DispatchQueue.main.async {
                    if (self.sudokuGrid != "no such sudoku grid exists\n") {
                        let charArray = Array(self.sudokuGrid)
                        for i in Range(0...80) {
                            //sets grid to the solved sudoku puzzle
                            buttons[i]?!.title = String(charArray[2*i])
                        }
                    }
                    else {
                        //the Not Possible text displays because no valid sudoku puzzle exists
                        self.notPossible.isHidden = false
                    }
                }
                
            }
        }
        
    }
    
    //this gets called when the clear button is clicked
    @IBAction func clearGrid(_ sender: Any) {
        numbersInGrid = Array(repeating: "0", count: 81)
        
        notPossible.isHidden = true
        let buttons = [0: button0, 1: button1, 2: button2, 3: button3, 4: button4, 5: button5, 6: button6, 7: button7, 8: button8, 9: button9, 10: button10, 11: button11, 12: button12, 13: button13, 14: button14, 15: button15, 16: button16, 17: button17, 18: button18, 19: button19, 20: button20, 21: button21, 22: button22, 23: button23, 24: button24, 25: button25, 26: button26, 27: button27, 28: button28, 29: button29, 30: button30, 31: button31, 32: button32, 33: button33, 34: button34, 35: button35, 36: button36, 37: button37, 38: button38, 39: button39, 40: button40, 41: button41, 42: button42, 43: button43, 44: button44, 45: button45, 46: button46, 47: button47, 48: button48, 49: button49, 50: button50, 51: button51, 52: button52, 53: button53, 54: button54, 55: button55, 56: button56, 57: button57, 58: button58, 59: button59, 60: button60, 61: button61, 62: button62, 63: button63, 64: button64, 65: button65, 66: button66, 67: button67, 68: button68, 69: button69, 70: button70, 71: button71, 72: button72, 73: button73, 74: button74, 75: button75, 76: button76, 77: button77, 78: button78, 79: button79, 80: button80]
        
        //clears the contents of the sudoku grid
        for i in Range(0...80) {
            buttons[i]?!.title = ""
        }
        
        //clears the statements produced by any previous call to "solve"
        smtFile = ""
        smtStatements = [String]()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

}
