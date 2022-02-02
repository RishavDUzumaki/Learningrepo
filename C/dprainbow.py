from manim import *
import math
def atangle(start,l,angle):
    x=start[0]
    y=start[1]
    x1=x+l*math.sin(angle)
    y1=y-l*math.cos(angle)
    return Line(start,[x1,y1,0])
class Sce(Scene):
    def construct(self):
        background = ImageMobject("C:/Users/risha/Downloads/sky.jpg")
        self.add(background)
        self.bring_to_back(background)
        colors=[[PURPLE_E,PURPLE_D,PURPLE_A,WHITE],[rgb_to_color([0.2,0,1]),rgb_to_color([0.4,0.2,1]),WHITE],[BLUE_E,BLUE_D,BLUE_A,WHITE],[GREEN_E,GREEN_D,GREEN_A,WHITE],[YELLOW_D,YELLOW_C,YELLOW_A,WHITE],[ORANGE,GOLD_B,WHITE],[RED,PINK,WHITE]]
        colo=[[PURPLE_E,PURPLE_D,PURPLE_A],[rgb_to_color([0.2,0,1]),rgb_to_color([0.4,0.2,1])],[BLUE_E,BLUE_D,BLUE_A],[GREEN_E,GREEN_D,GREEN_A],[YELLOW_D,YELLOW_C,YELLOW_A],[ORANGE,GOLD_B],[RED,PINK]]
        theta1=[math.pi/2,math.pi/2+0.01,math.pi/2+0.02,math.pi/2+0.03,math.pi/2+0.04,math.pi/2+0.05,math.pi/2+0.06]
        #theta2=[math.pi-math.pi/6,math.pi-math.pi/6,math.pi-math.pi/6,math.pi-math.pi/6,math.pi-math.pi/6,math.pi-math.pi/6,math.pi-math.pi/6]
        theta2=[math.pi/2,math.pi/2+0.01,math.pi/2+0.02,math.pi/2+0.03,math.pi/2+0.04,math.pi/2+0.05,math.pi/2+0.06]
        omega1=[0,0,0,0,0,0,0]
        omega2=[0,0,0,0,0,0,0]
        poi=[0,2,0]
        l1=2
        l2=1.5
        dt=0.025
        g=9.8
        m1=2
        m2=2
        head=Tex("Double Pendulum Rainbow").to_edge(UP).set_fill([PURPLE_A,BLUE_A,GREEN_A,YELLOW_A,GOLD_A,RED_A])
        ##########################
        def alpha1(thet1,thet2,omeg1,omeg2):
            return ((m2*l2*(omeg2**2)*(math.sin(thet2-thet1)))-((m1+m2)*g*math.sin(thet1))+(m2*(math.cos(thet2-thet1))*((l1*(omeg1**2)*(math.sin(thet2-thet1)))+(g*math.sin(thet2)))))/(((m1+m2)*l1)-(m2*l1*((math.cos(thet2-thet1))**2)))
        def alpha2(thet1,thet2,omeg1,omeg2):
            a1=((m2*l2*(omeg2**2)*(math.sin(thet2-thet1)))-((m1+m2)*g*math.sin(thet1))+(m2*(math.cos(thet2-thet1))*((l1*(omeg1**2)*(math.sin(thet2-thet1)))+(g*math.sin(thet2)))))/(((m1+m2)*l1)-(m2*l1*((math.cos(thet2-thet1))**2)))
            return (-1)*(((l1*a1*(math.cos(thet2-thet1)))+(l1*(omeg1**2)*(math.sin(thet2-thet1)))+(g*(math.sin(thet2))))/(l2))
        ###################
        r1s=[]
        r2s=[]
        b1s=[]
        b2s=[]
        pats=[]
        #for j in range(0,7):
            #rod1=always_redraw(lambda: atangle(poi,l1,theta1[j]).set_stroke(width=1,color=YELLOW_A,opacity=1))
            #rod2=always_redraw(lambda: atangle(r1s[j].get_end(),l2,theta2[j]).set_stroke(width=1,color=YELLOW_A,opacity=1))
            #bob1=always_redraw(lambda: Dot(r1s[j].get_end(),m1*(0.1)).set_fill(colors[j]))
            #bob2=always_redraw(lambda: Dot(r2s[j].get_end(),m2*(0.1)).set_fill(colors[j]))
            #pat=TracedPath(b2s[j].get_center,stroke_color=colors[j], dissipating_time=0.5, stroke_opacity=[0.6, 1])
            
        r01=(always_redraw(lambda: atangle(poi,l1,theta1[0]).set_stroke(width=1,color=YELLOW_A,opacity=1)))
        r02=(always_redraw(lambda: atangle(r01.get_end(),l2,theta2[0]).set_stroke(width=1,color=YELLOW_A,opacity=1)))
        b01=(always_redraw(lambda: Dot(r01.get_end(),m1*(0.1)).set_fill(colors[0])))
        b02=(always_redraw(lambda: Dot(r02.get_end(),m2*(0.1)).set_fill(colors[0])))
        pat0=(TracedPath(b02.get_center,stroke_color=colo[0], dissipating_time=0.5, stroke_opacity=[0.6, 1]))
        r11=(always_redraw(lambda: atangle(poi,l1,theta1[1]).set_stroke(width=1,color=YELLOW_A,opacity=1)))
        r12=(always_redraw(lambda: atangle(r11.get_end(),l2,theta2[1]).set_stroke(width=1,color=YELLOW_A,opacity=1)))
        b11=(always_redraw(lambda: Dot(r11.get_end(),m1*(0.1)).set_fill(colors[1])))
        b12=(always_redraw(lambda: Dot(r12.get_end(),m2*(0.1)).set_fill(colors[1])))
        pat1=(TracedPath(b12.get_center,stroke_color=colo[1], dissipating_time=0.5, stroke_opacity=[0.6, 1]))
        r21=(always_redraw(lambda: atangle(poi,l1,theta1[2]).set_stroke(width=1,color=YELLOW_A,opacity=1)))
        r22=(always_redraw(lambda: atangle(r21.get_end(),l2,theta2[2]).set_stroke(width=1,color=YELLOW_A,opacity=1)))
        b21=(always_redraw(lambda: Dot(r21.get_end(),m1*(0.1)).set_fill(colors[2])))
        b22=(always_redraw(lambda: Dot(r22.get_end(),m2*(0.1)).set_fill(colors[2])))
        pat2=(TracedPath(b22.get_center,stroke_color=colo[2], dissipating_time=0.5, stroke_opacity=[0.6, 1]))
        r31=(always_redraw(lambda: atangle(poi,l1,theta1[3]).set_stroke(width=1,color=YELLOW_A,opacity=1)))
        r32=(always_redraw(lambda: atangle(r31.get_end(),l2,theta2[3]).set_stroke(width=1,color=YELLOW_A,opacity=1)))
        b31=(always_redraw(lambda: Dot(r31.get_end(),m1*(0.1)).set_fill(colors[3])))
        b32=(always_redraw(lambda: Dot(r32.get_end(),m2*(0.1)).set_fill(colors[3])))
        pat3=(TracedPath(b32.get_center,stroke_color=colo[3], dissipating_time=0.5, stroke_opacity=[0.6, 1]))
        r41=(always_redraw(lambda: atangle(poi,l1,theta1[4]).set_stroke(width=1,color=YELLOW_A,opacity=1)))
        r42=(always_redraw(lambda: atangle(r41.get_end(),l2,theta2[4]).set_stroke(width=1,color=YELLOW_A,opacity=1)))
        b41=(always_redraw(lambda: Dot(r41.get_end(),m1*(0.1)).set_fill(colors[4])))
        b42=(always_redraw(lambda: Dot(r42.get_end(),m2*(0.1)).set_fill(colors[4])))
        pat4=(TracedPath(b42.get_center,stroke_color=colo[4], dissipating_time=0.5, stroke_opacity=[0.6, 1]))
        r51=(always_redraw(lambda: atangle(poi,l1,theta1[5]).set_stroke(width=1,color=YELLOW_A,opacity=1)))
        r52=(always_redraw(lambda: atangle(r51.get_end(),l2,theta2[5]).set_stroke(width=1,color=YELLOW_A,opacity=1)))
        b51=(always_redraw(lambda: Dot(r51.get_end(),m1*(0.1)).set_fill(colors[5])))
        b52=(always_redraw(lambda: Dot(r52.get_end(),m2*(0.1)).set_fill(colors[5])))
        pat5=(TracedPath(b52.get_center,stroke_color=colo[5], dissipating_time=0.5, stroke_opacity=[0.6, 1]))
        r61=(always_redraw(lambda: atangle(poi,l1,theta1[6]).set_stroke(width=1,color=YELLOW_A,opacity=1)))
        r62=(always_redraw(lambda: atangle(r61.get_end(),l2,theta2[6]).set_stroke(width=1,color=YELLOW_A,opacity=1)))
        b61=(always_redraw(lambda: Dot(r61.get_end(),m1*(0.1)).set_fill(colors[6])))
        b62=(always_redraw(lambda: Dot(r62.get_end(),m2*(0.1)).set_fill(colors[6])))
        pat6=(TracedPath(b62.get_center,stroke_color=colo[6], dissipating_time=0.5, stroke_opacity=[0.6, 1]))
        ##################
        hing=Dot(poi,0.2).set_fill([GRAY_E,GRAY_A])
        self.play(DrawBorderThenFill(head),run_time=2.5)
        self.play(Create(hing))
        #################
        self.add(r01,r02,b01,b02,r11,r12,b11,b12,r21,r22,b21,b22,r31,r32,b31,b32,r41,r42,b41,b42,r51,r52,b51,b52,r61,r62,b61,b62)
        self.add(pat0,pat1,pat2,pat3,pat4,pat5,pat6)
        self.wait(0.8)
        #for j in range(0,7):
        #         self.add(VGroup(r1s[j],r2s[j],b1s[j],b2s[j]))
        #         self.add(pats[j])
        for i in range(0,4000):
            for j in range(0,7):
                t1=theta1[j]
                t2=theta2[j]
                o1=omega1[j]
                o2=omega2[j]
                alph1=alpha1(t1,t2,o1,o2)
                alph2=alpha2(t1,t2,o1,o2)
                ############
                kt11=o1
                kt12=o1+(alpha1(t1+kt11*(dt/2),t2+(o2*dt/2),o1+(alph1*dt/2),o2+(alph2*dt/2))*dt/2)
                kt13=o1+(alpha1(t1+kt12*(dt/2),t2+(o2*dt/2),o1+(alph1*dt/2),o2+(alph2*dt/2))*dt/2)
                kt14=o1+(alpha1(t1+kt13*(dt),t2+(o2*dt),o1+(alph1*dt),o2+(alph2*dt))*dt)
                theta1[j]=theta1[j]+dt*((kt11+2*kt12+2*kt13+kt14)/6)
                #########
                kt21=o2
                kt22=o2+(alpha2(t1+(o1*dt/2),t2+kt21*(dt/2),o1+(alph1*dt/2),o2+(alph2*dt/2))*dt/2)
                kt23=o2+(alpha2(t1+(o1*dt/2),t2+kt22*(dt/2),o1+(alph1*dt/2),o2+(alph2*dt/2))*dt/2)
                kt24=o2+(alpha2(t1+(o1*dt),t2+kt23*(dt),o1+(alph1*dt),o2+(alph2*dt))*dt)
                theta2[j]=theta2[j]+dt*((kt21+2*kt22+2*kt23+kt24)/6)
                #theta1[j]=theta1[j]+(dt*o1)+((((dt)**2)*alph1)/2)
                #theta2[j]=theta2[j]+(dt*o2)+((((dt)**2)*alph2)/2)
                ################
                ko21=alpha2(t1,t2,o1,o2)
                ko22=alpha2(t1+(o1*dt/2),t2+(o2*dt/2),o1+(alph1*dt/2),o2+(ko21*dt/2))
                ko23=alpha2(t1+(o1*dt/2),t2+(o2*dt/2),o1+(alph1*dt/2),o2+(ko22*dt/2))
                ko24=alpha2(t1+(o1*dt),t2+(o2*dt),o1+(alph1*dt),o2+(ko23*dt))
                omega2[j]=omega2[j]+(dt*(ko21+2*ko22+2*ko23+ko24)/6)
                ko11=alpha1(t1,t2,o1,o2)
                ko12=alpha1(t1+(o1*dt/2),t2+(o2*dt/2),o1+(ko11*dt/2),o2+(alph2*dt/2))
                ko13=alpha1(t1+(o1*dt/2),t2+(o2*dt/2),o1+(ko12*dt/2),o2+(alph2*dt/2))
                ko14=alpha1(t1+(o1*dt),t2+(o2*dt),o1+(ko13*dt),o2+(alph2*dt))
                omega1[j]=omega1[j]+(dt*(ko11+(2*ko12)+(2*ko13)+ko14)/6)
           #alpha1=((m2*l2*(omega2[j]**2)*(math.sin(theta2-theta1)))-((m1+m2)*g*math.sin(theta1))+(m2*(math.cos(theta2-theta1))*((l1*(omega1**2)*(math.sin(theta2-theta1)))+(g*math.sin(theta2)))))/(((m1+m2)*l1)-(m2*l1*((math.cos(theta2-theta1))**2)))
           #alpha2=(-1)*(((l1*alpha1*(math.cos(theta2-theta1)))+(l1*(omega1**2)*(math.sin(theta2-theta1)))+(g*(math.sin(theta2))))/(l2))
           #alpha1=((m2*l2*(omega2**2)*(math.sin(theta2-theta1)))-(m1+m2)*g*(math.sin(theta1))+m2*(math.cos(theta2-theta1))*(l1*math.sin(theta2-theta1)*(omega1**2)+g*math.sin(theta2)))/((m1+m2)*l1-m2*l1*((math.cos(theta2-theta1))**2))
           #alpha2=-(l1*alpha1*(math.cos(theta2-theta1))+l1*(math.sin(theta2-theta1))*(omega1**2)+g*(math.sin(theta2)))/(l2)
            self.wait(dt)
            
            
            
