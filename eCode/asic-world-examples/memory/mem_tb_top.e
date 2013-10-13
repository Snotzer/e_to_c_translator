<'
import mem_base_object;
import mem_driver;
import mem_scoreboard;
import mem_ip_monitor;
import mem_op_monitor;
import mem_txgen;

struct mem_tb_top {
  mem_driver     : mem_driver;
  mem_scoreboard : mem_scoreboard;
  
  mem_txgen      : mem_txgen;
    keep mem_txgen.mem_driver == mem_driver;
  mem_ip_monitor : mem_ip_monitor;
    keep mem_ip_monitor.mem_scoreboard == mem_scoreboard;
  mem_op_monitor : mem_op_monitor;
    keep mem_op_monitor.mem_scoreboard == mem_scoreboard;

  event clk is rise('memory_tb.clk') @sim;

  start_tb()@clk is {
    start mem_ip_monitor.input_monitor();
    start mem_op_monitor.output_monitor();
    mem_txgen.gen_cmds();
    stop_run();
  };
};

extend sys {
  tb : mem_tb_top;
  run() is also {
    start tb.start_tb();
  };
};
'>
