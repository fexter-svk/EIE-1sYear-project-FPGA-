#Dot product

Findings: 
Unroll - 6 cycles, memory inefficient because all the components have to be prepeated because the loops are unrolled
Pipeline - only 5 cycles we didn't het the MUX component

Throughput
Unrolled - 6 
Piplelined - 7
          
in the main file we have changed the saving of the result directly to the output instead of the accumulator
