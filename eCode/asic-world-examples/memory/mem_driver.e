<'
struct mem_driver {
  mem_object : mem_base_object;
  event clk is rise('memory_tb.clk') @sim;

  drive_mem (object : mem_base_object) @clk is {
    wait cycle;
    'memory_tb.address'    = object.addr;
    'memory_tb.chip_en'    = 1;
    'memory_tb.read_write' = object.rd_wr;
    'memory_tb.data_in'    = (object.rd_wr) ? object.data : 0;
    if (object.rd_wr) {
      outf("Driver : Memory write access-> Address : %x   Data : %x\n", object.addr,object.data);
    } else {
      outf("Driver : Memory read  access-> Address : %x\n", object.addr);
    };
    wait cycle;
    'memory_tb.address'    = 0;
    'memory_tb.chip_en'    = 0;
    'memory_tb.read_write' = 0;
    'memory_tb.data_in'    = 0;
  };
};
'>
