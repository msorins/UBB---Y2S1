//
// Created by mss4clj on 27.09.2017.
//

#ifndef INC_2_LINKEDLISTS_SLL_H
#define INC_2_LINKEDLISTS_SLL_H


#include "Node.h"

template<class TElement>
class SLL {
private:
    Node<TElement> *head;

public:
    //Constructor
    SLL();

    //Functionality
    Node<TElement>* getHead();
    void push_back(TElement el);
    void push_back(Node<TElement> *node);
    void push_front(TElement el);
    bool erase(Node<TElement> *node);
    bool erase(Node<TElement> *last, Node<TElement> *crt);
    int size();

};



#endif //INC_2_LINKEDLISTS_SLL_H
