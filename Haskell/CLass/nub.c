#include<stdio.h>
int main(){
    int m,n;
    printf("Enter size of A and B in m n format: ");
    scanf("%d %d",&m,&n);
    int a[m],b[n];
    int q[m+n];
    for(int i=0;i<m;i=i+1){
        printf("\nEnter for A: ");
        scanf("%d",&a[i]);
        printf("\n");
    }
    for(int i=0;i<n;i=i+1){
    printf("\nEnter for B: ");
    scanf("%d",&b[i]);
    printf("\n");
    }
    for(int i=0;i<m;i=i+1){
        q[i]=a[i];
    }
    for(int i=m;i<m+n;i=i+1){
        q[i]=b[(i-m)];
    }
    for(int i=0;i<m+n;i=i+1){
        printf("%d ",q[i]);
    }
    int c[m+n];
    int d[m+n];
    int u=0;
    int v=0;
    int t=0;
    while (u<(m+n)){
        for(int i=0;i<v;i=i+1){
            if (q[u]==c[i]){
                d[i]=d[i]+1;
                t=1;
                break;
            }
        }
        if (t==0){
            d[v]=1;
            c[v]=q[u];
            v=v+1;
        }
        u=u+1;
        t=0;
    }
printf("\n");
int r=0;
 while(r<v){
     printf("%d ",c[r]);
     r=r+1;
 }
printf("\n");
r=0;
 while(r<v){
     printf("%d ",d[r]);
     r=r+1;
 }
} 