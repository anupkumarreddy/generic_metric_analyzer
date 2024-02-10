`include "metrics_pkg.sv"

module top();
  import uvm_pkg::*;
  import metrics_pkg::*;
  
 `include "uvm_macros.svh"
  
  initial begin
    metric_analyzer#(int) i_metric_analyzer;
    i_metric_analyzer = metric_analyzer#(int)::type_id::create("metric_analyzer", null);
    i_metric_analyzer.create_metric("latency");
    i_metric_analyzer.create_metric("datarate");
    i_metric_analyzer.create_metric("bandwidth");
    
    // Add some dummy values. In reality the measuring happens in write method of metric analyzer
    for (int i = 1; i < 20; i++) begin
      i_metric_analyzer.measure("latency", i*2);
      i_metric_analyzer.measure("datarate", i*200);
      i_metric_analyzer.measure("bandwidth", i*2000);
    end
    
    i_metric_analyzer.print();
  end
endmodule : top
