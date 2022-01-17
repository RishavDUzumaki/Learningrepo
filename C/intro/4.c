#include<stdio.h>
int main(){
    int n;
    scanf("%d",&n);
    for(int i=0;i<=n;i=i+1){
        for(int j=0;j<=n+i;j=j+1){
            if ((i+j<n)||((i+j-n)%2 != 0)){
                printf("   ");
            }
            else
             printf("%d  ",(i*(i+1)/2+((i+j-n)/2)+1));
        }
        printf("\n");
    }
}