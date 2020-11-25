# Let's take a look an example of a Proc:
#
#
square = Proc.new {|x| x**2 }

# We define a new Proc, that will square a number. We can then call it a few ways:

result = square.call(3)  # => 9
result_two = square.(3)  # => 9
result_three = square[3] # => 9

# WE can think of Procs as _closures_, so they can remember & use context: For example:

def proc_factor(factor)
  Proc.new { |x| x * factor }
end

# irb(main):009:1* def proc_factor(y)
# irb(main):010:1*   Proc.new { |x| x * y }
# irb(main):011:0> end
# => :factor
# irb(main):012:0> proc_one = proc_factor(8)
# irb(main):013:0> proc_one.call(5)
# => 40

# We can utilize a few different methods in order to _create_ Procs; for example:
# class constructor, like what we used above
proc1 = Proc.new {|x| x**2 }

# Kernel#proc method, shorthand:
proc2 = proc { |x| x**2 }

# block receiver
def make_proc(&block)
  block
end

proc3 = make_proc { |x| x**2 } # here our _block_ is x**2

# irb(main):014:1*   def make_proc(&block)
# irb(main):015:1*     block
# irb(main):016:0>   end
# => :make_proc
# irb(main):017:0> proc3 = make_proc { |x| x**2 }
# irb(main):018:0> proc3.call(5)
# => 25

# WE can also use _lambda_ semantics:
# Kernel#lambda method
lambda1 = lambda { |x| x**2 }
# irb(main):020:0> lambda1 = lambda { |x| x**2 }
# irb(main):021:0> lambda1.call(5)
# => 25

# Lambda literal ( stabby lambda )
lambda2 = ->(x) { x**2 }

# irb(main):022:-> lambda2 = ->(x) { x**2 }
# irb(main):023:0> lambda2.call(5)
# => 25
# irb(main):024:0> lambda2.(5)
# => 25
# irb(main):025:0> lambda2[5]
# => 25
