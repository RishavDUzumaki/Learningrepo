#include<stdio.h>
#include<math.h>
int main(){
    int ab(int);
    int n;
    scanf("%d",&n);
    for(int i=0;i<=n;i=i+1){
        for(int j=0;j<=2*n;j=j+1){
            if (ab(j-n)<i){
               printf(" ");
            }
            else
             printf("%c",65+n-ab(j-n));
        }
        printf("\n");
    }
}
int ab(int x){
    if (x>0)
     return x;
    else
     return (-1)*x;
      
}