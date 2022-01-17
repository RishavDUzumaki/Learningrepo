#include<stdio.h>
int main(){
    int gcd(int,int);
    int a;
    int b;
    printf("Enter the number for which u want to calculate the gcd in form a b: ");
    scanf("%d %d",&a,&b);
    printf("The gcd is %d",gcd(a,b));
}
int gcd(int x,int y)
{
    if (x>y){
     return gcd (y,x);
    }
    else{ 
     if (y%x==0){
         return x;
     }
     else{
         return gcd(y%x,x);
     }
    }  
}