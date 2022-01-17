
import pygame,pymunk,sys
def cstar(sp):
    b=pymunk.Body(1,100,pymunk.Body.DYNAMIC)
    b.position=(500,0)
    sh=pymunk.Circle(b,80)
    sp.add(b,sh)
    return sh
def draw(l):
    for i in l:
        pygame.draw.circle(s,(0,0,0),i.body.position,80)
pygame.init()
s=pygame.display.set_mode((1000,1000))
back=pygame.image.load("C:/Users/risha/Downloads/bb.jpg")
clk=pygame.time.Clock()
spac=pymunk.Space()
spac.gravity=(40,50)
lis=[]
lis.append(cstar(spac))
while True:
    for event in pygame.event.get():
        if event.type==pygame.QUIT:
            pygame.quit()
            sys.exit()
    s.blit(back,(0,0))
    draw(lis)
    spac.step(1/60)
    pygame.display.update()
    clk.tick(120)