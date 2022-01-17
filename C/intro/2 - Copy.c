#include<stdio.h>
int main(){
    int factorial(int);
    int nCr(int,int);
    int n;
    printf("Enter a number!!: ");
    scanf("%d",&n);
    printf("\n");
    for(int i = 0;i<=n;i=i+1){
        printf("\n");
        for(int j =0;j<=(n+i);j=j+1){
            if (j<(n-i) || ((j+i-n)%2==1)) 
             printf(" ");
            else
             printf("%d",nCr(i,(i+j-n)/2));
        }
    }
}
int factorial(int n) {
    int factorial = 1;
    for (int i = 2; i <= n; i++)
        factorial = factorial * i;
    return factorial;
}
 
int nCr(int n, int r) {
    return factorial(n) / (factorial(r) * factorial(n - r));
}