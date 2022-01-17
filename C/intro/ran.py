import random
import turtle
import math
p=turtle.Turtle()
s=turtle.Screen()
def state():
    s.bgcolor('black')
    p.speed(0)
    p.pencolor('white')
    p.fillcolor('#ab7632')
    p.hideturtle()
state()
for i in range(0,250):
    #r=random.randrange(1,1000)
    #g=random.randrange(1,1000)
    #b=random.randrange(1,1000)
#use weights to manipulate colours
    p.pencolor("black")
    p.fillcolor(1,i/250,i/250)
    if (i%3==0):
      p.begin_fill()
    p.forward(400)
    p.left(152)
    if(i%3==2):
     p.end_fill()
turtle.done()