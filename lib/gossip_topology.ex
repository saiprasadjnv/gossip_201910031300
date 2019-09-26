defmodule GossipTopology do
  def getneighbs(agent, topology) when topology== "full_network" do
    IO.puts("Called topology get neighbs")
    IO.inspect agent
    neighbs = for _i <- 1..3, do: GossipRecord.getRandomNeighb(agent)
    neighb_PIDs = Enum.map(neighbs, fn x -> Enum.at(x,1) end)
    neighb_PIDs
  end
end
