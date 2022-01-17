import turtle
import math
p=turtle.Turtle()
s=turtle.Screen()
def state():
    pos=p.position()
    pos1=(pos[0]-500,pos[1])
    p.penup()
    p.setpos(pos1)
    p.pendown()
    p.speed(0)
    p.pensize(5)
    p.shape("circle")
    p.color("red")
    p.pencolor("white")
    p.turtlesize(5)
state()
posit=p.position()
floor = posit[1]
gravity=1
u_x=5
u_y=2
uin=u_y
res=1.1
col=0
nc=0
for i in range(0,1000):
    (x,y)=p.position()
    if (y>floor):
        p.setheading(math.degrees(math.atan(u_y/u_x)))
        p.forward((u_x**2+u_y**2)**(1/2))
        u_y=u_y-gravity
        col=1
    if (y==floor):
        if (col==1):
           nc=nc+1
           u_y =((res)**(nc))*uin
        p.setheading(math.degrees(math.atan(u_y/u_x)))
        p.forward((u_x**2+u_y**2)**(1/2))
    if (y<floor):
        nc=nc+1
        po= p.position()
        p.setpos((po[0],floor))
        u_y=((res)**(nc))*uin
        col=0



turtle.done()
