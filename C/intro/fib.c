#include<stdio.h>
int main(){
    int d;
    int fib(int);
    printf("Enter the number for which u want the dammn fibbonaci: ");
    scanf("%d",&d);
    printf("\n %d",fib(d));

}
int fib(int n){
    int arr[n];
    arr[0]=1;
    arr[1]=1;
    if (n>=2){
      for(int i=2;i<=n;i=i+1){
          arr[i]= arr[i-1]+arr[i-2];
      }
    }
    return arr[n];
}