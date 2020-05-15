#!/usr/bin/env python

from ctypes import *
from PIL import Image, ImageDraw
# ---- IMPORT MODULES
from mpl_toolkits import mplot3d
import math
import copy
import concurrent.futures
import time
import datetime
import pandas as pd
import matplotlib.pyplot as plt

import matplotlib.colors as colors
try:
    import numpy as np
    import random
except:
    raise ImportError("Numpy module not installed.")

import csv

from mpl_toolkits.axes_grid1 import make_axes_locatable
from Hive import Utilities
from Hive import Hive

from Hive import HiveS
from Hive import HiveQ
from Hive import HiveQS
from Hive import HiveIQ
from Hive import HiveIQS
from Hive import HiveSwarmTest
import matplotlib.pyplot as plt
from scipy.ndimage.filters import gaussian_filter
from Hive import HiveQo
import sys
from scipy.stats import wilcoxon
# ---- CREATE TEST CASE

filename = "NEWlog.txt"






im = None
pix = None
i_width, i_height = None, None
grid = None

if len(sys.argv) != 2:
    im = Image.open('BBH-I_Suss1.png')  # Can be many different formats.
    pix = im.load()
    i_width, i_height = im.size

def getMap():
    rows = []
    for line in open("BBH-T_Suss1.txt"):
        rows.append(line.split(" "))
    print(rows[2])
    rows=rows[3:-1]

    def cval(val):
        return int(float(val))

    circles = []
    constDiff = 5.0166666666666666666666666666667
    for row in rows:
        x = cval(row[3])*constDiff
        y = cval(row[4])*constDiff
    #     sq = (math.sqrt((cval(row[5])/constDiff)/math.pi))   +    10
        sq = (math.sqrt((cval(row[5])/(4.2**2))/math.pi))/2   +    1
        vl = 1+( cval(row[6])*cval(row[7])+cval(row[8])*cval(row[9])) * (cval(row[11])-cval(row[10]))
        circles.append([x,y,sq,vl])
    print(i_width, i_height)
    grid = np.zeros((1506,1056), dtype=np.float)
    square_length = 0.5
    xx = np.arange(grid.shape[0])
    yy = np.arange(grid.shape[1])

    for val in circles:
        radius = val[2]
        inside = (xx[:,None] - val[0]) ** 2 + (yy[None, :] - val[1]) ** 2 <= (radius ** 2)
        grid = grid + inside*val[3]
    return grid

if len(sys.argv) != 2:
    grid = getMap()






def imager(vector):
    x=int(vector[0])+1
    y=int(vector[1])+1
    if x > (i_height-1): x=0
    if y > (i_width-1): y=0
    pixel = pix[x,y]
    field = pixel[0]+pixel[1]-pixel[2]
    return 0 - field

def imager2(vector):
    x=int(vector[0])
    y=int(vector[1])
    if x > (i_width-1): x=0
    if y > (i_height-1): y=0
    pixel = pix[x,y]
    field =  pixel[0]+pixel[1]+pixel[2]
    return (math.sin(vector[0]*2*math.pi)*math.cos(vector[1]))*25 - field

def imager3(vector):
    x=int(vector[0])
    y=int(vector[1])
    if x > 1506:x=0# (i_width-1): x=0
    if y > 1051:y=0 # (i_height-1): y=0
    pixel = grid[x][y]
    field = pixel
    return abs(math.sin(vector[0]*2*math.pi)*math.cos(vector[1]))*0.00001 - pixel




def rosenbrock(vector, a=1, b=100):
    """

    The Rosenbrock function is a non-convex function used as a performance test
    problem for optimization algorithms introduced by Howard H. Rosenbrock in
    1960. It is also known as Rosenbrock's valley or Rosenbrock's banana
    function.

    The function is defined by

                        f(x, y) = (a-x)^2 + b(y-x^2)^2

    It has a global minimum at (x, y) = (a, a**2), where f(x, y) = 0.
    """
    # vector = np.array(vector)
    #
    return (a - vector[0])**2 + b * (vector[1] - vector[0]**2)**2
    # sum = 0
    # for i in range (1, len(vector)):
    #     sum += (100*(vector[i]-vector[i-1]**2))**2 + (vector[i-1]-1)**2
    # return sum
    # return vector[0]**2


def sphere(vector):
    sum = 0
    for i in range (0, len(vector)-1):
        sum += vector[i]**2
    return sum
    # return vector[0]**2
# ---- SOLVE TEST CASE WITH ARTIFICIAL BEE COLONY ALGORITHM
def rastrigin(vector):
    sum = 0
    for i in range (0, len(vector)-1):
        sum += (vector[i]**2) - 10 * math.cos(2*math.pi*vector[i]) + 10
    return sum

def dixon(vector):
    sum = (vector[1]-1)**2
    for i in range (1, len(vector)-1):
        sum += i*((2*vector[i]**2-vector[i-1])**2)
    return sum

def ackley(vector):
    sum = 20 + math.e
    psum = 0
    for i in range(0, len(vector)):
        psum+=vector[i] ** 2
    psum2 = 0
    for i in range(0, len(vector)):
        psum2+=math.cos(2*math.pi*vector[i])
    sum -= 20*math.exp(-0.2*math.sqrt((1/len(vector))*psum))+math.exp((1/len(vector))*psum2)
    return sum


def schwefel(vector):
    sum = 0
    for i in range(0, len(vector)):
        sum+=(0-vector[i]*math.sin(math.sqrt(abs(vector[i]))))
    return sum

def schaffer(vector):
    sum = 0
    for i in range(0, len(vector)):
        sum+=vector[i] ** 2
    return 0.5 + ((math.sin(math.sqrt((sum)))**2)-0.5)/((1+0.001*sum)**2)

def griewank(vector):
    psum = 0
    for i in range(0, len(vector)):
        psum+=(vector[i] ** 2)/4000
    # psum2 = 0
    psum2 = math.cos(vector[0]/math.sqrt(1))
    for i in range(1, len(vector)):
        psum2*=math.cos(vector[i]/math.sqrt(i+1))
    return (psum) - (psum2) + 1

def camel(vector):
    x = vector[0]
    y = vector[1]
    return 4*x**2 - 2.1*x**4 + (1/3)*x**6 + x*y - 4*y**2 + 4*y**4

def branin(vector):
    x = vector[0]
    y = vector[1]+5
    return (y-(5.1/(4*math.pi**2))*x**2+((5/math.pi)*x)-6)**2 + 10 * (1 - (1/(8*math.pi))) * math.cos(x) + 10


def f1(vector):
    f = CDLL("cec15.so")
    f.cec15_test_func.restype = None
    f.cec15_test_func.argtypes = [POINTER(c_double), POINTER(c_double), c_int, c_int, c_int]
    input = (c_double * len(vector))(*vector)
    inputs = cast(input, POINTER(c_double))
    output = (c_double * 1)()
    outputs = cast(output, POINTER(c_double))
    f.cec15_test_func(input, output, len(vector), 1, 1)
    return outputs[0]

def f2(vector):
    f = CDLL("cec15.so")
    f.cec15_test_func.restype = None
    f.cec15_test_func.argtypes = [POINTER(c_double), POINTER(c_double), c_int, c_int, c_int]
    input = (c_double * len(vector))(*vector)
    inputs = cast(input, POINTER(c_double))
    output = (c_double * 1)()
    outputs = cast(output, POINTER(c_double))
    f.cec15_test_func(input, output, len(vector), 1, 2)
    return outputs[0]

def f3(vector):
    f = CDLL("cec15.so")
    f.cec15_test_func.restype = None
    f.cec15_test_func.argtypes = [POINTER(c_double), POINTER(c_double), c_int, c_int, c_int]
    input = (c_double * len(vector))(*vector)
    inputs = cast(input, POINTER(c_double))
    output = (c_double * 1)()
    outputs = cast(output, POINTER(c_double))
    f.cec15_test_func(input, output, len(vector), 1, 3)
    return outputs[0]

def f4(vector):
    f = CDLL("cec15.so")
    f.cec15_test_func.restype = None
    f.cec15_test_func.argtypes = [POINTER(c_double), POINTER(c_double), c_int, c_int, c_int]
    input = (c_double * len(vector))(*vector)
    inputs = cast(input, POINTER(c_double))
    output = (c_double * 1)()
    outputs = cast(output, POINTER(c_double))
    f.cec15_test_func(input, output, len(vector), 1, 4)
    return outputs[0]

def f5(vector):
    f = CDLL("cec15.so")
    f.cec15_test_func.restype = None
    f.cec15_test_func.argtypes = [POINTER(c_double), POINTER(c_double), c_int, c_int, c_int]
    input = (c_double * len(vector))(*vector)
    inputs = cast(input, POINTER(c_double))
    output = (c_double * 1)()
    outputs = cast(output, POINTER(c_double))
    f.cec15_test_func(input, output, len(vector), 1, 5)
    return outputs[0]
def f6(vector):
    f = CDLL("cec15.so")
    f.cec15_test_func.restype = None
    f.cec15_test_func.argtypes = [POINTER(c_double), POINTER(c_double), c_int, c_int, c_int]
    input = (c_double * len(vector))(*vector)
    inputs = cast(input, POINTER(c_double))
    output = (c_double * 1)()
    outputs = cast(output, POINTER(c_double))
    f.cec15_test_func(input, output, len(vector), 1, 6)
    return outputs[0]
def f7(vector):
    f = CDLL("cec15.so")
    f.cec15_test_func.restype = None
    f.cec15_test_func.argtypes = [POINTER(c_double), POINTER(c_double), c_int, c_int, c_int]
    input = (c_double * len(vector))(*vector)
    inputs = cast(input, POINTER(c_double))
    output = (c_double * 1)()
    outputs = cast(output, POINTER(c_double))
    f.cec15_test_func(input, output, len(vector), 1, 7)
    return outputs[0]
def f8(vector):
    f = CDLL("cec15.so")
    f.cec15_test_func.restype = None
    f.cec15_test_func.argtypes = [POINTER(c_double), POINTER(c_double), c_int, c_int, c_int]
    input = (c_double * len(vector))(*vector)
    inputs = cast(input, POINTER(c_double))
    output = (c_double * 1)()
    outputs = cast(output, POINTER(c_double))
    f.cec15_test_func(input, output, len(vector), 1, 8)
    return outputs[0]
def f9(vector):
    f = CDLL("cec15.so")
    f.cec15_test_func.restype = None
    f.cec15_test_func.argtypes = [POINTER(c_double), POINTER(c_double), c_int, c_int, c_int]
    input = (c_double * len(vector))(*vector)
    inputs = cast(input, POINTER(c_double))
    output = (c_double * 1)()
    outputs = cast(output, POINTER(c_double))
    f.cec15_test_func(input, output, len(vector), 1, 9)
    return outputs[0]
def f10(vector):
    f = CDLL("cec15.so")
    f.cec15_test_func.restype = None
    f.cec15_test_func.argtypes = [POINTER(c_double), POINTER(c_double), c_int, c_int, c_int]
    input = (c_double * len(vector))(*vector)
    inputs = cast(input, POINTER(c_double))
    output = (c_double * 1)()
    outputs = cast(output, POINTER(c_double))
    f.cec15_test_func(input, output, len(vector), 1, 10)
    return outputs[0]
def f11(vector):
    f = CDLL("cec15.so")
    f.cec15_test_func.restype = None
    f.cec15_test_func.argtypes = [POINTER(c_double), POINTER(c_double), c_int, c_int, c_int]
    input = (c_double * len(vector))(*vector)
    inputs = cast(input, POINTER(c_double))
    output = (c_double * 1)()
    outputs = cast(output, POINTER(c_double))
    f.cec15_test_func(input, output, len(vector), 1, 11)
    return outputs[0]
def f12(vector):
    f = CDLL("cec15.so")
    f.cec15_test_func.restype = None
    f.cec15_test_func.argtypes = [POINTER(c_double), POINTER(c_double), c_int, c_int, c_int]
    input = (c_double * len(vector))(*vector)
    inputs = cast(input, POINTER(c_double))
    output = (c_double * 1)()
    outputs = cast(output, POINTER(c_double))
    f.cec15_test_func(input, output, len(vector), 1, 12)
    return outputs[0]
def f13(vector):
    f = CDLL("cec15.so")
    f.cec15_test_func.restype = None
    f.cec15_test_func.argtypes = [POINTER(c_double), POINTER(c_double), c_int, c_int, c_int]
    input = (c_double * len(vector))(*vector)
    inputs = cast(input, POINTER(c_double))
    output = (c_double * 1)()
    outputs = cast(output, POINTER(c_double))
    f.cec15_test_func(input, output, len(vector), 1, 13)
    return outputs[0]
def f14(vector):
    f = CDLL("cec15.so")
    f.cec15_test_func.restype = None
    f.cec15_test_func.argtypes = [POINTER(c_double), POINTER(c_double), c_int, c_int, c_int]
    input = (c_double * len(vector))(*vector)
    inputs = cast(input, POINTER(c_double))
    output = (c_double * 1)()
    outputs = cast(output, POINTER(c_double))
    f.cec15_test_func(input, output, len(vector), 1, 14)
    return outputs[0]
def f15(vector):
    f = CDLL("cec15.so")
    f.cec15_test_func.restype = None
    f.cec15_test_func.argtypes = [POINTER(c_double), POINTER(c_double), c_int, c_int, c_int]
    input = (c_double * len(vector))(*vector)
    inputs = cast(input, POINTER(c_double))
    output = (c_double * 1)()
    outputs = cast(output, POINTER(c_double))
    f.cec15_test_func(input, output, len(vector), 1, 15)
    return outputs[0]


def run():




    # creates model

    def convertResult(lower, upper, d, fun, numb_bees, runs=1, type=0, name=None, algName="none", minOnly=False):

        ndim = int(d)
        lower = [lower] * ndim
        upper = [upper] * ndim

        cost = {};
        means = []
        bests = []
        minVal = sys.maxsize
        maxVal = 0
        minMean = sys.maxsize
        maxMean = -9999999
        if name == None: name = str(type)
        print("Running alg type: ", '{0:<7}'.format(name))
        # print("Running alg type: ", '{0:<7}'.format(name), " trials:", end=" ", )
        ends = []
        for i in range(runs+1):
            random.seed()
            np.random.seed()
            if True:#i%int(runs/5)==0:
                print('{0:<7}'.format(name),"#" + str(i) + " "+str(algName))
                #print("|", end=" ")
                pass
            if type==0:
                model= Hive.BeeHive(lower= lower, upper = upper, fun = fun, numb_bees = numb_bees,
                                     max_itrs = max_itrs, max_trials=(d*numb_bees)/2)
            elif type==1:
                model= HiveS.BeeHive(lower=lower, upper=upper, fun = fun, numb_bees=numb_bees,
                                     max_itrs=max_itrs, max_trials=(d*numb_bees)/2)
            elif type == 2:
                model= HiveQ.BeeHive(lower=lower, upper=upper, fun=fun, numb_bees=numb_bees,
                                      max_itrs=max_itrs, max_trials=(d*numb_bees)/2, neighboor_d=sys.maxsize)
            elif type == 3:
                model= HiveQS.BeeHive(lower=lower, upper=upper, fun=fun, numb_bees=numb_bees,
                                       max_itrs=max_itrs, max_trials=(d*numb_bees)/2, neighboor_d=sys.maxsize)
            elif type == 4:
                model = HiveIQ.BeeHive(lower= lower, upper = upper, fun = fun, numb_bees = numb_bees,
                                       max_itrs = max_itrs, max_trials=(d*numb_bees)/2, neighboor_d=sys.maxsize,
                                       bestLimit=(d * numb_bees))
            elif type == 5:
                model= HiveIQS.BeeHive(lower= lower, upper = upper, fun = fun, numb_bees = numb_bees,
                                        max_itrs = max_itrs, max_trials=(d*numb_bees)/2,
                                        bestLimit=(d * numb_bees))
            else:
                res = None
            # with concurrent.futures.ThreadPoolExecutor() as executor:
            #     future = executor.submit(model.run)
            res, b_vector= model.run()
            if True:
                if res["mean"][len(res["mean"]) - 1] < minMean: minMean = res["mean"][len(res["mean"]) - 1]
                if res["mean"][len(res["mean"]) - 1] > maxMean: maxMean = res["mean"][len(res["mean"]) - 1]
                if model.best < minVal: minVal = model.best
                if model.best > maxVal: maxVal = model.best

                if len(means) == 0:
                        means = res["mean"]
                        bests = res['best']
                else:
                    print(len(means))
                    ends.append(res["best"][len(res["mean"])-1])

                    if len(means)>len(res["mean"]):
                        means=means[0:len(res["mean"])]
                        bests=bests[0:len(res["best"])]
                    for j in range(len(means)):
                        # if means[j] > res["mean"][j] : means[j] = copy.deepcopy(res["mean"][j])
                        # if bests[j] > res["best"][j]: bests[j] = copy.deepcopy(res["best"][j])
                        # if type == 0 and j!=0:
                            means[j] += res["mean"][j]
                            if minOnly:
                                if res['best'][j] < bests[j] : bests[j] = res['best'][j]
                            else:
                                bests[j] += res['best'][j]

                            # if bests[j] > res['best'][j]: bests[j] = res['best'][j]


        for i in range(len(means)):
            means[i] = means[i] / runs
            if not minOnly:
                bests[i] = bests[i] / runs
            # if i>0:
            #     if means[i-1] < means[i]: means[i]=means[i-1]
            #     if bests[i-1] < bests[i]: bests[i] = bests[i - 1]
        cost["best"] = bests
        cost["mean"] = means
        f = open(filename, "a")
        # f.write("Ran " + name + "at" + datetime.datetime.now().strftime('%d_%H_%M_%S'))
        print("Alg finished:", str(name),
              " means: min" ,'{:>15.30f}'.format(minMean), " max:", '{:>15.30f}'.format(maxMean), " avg: ", '{:>15.30f}'.format(means[-1]),
              " bests: min" ,'{:>15.30f}'.format(minVal), " max:", '{:>15.30f}'.format(maxVal),  " avg: ", '{:>15.30f}'.format(bests[-1]), " SD: ", np.std(np.array(ends)))
        if type>3:
            algName = algName
        print(algName, ",", str(name),"," ,minVal, ",", maxVal,  ",", (bests[-1]), ",", np.std(np.array(ends)), file=f)
        f.close()
        return cost, ends, (bests[-1])

    # res1 = (Hive.BeeHive(lower= lower, upper = upper, fun = fun, numb_bees = numb_bees, max_itrs = max_itrs).run())
    # cost1 = convertResult (res1, runs)
    def runAlgos (runs, lower, upper, d, numb_bees, fun, name, means=True, bests=False, draw=True):
        print("\n\n-----------------------\nRunning algorithms using ", name, " for fitness" )

        with concurrent.futures.ThreadPoolExecutor() as executor:

            future1 = executor.submit(convertResult, lower, upper, d, fun, numb_bees,  runs, 0, "ABC", name,)
            future2 = executor.submit(convertResult,lower, upper, d, fun, numb_bees,  runs, 1, "sABC", name,)
            future3 = executor.submit(convertResult,lower, upper, d, fun, numb_bees,  runs, 2, "qABC", name,)
            # future4 = executor.submit(convertResult,lower, upper, d, fun, numb_bees, runs, 3, "qsABC", name,)
            future5 = executor.submit(convertResult,lower, upper, d, fun, numb_bees,  runs, 4, "iqABC", name,)
            future6 = executor.submit(convertResult, lower, upper, d, fun, numb_bees, runs, 5, "iqsABC", name,)
            cost1, ends1, avg1 = future1.result()
            cost2, ends2, avg2 = future2.result()
            cost3, _, _ = future3.result()
            # cost4, _, _ = future4.result()
            cost5, ends5, avg5 = future5.result()
            cost6, ends6, avg6 = future6.result()

            ends5 = np.array(ends5)
            ends6 = np.array(ends6)
            if len(ends5) >= 20:
                stat, p = wilcoxon(ends5, ends6)
                print('Alg %s Statistics=%.3f, p=%.3f' % (name,stat, p))
                f = open(filename, "a")
                resultString = "iqsabc"
                if avg5 < avg6 : resultString = "iqabc"
                if p>=0.05 : resultString = "-"
                f.write('Zres&%s&%s&%f&p=%.4f\\\\\n' % (name,resultString, (avg5-avg6), p))
                f.close()
            if len(ends1) >= 20:
                stat, p = wilcoxon(ends1, ends2)
                print('Alg %s Statistics=%.3f, p=%.3f' % (name,stat, p))
                f = open(filename, "a")
                resultString = "sabc"
                if avg1 < avg2 : resultString = "abc"
                if p>=0.05 : resultString = "-"
                f.write('Yres&%s&%s&%f&p=%.4f\\\\\n' % (name,resultString, (avg1-avg2),p))
                f.close()
            if draw:
                Utilities.ConvergencePlots(name,
                                           [cost1, cost2,  cost3, cost5, cost6],
                                           ['blue', 'magenta', 'green', 'red', 'black'],
                                           ['ABC', 'sABC', 'qABC','iqABC', 'iqsABC'],
                                           means=means, bests=bests,  right=int(3000))
                pass

    def runAll(runs, numb_bees, means, bests, case=0, draw=True):
            if case == 1:runAlgos(runs, -100, 100, 30, numb_bees, sphere, "sphere", means=means, bests=bests, draw=draw)
            if case == 2:runAlgos(runs, -30, 30, 30, numb_bees, rosenbrock, "rosenbrock", means=means, bests=bests, draw=draw)
            if case == 3:runAlgos(runs, -5.12, 5.12, 30, numb_bees, rastrigin, "rastrigin", means=means, bests=bests, draw=draw)
            if case == 4:runAlgos(runs, -32, 32, 30, numb_bees, ackley, "ackley", means=means, bests=bests, draw=draw)
            if case == 5:runAlgos(runs, -100, 100, 2, numb_bees, schaffer, "schaffer", means=means, bests=bests, draw=draw)
            if case == 6:runAlgos(runs, -500, 500, 30, numb_bees, dixon, "dixon", means=means, bests=bests, draw=draw)
            if case == 7:runAlgos(runs, -600, 600, 30, numb_bees, griewank, "griewank", means=means, bests=bests, draw=draw)
            if case == 8:runAlgos(runs, -5, 5, 2, numb_bees, camel, "camel", means=means, bests=bests, draw=draw)
            if case == 9:runAlgos(runs, -5, 5, 2, numb_bees, branin, "branin", means=means, bests=bests, draw=draw)
            if case == 10: runAlgos(runs, -500, 500, 30, numb_bees, schwefel, "schwefel", means=means, bests=bests,draw=draw)
            if case == 11:runAlgos(runs, -100, 100, 30, numb_bees, f1, "f1", means=means, bests=bests, draw=draw)
            if case == 12:runAlgos(runs, -100, 100, 30, numb_bees, f2, "f2", means=means, bests=bests, draw=draw)
            if case == 13:runAlgos(runs, -100, 100, 30, numb_bees, f3, "f3", means=means, bests=bests, draw=draw)
            if case == 14:runAlgos(runs, -100, 100, 30, numb_bees, f4, "f4", means=means, bests=bests, draw=draw)
            if case == 15:runAlgos(runs, -100, 100, 30, numb_bees, f5, "f5", means=means, bests=bests, draw=draw)
            if case == 16:runAlgos(runs, -100, 100, 30, numb_bees, f6, "f6", means=means, bests=bests, draw=draw)
            if case == 17:runAlgos(runs, -100, 100, 30, numb_bees, f7, "f7", means=means, bests=bests, draw=draw)
            if case == 18:runAlgos(runs, -100, 100, 30, numb_bees, f8, "f8", means=means, bests=bests, draw=draw)
            if case == 19:runAlgos(runs, -100, 100, 30, numb_bees, f9, "f9", means=means, bests=bests, draw=draw)
            if case == 20:runAlgos(runs, -100, 100, 30, numb_bees, f10, "f10", means=means, bests=bests, draw=draw)
            if case == 21:runAlgos(runs, -100, 100, 30, numb_bees, f11, "f11", means=means, bests=bests, draw=draw)
            if case == 22:runAlgos(runs, -100, 100, 30, numb_bees, f12, "f12", means=means, bests=bests, draw=draw)
            if case == 23:runAlgos(runs, -100, 100, 30, numb_bees, f13, "f13", means=means, bests=bests, draw=draw)
            if case == 24:runAlgos(runs, -100, 100, 30, numb_bees, f14, "f14", means=means, bests=bests, draw=draw)
            if case == 25:runAlgos(runs, -100, 100, 30, numb_bees, f15, "f15", means=means, bests=bests, draw=draw)

    max_itrs = int(2500/ (50*2))
    if len(sys.argv) == 2:
        print (sys.argv)
        filename = "logs/log"+ datetime.datetime.now().strftime('%d_%H')+".csv"
        runAll(30, 50, False, True, int(sys.argv[1]), True)

    else:
        bees = 100
        max_itrs = int(1000 / (bees * 2))
        fig, ax = plt.subplots()
        spaces = []
        spaces.append(np.linspace(0, 1505, 1000))
        spaces.append(np.linspace(0, 1050, 1000))
        X, Y = np.meshgrid(spaces[0], spaces[1])
        z = []
        for j in (spaces[1]):
           for i in spaces[0]:
              z.append(imager3([i, j]))
        z = np.reshape(z,(len(spaces[0]),len(spaces[1])))
        mapScale = (5000000/( 1505*1050 ))
        ax.contourf(X*mapScale, Y*mapScale, np.array(z), cmap='gray', ) #norm=colors.SymLogNorm(vmin=z.min(), vmax=z.max(),linthresh=0.03)
        divider = make_axes_locatable(ax)
        cax = divider.append_axes('right', size='5%', pad=0.05)
        br = ax.imshow(np.array(z)*(-1), interpolation='nearest', origin='lower', cmap='binary')
        fig.colorbar(br, cax=cax, orientation='vertical', label='lauko tinkamumas')
        ax.set_xlabel("metrai")
        ax.set_ylabel("metrai")
        start_x = 750
        start_y = 500
        max_r = 200
        max_d = math.sqrt(2)*max_r
        # ax.imshow(grid, cmap='gray')

        for i in range (10):

            model = HiveS.BeeHive(lower=[max(0, start_x - max_d), max(0, start_y - max_d)], upper=[min(1050, start_x + max_d), min(1505, start_y + max_d)], fun=imager3, numb_bees=bees,
                                  max_itrs=max_itrs, max_trials=10, start_x=start_x, start_y=start_y, r=max_r, verbose=False)
            cost, b_vector = model.run()
            ax.plot([int(b_vector[0])*mapScale], [int(b_vector[1])*mapScale], '.', linewidth=1, color='red', fillstyle='none')
            ax.plot((start_x * mapScale, int(b_vector[0]) * mapScale),
                    (start_y * mapScale, int(b_vector[1]) * mapScale), ls=':', linewidth=1, color='red',
                    fillstyle='none')

        circle1 = plt.Circle((start_x*mapScale, start_y*mapScale), max_r*2*mapScale, color='black', fill=False, linewidth=2)
        ax.plot(start_x*mapScale, start_y*mapScale, '*', linewidth=5, color='blue')
        ax.add_artist(circle1)
        # ax.set_ylim(ax.get_ylim()[::-1])
        # plt.gca().invert_yaxis()
        plt.show(fig)



        return b_vector

if __name__ == "__main__":
    answer = run()


# ---- END
