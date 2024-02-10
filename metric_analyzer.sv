class metric extends uvm_object;
  
 `uvm_object_utils(metric)
  protected real measurements[$];
  protected real minimum;
  protected real maximum;

  function new(string name = "metric");
    super.new(name);
  endfunction : new

  virtual function void measure(real value = 1);
    measurements.push_back(value);
  endfunction : measure

  virtual function void remove_measurement();
    if (measurements.size() > 0) begin
      measurements.pop_back();
    end
  endfunction : remove_measurement

  virtual function int total_measurements();
    return measurements.size();
  endfunction : total_measurements

  virtual function int sum();
    real total = 0;
    foreach (measurements[i]) begin
      total += measurements[i];
    end
    return total;
  endfunction : sum

  virtual function real mean();
    int size = measurements.size();
    if (size == 0) return 0;
    return sum() / size;
  endfunction : mean

  virtual function real min();
    if (measurements.size() == 0) return 0;
    minimum = measurements[0];
    foreach (measurements[i]) begin
      if (measurements[i] < minimum) minimum = measurements[i];
    end
    return minimum;
  endfunction : min

  virtual function int max();
    if (measurements.size() == 0) return 0;
    maximum = measurements[0];
    foreach (measurements[i]) begin
      if (measurements[i] > maximum) maximum = measurements[i];
    end
    return maximum;
  endfunction : max

endclass : metric
