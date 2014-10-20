require_relative './rapid7'
require 'benchmark'

class FunctionStats

  def benchmark_method(class_name, method, file)
    output = File.open(file, "w")
    (1000..100000).step(1000).each do |i|
      a = (0..i).collect { rand(10000) }
      b = (0..i).collect { rand(10000) }
      c = a + b
      func_time = Benchmark.realtime do
        class_name.send(method, c)
      end
      output << "#{c.length}\t#{func_time}\n"
    end
    output.close
  end
end

FunctionStats.new.benchmark_method(Rapid7.new, :function, "/Users/laynemcnish/gSchoolWork/Scratch/rapid_7/bin/function_benchmarks.txt")
FunctionStats.new.benchmark_method(Rapid7.new, :return_duplicated_values, "/Users/laynemcnish/gSchoolWork/Scratch/rapid_7/bin/duplicates_benchmarks.txt")