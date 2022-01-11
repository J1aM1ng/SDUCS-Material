#include <cstdio>
#include <stdlib.h>
#include <iostream>
using namespace std;
void Bubble(int* array, int number);
void Insert(int* array, int number);
void Radix(int* array, int number);

int main() {
	cout<<"Input"<<endl;
	int number = 0;
	int ccnn = 0;
	int storeArray[20];
	cin>>ccnn;
	while (ccnn != 0) {
		storeArray[number++] = ccnn;
		cin>>ccnn;
	}
	cout<< "1-Bubble Sort,2-Insert Sort,3-Radix Sort"<<endl;
	cin>>ccnn;
	cout<< "Output"<<endl;
	if (ccnn == 1) {
		cout<< "Bubble Sort"<<endl;
		Bubble(storeArray, number);
	}
	if (ccnn == 2) {
		cout<< "Insert Sort"<<endl;
		Insert(storeArray, number);
	}
	if (ccnn == 3) {
		cout<< "Radix Sort"<<endl;
		Radix(storeArray, number);
	}
	cout<< "End"<<endl;
	return 0;
}

void Bubble(int* array, int number) {
	for (int i = number - 1; i > 0; i--) {
		for (int j = 0; j < i; j++) {
			if (array[j] > array[j + 1]) {
				int tmp = array[j];
				array[j] = array[j + 1];
				array[j + 1] = tmp;
			}
		}
	}
	for (int i = 0; i < number - 1; i++) {
		cout<< array[i];
	}
	cout<< array[number - 1]<<endl;
}

void Insert(int* array, int number) {
	for (int i = 1; i < number; i++) {
		int k = array[i];
		for (int j = i - 1; j >= 0; j--) {
			if (array[j] > k) array[j + 1] = array[j];
			else {
				array[j + 1] = k;
				break;
			}
		}
	}
	for (int i = 0; i < number - 1; i++) {
		cout<< array[i];
	}
	cout << array[number - 1] << endl;
}

void Radix(int* array, int number) {
	for (int i = 0; i < number; i++) {
		if (array[i] >= 10) {
			cout << 0 << endl;;
			return;
		}
	}
	int* storeBox = (int*)calloc(10, sizeof(int));
	for (int i = 0; i < number; i++) {
		storeBox[array[i]]++;
	}
	int count = 0;
	for (int i = 0; i < 10; i++) {
		while (storeBox[i]--) {
			array[count++] = i;
		}
	}
	for (int i = 0; i < number - 1; i++) {
		cout<< array[i];
	}
	cout<< array[number - 1]<<endl;
}