<'
struct mem_scoreboard {
  // Create a keyed list to store the written data
  // Key to the list is address of write access
  !mem_object: list(key:addr) of mem_base_object;
  // post_input method is used for storing write data
  // at write address
  post_input (input_object : mem_base_object) is {
    mem_object.add(input_object);
  };
  // post_output method is used by the output monitor to 
  // compare the output of memory with expected data
  post_output (output_object : mem_base_object) is {
    if mem_object.key_exists(output_object.addr) then { 
       outf("scoreboard : Found Address %x in list\n",output_object.addr);
       if (output_object.data != mem_object.key(output_object.addr).data) then {
         out ("Scoreboard : Error : Expected data and output data from memory don't match");
	 outf(             "Expected -> %x\n",mem_object.key(output_object.addr).data);
	 outf(             "Got      -> %x\n",output_object.data);
       } else {
         out("Scoreboard : Expected data and output data from memory match");
       };
    };
  };
};
'>
