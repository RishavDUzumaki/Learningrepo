from tkinter import TOP
from turtle import title
from manim import *
def springf(st,en):
    vg=VGroup()
    dis=en[0]-st[0]
    vg.add(Line(st,[st[0]+(dis/8),0.5,0]))
    for i in range(1,7):
        vg.add(Line([st[0]+i*(dis/8),(0.25)+((-1)**(i+1))*(0.25),0],[st[0]+(i+1)*(dis/8),(0.25)+((-1)**(i+2))*(0.25),0]))
    vg.add(Line([st[0]+7*(dis/8),(0.5),0],en))
    return vg

class Sce(Scene):
    def construct(self):
        s=1
        s2=2
        u_1=-1
        u_2=1
        k=40
        dt=0.01
        m2=(s2)**(2)
        title=Tex("Spring Mass System -By Rishav Gupta").to_edge(UP)
        block1=Polygon([-2.5,0,0],[-2.5,s,0],[s-2.5,s,0],[s-2.5,0,0]).set_color([RED,PINK,WHITE]).set_fill([RED,PINK,WHITE],opacity=1)
        block2=Polygon([4*s-2.5,0,0],[4*s-2.5,s2,0],[s2+4*s-2.5,s2,0],[s2+4*s-2.5,0,0]).set_color([RED,PINK,WHITE]).set_fill([RED,PINK,WHITE],opacity=1)
        springl=always_redraw(
            lambda: Line(
                start=block1.get_right(),end=([block2.get_left()[0],0.5,0])
                  ).set_opacity(0)
            )
        spring=always_redraw(
            lambda: springf(block1.get_right(),[block2.get_left()[0],0.5,0])
        )
        self.play(Create(title),run_time=3)
        self.add(block1,block2,spring,springl)
        for i in range(1,2000):
            self.play(block1.animate.shift(RIGHT*(u_1*(dt))),block2.animate.shift(RIGHT*(u_2*(dt))),run_time=dt)
            x=springl.get_length()-4*s
            u_2=u_2-(k/(1+m2))*(x)*(dt)
            u_1=u_1+(k*m2/(1+m2))*(x)*(dt)