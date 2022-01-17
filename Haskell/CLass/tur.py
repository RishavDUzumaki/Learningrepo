import turtle
import math
b=turtle.Turtle()
w=turtle.Screen()
b.screen.colormode(255)
w.bgcolor("black")
n=int(input("Enter the number of sides: "))
m=int(input("Enter how much denseness do u want: "))
angle=180-(180*(n-2))/n
for j in range(0,m):
   b.color((255-25*j,30+25*j,30+25*j),(255-25*j,30+25*j,30+25*j))
   b.begin_fill()
   for i in range (0,n):
       b.forward((200)/(math.log(j+3)))
       b.left(angle)
   b.end_fill()
turtle.done()