#include<stdio.h>
int main(){
    int gcd(int,int);
    int a;
    int b;
    printf("Enter the number for which u want to calculate the gcd in form a b: ");
    scanf("%d %d",&a,&b);
    printf("The gcd is %d \n",gcd(a,b));
}
int gcd(int x,int y)
{
    int u = y%x;
     if (x>y) 
         return gcd(y,x);
        else
         switch (u){
             case 0:
              return x;
             default:
              return gcd(u,x);
         }
    }