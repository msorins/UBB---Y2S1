#include <iostream>
#include "SLL.h"

using namespace std;

/*
 * 6. a. Add an element at the end of a list.
 *    b. Concatenate two lists.
 */

void pc_a( Node<int> *crtNode, int elem) {
    if(crtNode->next == nullptr)  {
        crtNode->next = new Node<int>(elem);
        return;
    }

    pc_a(crtNode->next, elem);
}

void pc_a_warp() {
    int nr;
    SLL<int> sll;

    for(int i = 1; i <= 5; i++) sll.push_back(i);

    cout<<"Number: ";
    cin>>nr;

    if(sll.size() == 0) {
        sll.push_back(nr);
    } else {
        pc_a(sll.getHead(), nr);
    }

    Node<int> *node = sll.getHead();
    while(node) {
        cout << node->el << " ";
        node = node->next;
    }
    cout<<"\n";

}

void pc_b(Node<int> *nodeA, Node<int> *nodeB) {
    if(nodeA->next != nullptr)
        pc_b(nodeA->next, nodeB);
    else {
        nodeA->next = nodeB;
    }
}

void pc_b_warp() {
    SLL<int> sllA, sllB;

    for(int i = 1; i <= 50; i++) sllA.push_back(i);
    for(int i = 51; i <= 100; i++) sllB.push_back(i);

    pc_b(sllA.getHead(), sllB.getHead());

    Node<int> *node = sllA.getHead();
    while(node) {
        cout << node->el << " ";
        node = node->next;
    }
    cout<<"\n";
}

int main() {
    SLL<int> sll;
    pc_a_warp();
    pc_b_warp();

    return 0;
}