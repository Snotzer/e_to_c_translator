
<'
// This Examples shows how random 
// Test vectors is generated

// This is base object
struct m_base_o {
  addr : byte;
  data : byte;
  rd_wr: bool;
};

// This is transcation generator
struct txgen {
  !base_ob  : m_base_o;
  num_cmds  : int;

  // Method to generate commands
  gen_tx () is {
    var i : int;
    
    // Generate num_cmds commands
    for i from 0 to num_cmds do {
      gen base_ob;
      print base_ob;
    };
  };
};

extend sys {
  txgen : txgen;
  keep txgen.num_cmds == 2;
  
  run() is also {
    // Start the transaction generator
    txgen.gen_tx();
  };
};
'>