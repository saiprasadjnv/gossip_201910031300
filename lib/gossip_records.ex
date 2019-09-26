defmodule GossipRecord do
  use Agent
  def start_link(initial_value) do
    Agent.start_link(fn -> initial_value end, name: __MODULE__)
  end
  def getneighbs(pid, list) do
    Agent.get(pid, fn state -> for i<-list, do: Enum.at(state,i) end, 500000)
  end
  def getRandomNeighb(pid) do
    Agent.get(pid, fn state -> Enum.random(state) end, 500000)
   # Enum.at(nodes, 4)
  end

  def numNodes(pid) do
     Agent.get(pid, fn state -> length(state) end, 500000)
  end

  def addNode(pid, node) do
    Agent.update(pid, fn state -> state ++ [node] end, 500000)
  end

  def sortNodes(pid) do
    Agent.update(pid, fn state -> state = Enum.sort(state) end, 500000)
  end
end
