import pygame
import math
import random
import sys
import numpy as np
import os

os.environ["SDL_VIDEO_CENTERED"]='1'
pygame.init()
screen = pygame.display.set_mode((1000,1000))
music=pygame.mixer.music.load("C:/Users/risha/Downloads/sas.mp3")
pygame.mixer.music.play(-1)
s=10
row=int(1000/s)
col= int(1000/s)
screen.fill("black")
clock=pygame.time.Clock()
array=[]
for i in range(0,row):
    arr=[]
    for j in range (0,col):
        arr.append(random.randint(0,1))
    array.append(arr)
def aliveneighbour(ar,i,j):
    count=0
    for p in range (-1,2):
        for q in range (-1,2):
            if ((p,q)!=(0,0))and(0<=p+i<row)and(0<=q+j<col):
                if ar[(p+i)][(q+j)]==1:
                    count =count +1
    return count
def updatearr(ar):
    for i in range(0,row):
        for j in range(0,col):
            if ar[i][j]==1:
                if 2<=aliveneighbour(ar,i,j)<=3:
                    ar[i][j]=1
                else:
                    ar[i][j]=0
            if ar[i][j]==0:
                if aliveneighbour(ar,i,j)==3:
                    ar[i][j]=0
while True:
    for event in pygame.event.get():
      if event.type ==pygame.QUIT:
          pygame.quit()
          sys.exit()
    for i in range (0,row):
        for j in range (0,col):
          if array[i][j]==1:
           pygame.draw.rect(screen, "white",(s*i,s*j,s,s))
          else:
            pygame.draw.rect(screen, (0, 0, 0), (s*i,s*j, s, s))
          pygame.draw.line(screen,(25,25,25),(s*i,0),(s*i,1000))
          pygame.draw.line(screen,(25,25,25),(0,s*j),(1000,s*j))
    temp=[]
    for i in range(row):
      arr = []
      for j in range(col):
        arr.append(0)
      temp.append(arr)
    for i in range(0,row):
      for j in range(0,col):
        neig=aliveneighbour(array,i,j)  
        if array[i][j]==1:
            if 2<=neig<=3:
                temp[i][j]=1
            else:
                temp[i][j]=0
        elif array[i][j]==0:
            if neig==3:
                temp[i][j]=1
    array=temp

    pygame.display.flip()
    clock.tick(10)