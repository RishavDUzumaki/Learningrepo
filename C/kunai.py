from manim import *
import numpy as np
from pathlib import Path
import os

FLAG=f"-pql"
SCENE="Scene1"

if __name__=="__main__":
    script=f"{Path(__file__).resolve()}"
    os.system(f"manim {script} {SCENE} {FLAG}")
class Scene1(Scene):
    def construct(self):
        arowhead=ArcPolygon([1,0.15,0],[1,-0.15,0],[2.5,-1,0],[6,0,0],[2.5,1,0],angle=20*DEGREES).set_fill([WHITE,GREY,WHITE],opacity=1)
        line1=Line([1,0,0],[6,0,0])
        line1.set_color(BLACK)
        base=Polygon([1,0.15,0],[1,-0.15,0],[-3.5,-0.15,0],[-3.5,0.15,0],color=GOLD).set_fill([GOLD,WHITE,GOLD],opacity=1)
        circl = Annulus(inner_radius=0.5, outer_radius=0.7).next_to(base,LEFT,buff=0).set_fill([WHITE,GREY,WHITE],opacity=1)
        #circ=Circle()
        self.add(base,arowhead,line1,circl)
        #winds=[Line([1,1.4,0],[-1,1.4,0]),Line([1,-1.4,0],[-1,-1.4,0]),Line([1.5,2,0],[-1,2,0]),Line([1.5,-2,0],[-1,-2,0])]
        wind1=Line([1,1.4,0],[-1,1.4,0])
        wind2=Line([1,-1.4,0],[-1,-1.4,0])
        wind3 =Line([1.5,2,0],[-1,2,0])
        wind4=Line([1.5,-2,0],[-1,-2,0])
        wind5=Line([-2,-2.5,0],[-1,-2.5,0])
        wind6=Line([-2,2.5,0],[-1,2.5,0])
        wind7=Line([-3,-2.75,0],[-2,-2.75,0])
        wind8=Line([-3,2.75,0],[-2,2.75,0])
        self.wait(4)
        self.add(wind1,wind2,wind3,wind4,wind5,wind6,wind7,wind8)
        for i in range(0,100):
            self.play(wind1.animate.shift(LEFT*80),wind2.animate.shift(LEFT*80),wind3.animate.shift(LEFT*80),wind4.animate.shift(LEFT*80),wind5.animate.shift(LEFT*80),wind6.animate.shift(LEFT*80),wind7.animate.shift(LEFT*80),wind8.animate.shift(LEFT*80),base.animate.shift(RIGHT*40),arowhead.animate.shift(RIGHT*40),line1.animate.shift(RIGHT*40),circl.animate.shift(RIGHT*40),run_time=1.7)
            self.wait(0.01)
            wind1.to_edge(RIGHT,buff=-7)
            wind2.to_edge(RIGHT,buff=-7)
            wind3.to_edge(RIGHT,buff=-6)
            wind4.to_edge(RIGHT,buff=-6)
            wind5.to_edge(RIGHT,buff=-5)
            wind6.to_edge(RIGHT,buff=-5)
            wind7.to_edge(RIGHT,buff=-8)
            wind8.to_edge(RIGHT,buff=-8)
            arowhead.to_edge(LEFT,buff=-4)
            base.next_to(arowhead,LEFT,buff=0)
            line1.to_edge(LEFT,buff=-4)
            circl.next_to(base,LEFT,buff=0)
        self.play(base.animate.shift(RIGHT*60),arowhead.animate.shift(RIGHT*60),line1.animate.shift(RIGHT*60),circl.animate.shift(RIGHT*60))    
        #self.add(winds)
        self.wait(0.1)
