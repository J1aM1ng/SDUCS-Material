#include <iostream>
#include <cmath>
#include <string>
#include <cstring>
#include <vector>
#include <algorithm>
using namespace std;
struct treeNode {
	char treeNode_value;
	treeNode* leftChild;
	treeNode* rightChild;
	treeNode(){
		leftChild = rightChild = NULL;
	}
};
class binaryTree {
private:
	treeNode* rootNode;
	int treeHeight;
	int treeLayer;
	int index_checked;
	int calc_layer(int treeHeight){
		return ceil(log2(treeHeight + 1));
	}
	string ceBreakLeft(const string& ce, char rootNode_value){
		string tempStr;
		int i = 0;
		while (ce.at(i) != rootNode_value) { i++; }
		tempStr.append(ce, 0, i);
		return tempStr;
	}
	string ceBreakRight(const string& ce, char rootNode_value){
		string tempStr;
		int i = 0;
		while (ce.at(i) != rootNode_value) { i++; }
		tempStr.append(ce, i + 1, ce.size() - 1 - i);
		return tempStr;
	}
	string befBreak_leftRight(const string& bef, const string& ce_leftlRight){
		string tempStr;
		vector<int> index_Array;
		for (int i = 0; i < ce_leftlRight.size(); i++) {
			for (int j = 0; j < bef.size(); j++) {
				if (bef.at(j) == ce_leftlRight.at(i)) { index_Array.push_back(j); }
			}
		}
		sort(index_Array.begin(), index_Array.end());
		tempStr.append(bef, index_Array[0], ce_leftlRight.size());
		return tempStr;
	}
	void bef_trave(treeNode* biTreeNode){
		if (biTreeNode != NULL){
			cout << biTreeNode->treeNode_value << ((this->index_checked < this->treeHeight - 1) ? "," : "");
			this->index_checked++;
			if (this->index_checked == this->treeHeight) { cout << endl; }
			bef_trave(biTreeNode->leftChild);
			bef_trave(biTreeNode->rightChild);
		}
	}
	void me_trave(treeNode* biTreeNode){
		if (biTreeNode != NULL){
			me_trave(biTreeNode->leftChild);
			cout << biTreeNode->treeNode_value << ((this->index_checked < this->treeHeight - 1) ? "," : "");
			this->index_checked++;
			if (this->index_checked == this->treeHeight) { cout << endl; }
			me_trave(biTreeNode->rightChild);
		}
	}
	void af_trave(treeNode* biTreeNode){
		if (biTreeNode != NULL){
			af_trave(biTreeNode->leftChild);
			af_trave(biTreeNode->rightChild);
			cout << biTreeNode->treeNode_value << ((this->index_checked < this->treeHeight - 1) ? "," : "");
			this->index_checked++;
			if (this->index_checked == this->treeHeight) { cout << endl; }
		}
	}
	void tree_generate(treeNode* biTreeNode, const string& bef, const string& ce, int base_Index){
		if (base_Index == 0 && bef.size() == 2){
			this->rootNode[0].treeNode_value = bef.at(0);
			this->rootNode[1].treeNode_value = bef.at(1);
			if (ce.at(0) == bef.at(0)) { this->rootNode[0].rightChild = rootNode + 1; }
			else { this->rootNode[0].leftChild = rootNode + 1; }
			return;
		}
		int tempIndex = base_Index;
		string ce_left, ce_right, bef_left, bef_right;
		if (bef.size() == 1 && bef == ce){
			ce_left = ce_right = bef_left = bef_right = "";
		}
		else{
			ce_left = ceBreakLeft(ce, bef.at(0)),
				ce_right = ceBreakRight(ce, bef.at(0)),
				bef_left = befBreak_leftRight(bef, ce_left),
				bef_right = befBreak_leftRight(bef, ce_right);
		}
		biTreeNode->treeNode_value = bef.at(0);
		if (ce_left.size() > 0) {biTreeNode->leftChild = ++tempIndex + this->rootNode;}
		if (ce_right.size() > 0) { biTreeNode->rightChild = ++tempIndex + this->rootNode; }
		if (ce_left.size() > 0) { tree_generate(biTreeNode->leftChild, bef_left, ce_left, tempIndex); }
		if (ce_right.size() > 0) { tree_generate(biTreeNode->rightChild, bef_right, ce_right, tempIndex); }
	}
public:
	binaryTree(const string& bef, const string& me){
		this->treeHeight = bef.size();
		this->rootNode = new treeNode[this->treeHeight];
		tree_generate(this->rootNode, bef, me, 0);
	}
	~binaryTree(){
		delete[]this->rootNode;
	}
	binaryTree(const string& str){
		int tempCount = 0;
		this->treeHeight = str.size();
		this->rootNode = new treeNode[this->treeHeight];
		this->treeLayer = calc_layer(this->treeHeight);
		for (int i = 0; i < this->treeLayer; i++) {
			for (int k = 0; k < pow(2, i) && tempCount < this->treeHeight; k++) {
				rootNode[k + (int)pow(2, i) - 1].treeNode_value = str.at(k + (int)pow(2, i) - 1);
				if (2 * (k + pow(2, i) - 1) + 1 < this->treeHeight) { rootNode[k + (int)pow(2, i) - 1].leftChild = rootNode + 2 * (k + (int)pow(2, i) - 1) + 1; }
				if (2 * (k + pow(2, i) - 1) + 2 < this->treeHeight) { rootNode[k + (int)pow(2, i) - 1].rightChild = rootNode + 2 * (k + (int)pow(2, i) - 1) + 2; }
				tempCount++;
			}
		}
	}
	
	void bef_trave(){
		this->index_checked = 0;
		bef_trave(this->rootNode);
	}
	void me_trave(){
		this->index_checked = 0;
		me_trave(this->rootNode);
	}
	void af_trave(){
		this->index_checked = 0;
		af_trave(this->rootNode);
	}
	void level_trave(){
		for (int i = 0; i < this->treeHeight; i++) cout << this->rootNode[i].treeNode_value << ((i == this->treeHeight - 1) ? "" : ",");
		cout << endl;
	}
	void print_heightNum(){
		cout << this->treeHeight << endl;
	}
	void print_layerNum(){
		cout << this->treeLayer << endl;
	}
};
int main(int argc, char* argv[]){
	string inputStr, bef_trave, me_trave;
	cout << "Input1" << endl;
	cin >> inputStr;
	binaryTree biTree_01(inputStr);
	cout << "Output1" << endl;
	biTree_01.bef_trave();
	biTree_01.me_trave();
	biTree_01.af_trave();
	biTree_01.print_heightNum();
	biTree_01.print_layerNum();
	cout << "Input2" << endl;
	cin >> bef_trave >> me_trave;
	binaryTree biTree_02(bef_trave, me_trave);
	cout << "Output2" << endl;
	biTree_02.af_trave();
	biTree_02.level_trave();
	cout << "End";
	return 0;
}