#include <iostream>
#include <fstream>
#include <string>

int main() {
	std::ifstream getData;
	std::ifstream asserts;
	std::ofstream writeData;
	getData.open("sudoku.smt2");
	asserts.open("extraAssertions.txt");
	writeData.open("sudoku2.smt2", std::ofstream::out | std::ofstream::trunc);
	std::string s;

	while (!getData.eof()) {
		getline(getData,s);
		writeData << s << "\n";
		if (s == ";specific to my puzzle") {
			while (!asserts.eof()) {
				getline(asserts,s);
				writeData << s << "\n";
			}
		}
	}
}
