#include<stdio.h>
int main(){
    char st[1000];
    int c=0;
    int d=0;
    printf("Enter a String: \n");
    scanf("%s",&st);
    while (st[c]!='\0'){
        if(st[c]=='/'){
            d=d+1;}
        c=c+1;
    }
    printf("\n %d",d+1);
}