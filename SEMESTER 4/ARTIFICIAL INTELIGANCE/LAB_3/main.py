import math
import os
import warnings
import matplotlib.pyplot as plt
from toRead import *
from GA import GA

MIN = -5
MAX = 5


def fcEval(x):
    # sphere function
    # val = sum(xi ** 2 for xi in x)

    # Rastrigin function
    term1 = sum(xi ** 2 / 4000 for xi in x)
    cosinus = np.cos([xi for xi in x])
    cosinus = [cosinus[i] / math.sqrt(i + 1) for i in range(len(x))]
    term2 = np.prod([c for c in cosinus], axis=0)
    val = term1 - term2 + 1
    val = 20 + sum(xi ** 2 - 10 * np.cos(2 * np.pi * xi) for xi in x)

    return val


def plotAFunction(xref, yref, x, y, xoptimal, yoptimal, message):
    plt.plot(xref, yref, 'b-')
    plt.plot(x, y, 'ro', xoptimal, yoptimal, 'bo')
    plt.title(message)
    plt.show()
    plt.pause(0.9)
    plt.clf()


def main():
    # load a tetwork

    crtDir = os.getcwd()
    filePath = os.path.join(crtDir, 'data', 'polbooks.gml')
    network = readNet(filePath)

    # plot the network

    warnings.simplefilter('ignore')

    # initialise de GA parameters
    gaParam = {'popSize': 25, 'noGen': 2000}
    # problem parameters
    problParam = {'min' : 15, 'max' : 30,'function': modularity, 'network': network, 'noNodes': network['noNodes']}

    allBestFitnesses = []
    allAvgFitnesses = []
    allWorstFitnesses = []
    generations = []

    ga = GA(gaParam, problParam)
    ga.initialisation()
    ga.evaluation()

    for g in range(gaParam['noGen']):
        allPotentialX = [c.repres for c in ga.population]
        allPotentialY = [c.fitness for c in ga.population]
        bestSolX = ga.bestChromosome().repres
        bestSolY = ga.bestChromosome().fitness
        worstSol = ga.worstChromosome().fitness
        allBestFitnesses.append(bestSolY)
        allAvgFitnesses.append(sum(allPotentialY) / len(allPotentialY))
        allWorstFitnesses.append(worstSol)
        generations.append(g)

        ga.oneGenerationElitism()

        bestChromo = ga.bestChromosome()

        communities = {}
        for i in range(len(bestChromo.repres)):
            if bestChromo.repres[i] in communities.keys():
                communities[bestChromo.repres[i]].append(i)
            else:
                communities[bestChromo.repres[i]] = [i]

        print('Best in gen ' + str(g) + ' is: x = ' + str(bestChromo.repres) + ' f(x) = ' + str(bestChromo.fitness))

    chromosome = ga.bestChromosome()

    A = np.matrix(network["mat"])
    G = nx.from_numpy_matrix(A)
    pos = nx.spring_layout(G)  # compute graph layout
    plt.figure(figsize=(5, 5))  # image is 8 x 8 inches
    nx.draw_networkx_nodes(G, pos, node_size=50, cmap=plt.cm.RdYlBu, node_color=chromosome.repres)
    nx.draw_networkx_edges(G, pos, alpha=0.3)
    plt.show()


    #print("\nNumber of communities: " + str(len(communities)) + "\n")

    for com in communities:
        print("C:  " + str(com) + ": " + str(communities[com]))

    plt.ioff()
    best, = plt.plot(generations, allBestFitnesses, 'black', label='best')
    mean, = plt.plot(generations, allAvgFitnesses, 'purple', label='mean')
    worst, = plt.plot(generations, allWorstFitnesses, 'blue', label='worst')
    plt.legend([best, (best, mean), worst], ['Best', 'Mean', 'Worst'])
    plt.show()


main()
