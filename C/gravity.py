from manim import *
class Sce(Scene):
    def construct(self):
        background = ImageMobject("C:/Users/risha/Downloads/stars-2643089")
        self.add(background)
        self.bring_to_back(background)
        m1=1
        m2=2
        u_1=[0,1,0]
        u_2=[0,-1/2,0]
        g=3
        s=0.5
        dt=0.1
        r_i=4*s
        title=Tex("Double Mass Gravitational Simultaion -By Rishav Gupta").to_edge(UP).set_fill(YELLOW_A)
        b1=Circle(m1*s).to_edge(LEFT,buff=3).set_color([ORANGE,WHITE,ORANGE,WHITE,ORANGE]).set_fill([ORANGE,WHITE,ORANGE,WHITE,ORANGE],opacity=1)
        b2=Circle(s*m2**(1/2)).next_to(b1,RIGHT,buff=r_i).set_color([BLUE_A,BLUE_B,BLUE_C,WHITE]).set_fill([BLUE_A,BLUE_B,BLUE_C,WHITE],opacity=1)
        lin=always_redraw(
            lambda: Line(
                b1.get_center(),b2.get_center()
                 ).set_opacity(0)
                )
        self.play(Create(title),run_time=3)
        self.add(b1,b2,lin)
        for i in range(0,1000):
            self.play(b1.animate.shift(RIGHT*u_1[0]*dt+UP*u_1[1]*dt),b2.animate.shift(RIGHT*u_2[0]*dt+UP*u_2[1]*dt),run_time=dt)
            r=lin.get_length()
            p1=b1.get_center()
            p2=b2.get_center()
            u_1[0]=u_1[0]+dt*g*m2*(p2[0]-p1[0])/(r**(3))
            u_1[1]=u_1[1]+dt*g*m2*(p2[1]-p1[1])/(r**(3))
            u_2[0]=u_2[0]+dt*g*m1*(p1[0]-p2[0])/(r**(3))
            u_2[1]=u_2[1]+dt*g*m1*(p1[1]-p2[1])/(r**(3))