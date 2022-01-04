#include <iostream>
using namespace std;
void Swap(int& a, int& b);
void Perm(int listArray[], int dep, int len);

int main() {
	int listArray[20];
	int count = 0;
	cout << "Input" << endl;
	for (int i = 0; i < 20; i++) {
		int temp;
		cin >> temp;
		if (temp == 0)break;
		listArray[i] = temp;
		count++;
	}
	cout << "Output" << endl;
	Perm(listArray, 0, --count);
	cout << "end" << endl;
	return 0;
}

void Swap(int& a, int& b) {
		int temp;
		temp = a;
		a = b;
		b = temp;
}

void Perm(int listArray[], int dep, int len) {
	if (dep == len)
	{
		for (int i = 0; i <= len; i++) {
			cout << listArray[i];
			if (i != len)cout << ',';
		}
		cout << endl;		
	}
	else {
		for (int i = dep; i <= len; i++)
		{
			Swap(listArray[i], listArray[dep]);
			Perm(listArray, dep + 1, len);
			Swap(listArray[i], listArray[dep]);
		}
	}
}

