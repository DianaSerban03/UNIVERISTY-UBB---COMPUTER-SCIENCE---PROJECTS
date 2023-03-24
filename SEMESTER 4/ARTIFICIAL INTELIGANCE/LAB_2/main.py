from collections import defaultdict

"""
 A community, with respect to graphs, can be defined as a subset of nodes
 that are densely connected to each other and
 loosely connected to the nodes in the other communities
 in the same graph.
"""
"""
 Basic schema of implementation of the Girvan-Newman algorithm:#
 1. Calculate the edge-betweenness for all edges in the graph.
 2. Remove the edge with the highest betweenness.
 3. Recalculate the edge-betweenness for all edges in the graph.
 4. Repeat steps 2 and 3 until the desired number of communities is reached.
 """

"profa"
# prerequisites
import os
import networkx as nx
import numpy as np
import matplotlib.pyplot as plt
import warnings
import scipy as sp

warnings.simplefilter("ignore")


# PROFA
def greedyCommunitiesDetectionByTool(net):
    # Input: a graph
    # Output: list of community index (for every node)

    from networkx.algorithms import community

    A = np.matrix(net["mat"])
    G = nx.from_numpy_matrix(A)
    communitiesGenerator = community.girvan_newman(G)
    topLevelCommunities = next(communitiesGenerator)
    sorted(map(sorted, topLevelCommunities))
    com = [0 for _ in range(net['noNodes'])]
    index = 1
    for community in sorted(map(sorted, topLevelCommunities)):
        for node in community:
            com[node] = index
        index += 1
    return com

#PROFA
def readNetworkFromGml(file):
    gmlNet = nx.read_gml(file, label="id")
    mat = nx.adj_matrix(gmlNet)
    matrix = [[0] * len(gmlNet.nodes) for _ in range(len(gmlNet.nodes))]
    tmp = mat.nonzero()
    for i in range(len(tmp[0])):
        matrix[tmp[0][i]][tmp[1][i]] = 1
    net = {
        'noNodes': len(gmlNet.nodes),
        'mat': matrix,
        'noEdges': len(gmlNet.edges),
        'degrees': [degree[1] for degree in gmlNet.degree()]
    }

    return net

#PROFA
def plotNetwork(net, com=None):
    if com is None:
        com = [1] * net['noNodes']
    np.random.seed(123)
    A = np.matrix(net["mat"])
    G = nx.from_numpy_matrix(A)
    pos = nx.spring_layout(G)
    plt.figure(figsize=(5, 5))
    nx.draw_networkx_nodes(G, pos, node_size=50, cmap=plt.cm.cool, node_color=com)
    nx.draw_networkx_edges(G, pos, alpha=0.2)
    plt.show()


def edgesCentrality(G):
    #in edges vom stoca o lista de tupluri formate din edge si scorul lui de centralitate
    edg_betw = nx.edge_betweenness_centrality(G)
    max_edge = max(edg_betw.values())
    list_edges_to_remove =[]
    for e, v in edg_betw.items():
        if (v == max_edge):
            list_edges_to_remove.append(e) #cream o lista cu toate muchiile care au max edge
    return list_edges_to_remove

#calculam nr de noduri din fiecare comunitate si stocam in dict
def nrCom(com):
    res = defaultdict(int) #initializam valorile implicit cu 0
    for node in com:
        res[node] += 1 #crestem valoarea corespunzatoare cheii node
    return res


def greedyCommunitiesDetection(network, no_of_communities, NOD):
    # Input: a graph
    # Output: list of community index (for every node)

    G1 = np.matrix(network["mat"]) #dictionaul netowrk contine o matrice de adiacenta sub forma unei liste de liste
    G = nx.from_numpy_matrix(G1)#G1 e convertit este convertit in graf neorientat
    while len(list(nx.connected_components(G))) < no_of_communities:
        list_of_edges_to_remove = edgesCentrality(G)
        G.remove_edges_from(list_of_edges_to_remove)

    repart = [1] * network['noNodes']
    k = 0
    for c in nx.connected_components(G):#pentru fiecare comunitate, se atribuie fiecarui node k
        k += 1
        for node in c:
            repart[node] = k
    x_community = repart[NOD]
    print(f"The community for node {NOD} is {x_community}")
    print("nr of comm",nrCom(repart))
    return repart


print("DOLPHINS")
net = readNetworkFromGml("dolphins.gml")
assert (nrCom(greedyCommunitiesDetection(net, 2, 5)) == nrCom(
        greedyCommunitiesDetectionByTool(net)))
print("FOOTBALL")
net = readNetworkFromGml("football.gml")
assert (nrCom(greedyCommunitiesDetection(net, 2, 6)) == nrCom(
        greedyCommunitiesDetectionByTool(net)))
print("KARATE")
net = readNetworkFromGml("karate.gml")
assert (nrCom(greedyCommunitiesDetection(net, 2, 8)) == nrCom(
        greedyCommunitiesDetectionByTool(net)))
print("KREBS")
net = readNetworkFromGml("krebs.gml")
assert (nrCom(greedyCommunitiesDetection(net, 2, 13)) == nrCom(
        greedyCommunitiesDetectionByTool(net)))
print("POLBOOKS")
net = readNetworkFromGml("polbooks.gml")
assert (nrCom(greedyCommunitiesDetection(net, 2, 26)) == nrCom(
        greedyCommunitiesDetectionByTool(net)))
print("LES MISERABLES")
net = readNetworkFromGml("lesmiserables.gml")
assert (nrCom(greedyCommunitiesDetection(net, 2, 26)) == nrCom(
        greedyCommunitiesDetectionByTool(net)))
print("LESMIS")
net = readNetworkFromGml("lesmis.gml")
assert (nrCom(greedyCommunitiesDetection(net, 2, 15)) == nrCom(
        greedyCommunitiesDetectionByTool(net)))
print("PW")
net = readNetworkFromGml("5.gml")
assert (nrCom(greedyCommunitiesDetection(net, 25, 1)) == nrCom(
    greedyCommunitiesDetectionByTool(net)))
print("FACULTY")
net = readNetworkFromGml("4.gml")
assert (nrCom(greedyCommunitiesDetection(net, 2, 3)) == nrCom(
    greedyCommunitiesDetectionByTool(net)))
print("FRIENDS")
net = readNetworkFromGml("ex6.gml")
assert (nrCom(greedyCommunitiesDetection(net, 2, 4)) == nrCom(
    greedyCommunitiesDetectionByTool(net)))


