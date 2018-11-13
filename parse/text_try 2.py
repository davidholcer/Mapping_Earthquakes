#imports math library
from math import *

#sets variables
digits=1
path="/Users/davidholcer/Desktop/parse/edited.txt"
filee='places.txt'

#sets lines to array of each line
lines = [line.strip() for line in open(filee)]
new=[]
for i in lines:
     with open(path, "a") as myfile:
          myfile.write(i.split('? ',1)[-1]+"\n")
