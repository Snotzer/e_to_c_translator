<'
struct mem_txgen {
  mem_object : mem_base_object;
  mem_driver : mem_driver;
  
  num_cmds   : int;

  keep soft num_cmds == 3;
  event clk is rise('memory_tb.clk') @sim;

  gen_cmds()@clk is {
  
  };
};
'>
