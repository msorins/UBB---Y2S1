//
// Created by mss4clj on 27.09.2017.
//

#include "Node.h"

template<class TElement>
Node<TElement>::Node(TElement el) {
    this->el = el;
    this->next = nullptr;
}

template class Node<int>;