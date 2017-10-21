//
// Created by mss4clj on 27.09.2017.
//

#include "SLL.h"

template<class TElement>
SLL<TElement>::SLL() {
    this->head = nullptr;
}

template<class TElement>
Node<TElement> *SLL<TElement>::getHead() {
    return this->head;
}

template<class TElement>
void SLL<TElement>::push_back(TElement el) {
    if(head == nullptr) {
        //SLL is empty
        head = new Node<TElement>(el);
    } else {
        //Otherwise
        //Find the last node
        Node<TElement> *crtNode = this->head;
        while(crtNode->next != nullptr) {
            crtNode = crtNode->next;
        }

        //Add the new node
        Node<TElement> *newNode = new Node<TElement>(el);
        crtNode->next = newNode;
    }
}

template<class TElement>
bool SLL<TElement>::erase(Node<TElement> *node) {
    if(head == nullptr) {
        //SSL is empty
        return false;
    }

    if(head == node) {
        //If the head is the node that must be erased
        Node<TElement> *aux = this->head;
        this->head = this->head->next;

        delete aux;
        return true;
    }

    //Find the node in order to erase it
    Node<TElement> *last, *crt;
    last = this->head; crt = this->head;

    while(crt != node) {
        if(crt->next == nullptr)
            return false;

        last = crt;
        crt = crt->next;
    }

    last->next = crt->next;
    delete crt;
    return true;
}

template<class TElement>
bool SLL<TElement>::erase(Node<TElement> *last, Node<TElement> *crt) {
    last->next = crt->next;
    delete crt;
    return true;
}

template<class TElement>
void SLL<TElement>::push_front(TElement el) {
    Node<int> *newNode = new Node<int>(el);
    newNode->next = this->head;
    this->head = newNode;
}

template<class TElement>
int SLL<TElement>::size() {
    int n = 0;
    Node<TElement> *node = this->head;

    while(node != nullptr) {
        n++;
        node = node->next;
    }

    return n;
}

template<class TElement>
void SLL<TElement>::push_back(Node<TElement> *node) {
    Node<TElement> *newNode = new Node<int>(node->el);
    if(head == nullptr) {
        //SLL is empty
        head = newNode;
    } else {
        //Otherwise
        //Find the last node
        Node<TElement> *crtNode = this->head;
        while(crtNode->next != nullptr) {
            crtNode = crtNode->next;
        }

        //Add the new node
        crtNode->next = newNode;
    }
}

template class SLL<int>;