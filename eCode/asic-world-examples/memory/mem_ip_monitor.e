<'
struct mem_ip_monitor {
  mem_object : mem_base_object;
  mem_scoreboard : mem_scoreboard;
  event clk is fall('memory_tb.clk') @sim;
  
  input_monitor()@clk is {
    while (TRUE) {
      wait cycle;
      if (('memory_tb.chip_en' == 1) && ('memory_tb.read_write' == 1)) {
         outf("input_monitor : Detected memory write access-> Address : %x   Data : %x\n", 'memory_tb.address','memory_tb.data_in');
	 mem_object.addr = 'memory_tb.address';
	 mem_object.data = 'memory_tb.data_in';
         mem_scoreboard.post_input(mem_object);
      };
    };
  };
};
'>
