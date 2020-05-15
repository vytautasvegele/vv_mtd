#!/usr/bin/env python

# ---- MODULE DOCSTRING

__doc__ = """
Magistro tiriamasis darbas
Dirbtines biciu seimos algoritmu statistikos spausdinimas variantas
(C) Parenge Vytautas Vegele, 2020
"""

# ---- IMPORT MODULES
import numpy
import time
import datetime
import os
from matplotlib.ticker import FormatStrFormatter

try:
    import matplotlib.pyplot as plt
    import matplotlib.ticker as mticker
except:
    raise ImportError("Install 'matplotlib' to plot convergence results.")

def ConvergencePlots(name, costs, colors, labels, means = False, bests = False, logScale = True, right=None):
    if right==None:
        right == len(costs[0]["best"])-1
    plt.tight_layout()
    fig, ax = plt.subplots()
    # if logScale:
    #     plt.yscale('symlog')

    for cost, color, label in zip(costs,colors,labels):
        labels = ["Best Cost Function", "Mean Cost Function"]
        if bests:
            ax.plot(range(len(cost["best"][0:right])), numpy.array(cost["best"][0:right]), color=color, label=label)
        if means:
            ax.plot(range(len(cost["mean"][0:right])), numpy.array(cost["mean"][0:right]), color=color, label=label)
        ax.set_xlabel("Tikslo funkcijos tikrinimų kiekis")
        ax.set_ylabel("Geriausia (mažiausia) rasta reikšmė")

    fig.legend(loc="best")
    ax.set_xlim([0, len(cost["mean"][0:right])])
    # try:
    #     locmin = mticker.LogLocator(base=10.0, subs=(0.2, 0.4), numticks=24)
    #     ax.yaxis.set_minor_locator(locmin)
    #     ax.yaxis.set_minor_formatter(mticker.FormatStrFormatter('%2.2E'))
    #     ax.yaxis.set_major_formatter(mticker.FormatStrFormatter('%2.2E'))
    # except:
    #     pass
    ax.grid()

    fig.set_figheight(5)
    fig.set_figwidth(8)
    # fig.suptitle("Konvergavimo kreivės funkcijai: " + str(name))

    fig.tight_layout()
    if os.path.isfile("graphs/all_"+name+".jpg"):
        os.remove("graphs/all_"+name+".jpg")
    fig.savefig("graphs/all_"+name+".jpg")

