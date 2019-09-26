defmodule GossipNode do
  use GenServer
  import GossipTopology

  def start_link([x, agent, topology]) do
    GenServer.start_link(__MODULE__, [x,agent, topology]) 
  end
  def handle_call(:spread_gossip, _from, [x,agent,topology]) do
    IO.puts("Called #{inspect(self())}")
    spreadGossip(x,agent,topology, 0)
    {:noreply, [x,agent,topology]}
  end
  def spreadGossip(x, agent, topology, count) when count<10 do
     listen()
     neighbs = getneighbs(agent, topology)
     IO.puts("#{inspect(count)} #{inspect(self())}")
     Process.sleep(100)
     stream = Task.async_stream(neighbs,fn pid -> send(pid, ["gossip", self()]) end)
     Stream.run(stream)
     spreadGossip(x,agent,topology, count+1)
  end
  def spreadGossip(x, agent, topology, count) when count >= 10 do
    IO.puts("Reached end, at #{inspect(self())}")
  end
  def listen() do
    receive do
       ["gossip", pid] -> IO.puts("Received message from #{inspect(pid)} to #{inspect(self())}")
    end
  end
  def init([x, agent, topology]) do
    GossipRecord.addNode(agent,[x,self()])
    #spreadGossip(x, agent, topology,0)
    #start_task = Task.async(fn -> spreadGossip(x, agent, topology,0) end)
    {:ok, [x, agent, topology]}
  end
 

end
