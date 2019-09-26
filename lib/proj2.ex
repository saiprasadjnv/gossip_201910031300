defmodule Proj2 do
  def start(numNodes, topology, algorithm) do
    {:ok, agent} = GossipRecord.start_link([])
   {:ok, pid} =  case algorithm do
              "gossip" -> GossipSupervisor.start_link([numNodes, topology, agent])
               "pushsum" -> PushSumSupervisor.start_link([numNodes, topology, agent])
   end
   ch = Enum.map(Supervisor.which_children(pid), fn {_,c,_,_}-> c end)
   IO.inspect ch
     firstNode = Enum.at(ch, 0)
     init_task = Task.async(fn -> initiate_nodes(ch) end)
     Process.sleep(100)
     send(firstNode, ["gossip", self()])
     Task.await(init_task, :infinity)
  end

  def initiate_nodes(ch) do
    stream = Task.async_stream(ch, fn pid -> GenServer.call(pid, :spread_gossip, :infinity) end, timeout: 500000)
    Stream.run(stream)
  end
end
