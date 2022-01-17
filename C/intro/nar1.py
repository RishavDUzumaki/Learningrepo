import pygame
import sys
import math

from pygame.constants import KEYDOWN

#initialize
pygame.init()
#screeen
width=1500
height=684
w=100
h=200
count=0
game_state="go"
game_over=False
s=pygame.display.set_mode((width,height))
ends=pygame.image.load("C:/Users/risha/Downloads/end.jpg").convert_alpha()
clk=pygame.time.Clock()
naruto=pygame.image.load("C:/Users/risha/Downloads/nar(2).png").convert_alpha()
konoha=pygame.image.load("C:/Users/risha/Downloads/kon1.jpg").convert_alpha()
he=pygame.image.load("C:/Users/risha/Downloads/head.png").convert_alpha()
fir=pygame.image.load("C:/Users/risha/Downloads/fireball.png").convert_alpha()
fon=pygame.font.Font(None,50)
music=pygame.mixer.music.load("C:/Anime OST/NAruto/[NHS] Naruto Original Soundtrack/21. Naruto Main Theme.mp3")
pygame.mixer.music.play(-1)
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
        elif game_state=="go" and event.type==pygame.KEYDOWN:
            if event.key==pygame.K_SPACE:
              velocity=3
              nrect.bottom=200
        elif game_state=="over" and event.type==pygame.KEYDOWN:
            if event.key==pygame.K_RETURN:
                game_state="go"
    if game_state=="go":
      score=fon.render(str(count),True,"Red")
      s.blit(konoha,(0,0))
      s.blit(he,(700,10))
      s.blit(naruto,nrect)
      s.blit(fir,frect)
      s.blit(score,(1300,550))
      #motion from here
      if nrect.left>=1500:
          nrect.left=-100
      else:
        nrect.left=(nrect.left+7+(count/250))
      if frect.right<=-50:
          frect.right=1600
      else:
          frect.right=frect.right-15
      #if keys[pygame.K_SPACE]:
          #print("jump")
      #if nrect.colliderect(frect):
      if nrect.top<=300:
          velocity=velocity+3
      nrect.bottom=(nrect.bottom)+velocity
      if nrect.top>=300:
          velocity=0
          nrect.top=300
      if abs(nrect.left-frect.left)<=20 and -100<=nrect.left<=1500 and abs(nrect.bottom-frect.bottom)<=20:
          game_state="over"
      count=math.ceil(count+1/60)
      msg=fon.render("Your Score is "+str(count)+" Press Enter to continue",True,"Black")
    else:
        s.blit(ends,(0,0))
        s.blit(msg,(500,300))
        nrect.topleft=(200,300)
        frect.topleft=(1600,500)
        count=0


    pygame.display.update()
    clk.tick(60)

#final end
