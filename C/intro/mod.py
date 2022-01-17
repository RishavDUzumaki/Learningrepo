import turtle
import math
p=turtle.Turtle()
s=turtle.Screen()
def state():
    s.bgcolor('black')
    p.speed(0)
    p.pencolor('white')
    p.hideturtle()
state()
for i in range(0,1000):
    if (i%6==0):
        p.pencolor(1-i/1000,0,0)
    if (i%6==1):
       p.pencolor(0,0,1-i/1000)
    if (i%6==2):
      p.pencolor(0,1-i/1000,0)
    if (i%6==3):
      p.pencolor(1-i/1000,1-i/1000,0)
    if (i%6==4):
      p.pencolor(0,1-i/1000,1-i/1000)
    if (i%6==5):
      p.pencolor(1-i/1000,0,1-i/1000)
    p.forward(i)
    #p.circle((math.log(1+i)+i)/2)
    p.left(60.099)
turtle.done()