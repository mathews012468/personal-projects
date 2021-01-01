#include <iostream>
#include <fstream>
#include <string>
#include <vector>

int main() {
	std::ifstream checkit;
	std::vector<int> sudoku(81);
	checkit.open("output.txt");
	std::string s;
	int n;
	int i = 0;
	checkit >> s;
	std::ofstream grid;
	grid.open("filledGrid.txt", std::ofstream::out | std::ofstream::trunc);
	if (s == "sat") {
	char ch;
	while (!checkit.eof()) {
		checkit >> s;
		checkit >> n;
		if (i < 81) {
			sudoku[i] = n;
		}
		i++;
		checkit >> s;
	}

	for (int i = 0; i < 9; i++) {
		for (int j = 0; j < 9; j++) {
			std::cout << sudoku[9*i+j] << " ";
			grid << sudoku[9*i+j] << " ";
		}
		std::cout << "\n";
	}
	}
	else {
		std::cout << "no such sudoku grid exists" << std::endl;
		grid << "no such sudoku grid exists\n";
	}
}	
