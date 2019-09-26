defmodule GossipSupervisor do
  use Supervisor
  def start_link(state) do 
     Supervisor.start_link(__MODULE__, state, name: __MODULE__)
  end
  def fillnodes(numNodes, topology) do
    num = case topology do
            "Random2D" ->  :math.sqrt(numNodes) |> :math.ceil() |> :math.pow(2)|> floor()
            "3Dgrid" -> :math.pow(numNodes, 1/3) |> :math.ceil() |> :math.pow(3)|> floor()
          end
    num
  end
  @impl true
  def init([numNodes, topology, agent]) do
    children = for x <- 1..numNodes, do: worker(GossipNode, [[x, agent,topology]],[id: 10000 + x])
    IO.inspect agent
   ## ch = Enum.map(children,fn {_,p,_,_} -> p end)
    IO.inspect children
   # num = fillnodes(numNodes, topology)
    #added_nodes = for x<- numNodes+1..num, do: worker(GossipNode, [x,agent,topology],[id: 10000 + x])
    #children = children ++ added_nodes 
    GossipRecord.sortNodes(agent)
    Supervisor.init(children, strategy: :one_for_one)
  end
 end

