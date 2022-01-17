#include<stdio.h>
int main(){
    int p(int);
    int b;
    scanf("%d",&b);  
    printf("The ith prime is %d",p(b-1));

}
int p(int x){
    int primes[100000];
    primes[0]=2;
    for (int j=1;j<=x;j=j+1){
      int u=(primes[j-1])+1;
      int r=0;
      while (r==0){
          for(int i=0;i<=(j-1);i=i+1){
              if ((u%(primes[i]))==0){
                  break;}
              else{
                    if (i==(j-1)){
                        primes[j]=u;
                        r=1;
                    }
                    else{
                        continue;}  
                  }
              }
          u=u+1;
      }
    }
    return primes[x];
}