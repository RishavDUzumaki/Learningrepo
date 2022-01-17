import pygame
import sys
import math

#initialize
pygame.init()
#screeen
width=1500
height=684
w=100
h=200
count=0
game_over=False
s=pygame.display.set_mode((width,height))
clk=pygame.time.Clock()
naruto=pygame.image.load("C:/Users/risha/Downloads/nar(2).png").convert_alpha()
konoha=pygame.image.load("C:/Users/risha/Downloads/kon1.jpg").convert_alpha()
he=pygame.image.load("C:/Users/risha/Downloads/head.png").convert_alpha()
fir=pygame.image.load("C:/Users/risha/Downloads/fireball.png").convert_alpha()
fon=pygame.font.Font(None,50)
score=fon.render(str(count),True,"Red")
x=200
y=300
xf=1600
yf=500
velocity=0
gravity=10
nrect=naruto.get_rect(topleft=(x,y))
frect=fir.get_rect(topleft=(xf,yf))
pygame.display.set_caption("Naruto")
while (game_over==False):
    for event in pygame.event.get():
        if event.type ==pygame.QUIT:
            pygame.quit()
            exit()
        elif event.type==pygame.KEYDOWN:
            if event.key==pygame.K_SPACE:
              velocity=3
              nrect.bottom=200
    s.blit(konoha,(0,0))
    s.blit(he,(700,10))
    s.blit(naruto,nrect)
    s.blit(fir,frect)
    s.blit(score,(1300,550))
    #motion from here
    if nrect.left>=1500:
        nrect.left=-100
    else:
      nrect.left=(nrect.left+9)
    if frect.right<=-50:
        frect.right=1600
    else:
        frect.right=frect.right-15
    keys=pygame.key.get_pressed()
    #if keys[pygame.K_SPACE]:
        #print("jump")
    #if nrect.colliderect(frect):
    if nrect.top<=300:
        velocity=velocity+3
    nrect.bottom=(nrect.bottom)+velocity
    if nrect.top>=300:
        velocity=0
        nrect.top=300
    if abs(nrect.left-frect.left)<=20 and nrect.left<=1500 and abs(nrect.bottom-frect.bottom)<=20:
        game_over=True

    pygame.display.update()
    clk.tick(60)

#final end
