import turtle
p=turtle.Turtle()
s=turtle.Screen()
def state():
    s.bgcolor('black')
    p.speed(0)
    p.pencolor('white')
def star(size):
    if (size<5):
        return
    else:
     for i in range (0,4):
         #p.pencolor(0.5+size/400,0.5+size/400,0.5+size/400)
         p.forward(size)
         star(size/2)
         p.left(90)
state()
star(200)
turtle.done()
