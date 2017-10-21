#include <iostream>
#include <assert.h>

bool pb1_lucky_nr(int n) {
    if(n == 0)
        return false;
    if(n % 10 == 4 || n % 10 == 7)
        return true;

    return pb1_lucky_nr(n / 10);
}
void pb1_lucky_nr_warp( ) {
    /*
     * Check if a number is lucky.
     * A number is lucky if it has digit 4 or 7 in it
     */
    assert(pb1_lucky_nr(47));
    assert(pb1_lucky_nr(74));
    assert(pb1_lucky_nr(7447));
    assert(pb1_lucky_nr(7));
    assert(!pb1_lucky_nr(2));
    assert(!pb1_lucky_nr(0));
    assert(!pb1_lucky_nr(6632));
}

void pb_3(List l, int E, int p) {
    if(p == 1 && listaEsteVida()) return l;
    else if (p == 1) return l.adaugaLaInceput(l, E);
    else if(l.esteVida() & p > 1) return null;
    return insert(l.sublista(), E, p-1).
}

void pb3_wrap() {

}

int main() {
    pb1_lucky_nr_warp();
    return 0;
}