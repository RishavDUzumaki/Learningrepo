from ctypes import sizeof
import numpy as np
a=np.array([1,3,4])
b=np.array([5,6,7])
def a(l):
    return np.array(l)
def merge(l1,l2):
    if len(l1)==0:
        return l2
    if len(l2)==0:
        return l1
    else:
        if l1[0]<=l2[0]:
            return [l1[0]]+merge(l1[1:],(l2))
        if l1[0]>=l2[0]:
            return [l2[0]]+merge(l2[1:],l1)
def mergesort(l1):
    if len (l1)==0:
        return ([])
    if len(l1)==1:
        return ([l1[0]])
    else:
        return merge(mergesort(l1[0:int((len(l1)/2))]),mergesort(l1[int((len(l1)/2)):]))
l=[]
for i in range(0,5):
    l.append(int(input("")))
print(mergesort((l)))