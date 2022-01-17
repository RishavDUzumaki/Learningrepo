#include<stdio.h>
int main(){
    int x,*y;
    y=&x;
    scanf("%d",y);
    printf("The val is %d",x);
}