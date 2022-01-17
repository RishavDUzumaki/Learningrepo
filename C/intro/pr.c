#include<stdio.h>
int main (){
    int inp;
    void tri (int);
    printf("Enter a number!!");
    scanf("%d",&inp);
    tri(inp);
    return 0;
}
void tri(int a){
    int i;
    int j;
    for (i=1;i<=a;i=i+1){
        for (j=1;j<=i;j=j+1){
            printf("%d ",j);
        }
        printf("\n");
    }


}