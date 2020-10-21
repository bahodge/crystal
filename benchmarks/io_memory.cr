require "benchmark"

Benchmark.ips do |bm|
  bm.report("String.build") do
    String.build do |io|
      99.times do
        io << "hello world"
      end
    end
  end

  bm.report("IO::Memory") do
    io = IO::Memory.new
    99.times do
      io << "hello world"
    end
    io.to_s
  end
end