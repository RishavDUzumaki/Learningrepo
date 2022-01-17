import emoji
def space(n):
    s=""
    for k in range(0,n+2):
        s=s+" "
    return s
def line(n):
    s=""
    for k in range(0,(n-1)):
        s=s+"\n"
    return s
d=int(input("Enter a number : "))
for i in range(0,2*d+1):
    for j in range (0,2*d+1):
        if (i==0 or i==(2*d)  or (j==0)or(j==(2*d)) or((j==d) and (i==d)) or (abs(i-d)+abs(j-d)==(d-1))):
            print(emoji.emojize(':red_heart:')+"   ",end="")
        else:
            print("    ",end="")
    print("\n")