# include <iostream>
using namespace std;

int factorial (int n){
    
    if (n == 1)
        return 1;
    return n * factorial(n - 1);
}

int main(){

    cout << "before" << endl;
    int n_fact = factorial(5);
    cout << "after" << endl;
    return 0;
}

