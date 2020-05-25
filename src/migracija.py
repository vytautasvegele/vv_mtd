#!/usr/bin/env python
# coding: utf-8

# In[1]:


import numpy
import math
import random


# In[2]:


bees = []
for i in range (1,21):
    bees.append([i]*1000)


# In[3]:


consts = []


sum1 = 0
for i in range(1,len(bees)):
    sum1+= 0.716 + 13.96/i
new = (len(bees[0])*0.22)/sum1

for i in range(1,100):
    consts.append(math.floor((0.716 + 13.96/i)*new))

for a in range (0, len(bees) ):
    bee = bees[a]
    for b in range (0, len(bees) ):
        if a!=b: 
            bee2 = bees[b]
            for i in range ( consts[abs(bees.index(bee)-bees.index(bee2))] ):
                idx = random.randint(0, len(bee2)-1)
                bee.append(bee2.pop(idx))

                
# print (bees)                
percents = []       
    
    
for i in range (len(bees)):
    percents.append((sum([1 for j in bees[i] if j!=i+1])/len(bees[i])*100))
          
        
        


# In[4]:


import matplotlib.pyplot as plt

font = {'family' : 'normal',
        'weight' : 'normal',
        'size'   : 14}

plt.rc('font', **font)


plt.figure(figsize=(8, 5))
plt.xticks(numpy.arange(1, len(bees)+1, 1.0))
plt.bar(numpy.arange(1, len(bees)+1, 1.0),percents)
plt.ylabel('Migrantės bitės duotoje šeimoje %')
plt.xlabel('Šeimos indeksas')
plt.show()

print (min(percents), max(percents))


# In[ ]:




