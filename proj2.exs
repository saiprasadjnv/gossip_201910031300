a = System.argv()
numNodes = String.to_integer(Enum.at(a,0))
topology = Enum.at(a,1)
algorithm = Enum.at(a,2) 

Proj2.start(numNodes, topology, algorithm)
