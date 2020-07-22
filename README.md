READ ME 

1.	Team Members: 
a. Shiridi Sai Prasad
    UFID - 8073-3499
     Mail: shiridisaiprasad@ufl.edu

b. Aditya Bharadwaj
    UFID: 9890-1939
    Mail: aditya.bharadwaj@ufl.edu 

2. Language Used: Elixir 

3. About the project: 
    This project simulates the message based group communication protocols, namely Gossip Protocol and  Push-sum Protocol. It demonstrates the resilience of group communication protocls compared to Master based protocols. These protocols are used in decentralized distributed systems, where the communication among the nodes of the distributed system are not centrally controlled. As a result, there are no single point failures. The load is distributed equally among all the participating nodes and the communication is faster. The nodes in the distributed system can be configured in several topologies based on the neighborship among the nodes. In this project, we compare the performance of different topologies. We simulate single point failure scenarios and demonstrate the resilience of the system.  
    
4.	What is working: 
  i.	Gossip Algorithm: 
      a.	Full Network  Topology – Can achieve full convergence until 2000 nodes. 
      b.	Line Topology - Can achieve full convergence until 2000 nodes. 
      c.	Random 2D topology - Can achieve full convergence until 2000 nodes.
      d.	Honey comb – Can Achieve full convergence until 2000 nodes. 
      e.	Random Honeycomb - Can achieve full convergence until 1800 nodes. 
      f.	3DTorus Network – Can achieve full convergence until 2000nodes. 
  ii.	Push-Sum Algorighm: 
      a.	Full Network  Topology – Can achieve full convergence until 1400 nodes. 
      b.	Line Topology - Can achieve full convergence until 1200 nodes.
      c.	Random 2D topology – Can achieve full convergence until 1200 nodes.
      d.	Honey comb – Can achieve full convergence until 1200 nodes.
      e.	Random Honeycomb – Can achieve full convergence until 1200 nodes.
      f.	3DTorus Network – Can achieve full convergence until 1200 nodes. 

3.	Procedure to execute: 
Run the below command:
“mix run proj2.exs NumberOfNodes Topology Algorithm” 
Options: 
Topology: full, line, rand2D, 3Dtorus, honeycomb, randhoneycomb 
Algorithm : gossip , push-sum 
