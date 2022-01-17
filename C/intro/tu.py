import turtle
import math
p=turtle.Turtle()
s=turtle.Screen()
p.speed(0)
s.bgcolor('black')
#p.screen.colormode(255)
p.pencolor('white')
for i in range (0,600):
    p.pencolor((0.5+i/1200,0.5+i/1200,1-i/600))
    p.forward(200*math.sqrt(0.5*i))
    p.left(161)
turtle.done()