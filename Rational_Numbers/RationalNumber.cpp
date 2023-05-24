#include <iostream>
using namespace std;

class Rational{
    public:
    int p;
    int q;

    Rational(int x = 0, int y = 1){
        p = x;
        q = y;
    }
    
    bool is_rational(){
        if(this->q == 0){
            return false;
        }

        return true;
    }

    void print_rational(){
        if(this->is_rational()){
            cout<<"Rational("<<this->p<<"/"<<this->q<<")";
        }
        else{
            cout<<"Invalid Rational Number";
        }
    }
};

Rational operator + (Rational& r1, Rational& r2){
    if(!r1.is_rational() || !r2.is_rational()){
        Rational temp(0,0);
        return temp;
    }
    int p, q;
    if(r1.q != r2.q){
        p = r1.p*r2.q + r2.p*r1.q;
        q = r1.q*r2.q;
    }
    else{
        p = r1.p + r2.p;
        q = r1.q;
    }

    Rational result(p,q);

    return result;
}

Rational operator - (Rational& r1, Rational& r2){
    if(!r1.is_rational() || !r2.is_rational()){
        Rational temp(0,0);
        return temp;
    }

    int p, q;
    if(r1.q != r2.q){
        p = r1.p*r2.q - r2.p*r1.q;
        q = r1.q*r2.q;
    }
    else{
        p = r1.p - r2.p;
        q = r1.q;
    }

    Rational result(p,q);
    return result;
}

Rational operator * (Rational& r1, Rational& r2){
    if(!r1.is_rational() || !r2.is_rational()){
        Rational temp(0,0);
        return temp;
    }

    int p = r1.p * r2.p;
    int q = r1.q * r2.q;
    Rational result(p, q);

    return result;
}

Rational operator / (Rational& r1, Rational& r2){
    Rational temp(0,0);
    if(!r1.is_rational() || !r2.is_rational()){
        return temp;
    }
    int p = r1.p * r2.q;
    int q = r1.q * r2.p;
    
    Rational result(p, q);
    if(!result.is_rational()){
        return temp;
    }

    return result;
}

void print_arithmetic(Rational r1, Rational r2, Rational r3, string s){
    r1.print_rational();
    cout<<s;
    r2.print_rational();
    cout<<" = ";
    r3.print_rational();
    cout<<"\n";
}

int main(){
    int a, b, c, d;

    cout<<"Rational(a, b) :\nEnter a = ";
    cin>>a;
    cout<<"Enter b = ";
    cin>>b;
    cout<<"Rational(c, d) :\nEnter c = ";
    cin>>c;
    cout<<"Enter d = ";
    cin>>d;

    Rational r1(a,b);
    Rational r2(c,d);
    
    Rational r3 = r1 + r2;
    Rational r4 = r1 - r2;
    Rational r5 = r1 * r2;
    Rational r6 = r1 / r2;

    r1.print_rational(); cout<<endl;

    r2.print_rational(); cout<<endl;

    print_arithmetic(r1, r2, r3, " + ");
    print_arithmetic(r1, r2, r4, " - ");
    print_arithmetic(r1, r2, r5, " * ");
    print_arithmetic(r1, r2, r6, " / ");

    return 0;
}
