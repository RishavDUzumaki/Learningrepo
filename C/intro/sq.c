#include<stdio.h>
int main(){
    int abs(int);
    int d;
    char temp;

    scanf("%d",&d);
    for(int i=0;i<=2*d;i=i+1){
        for (int j=0;j<=2*d;j=j+1){
            if (i==0||i==(2*d)||(j==0)||(j==(2*d))||((j==d)&&(i==d))||(abs(i-d)+abs(j-d)==(d-1))){
                printf("* ");}
            else{
                printf("  ");
            }
        }
     printf("\n");
    }
    scanf("%c",&temp);
}
int abs(int x){
    if (x>0) {
        return x;
    }
    else{
        return (-1)*(x);
    }
}
