//
// Created by mss4clj on 27.09.2017.
//

#ifndef INC_2_LINKEDLISTS_NODE_H
#define INC_2_LINKEDLISTS_NODE_H


template<class TElement>
class Node {
public:
    TElement el;
    Node *next;

    Node(TElement el);

    bool operator==(Node<TElement> &other) {
        return this->el == other.el;
    }

    bool operator==(TElement &other) {
        return this->el == other;
    }
};


#endif //INC_2_LINKEDLISTS_NODE_H
