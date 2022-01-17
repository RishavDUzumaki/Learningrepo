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
    int u = y%x;
    if (x>y){
     return gcd (y,x);
    }
    else{ 
     while ( u != 0){
         int t=x;
         int s=y;
         x= u;
         y=t;
         u = y%x;
     }
     return x; 
    }  
}