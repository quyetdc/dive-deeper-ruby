# Benchmarking is the comparison between two or more things that get the same job done (for example, Apache vs Nginx).

# Profiling is about finding the bottlenecks, the things that are slow in a system. 
# The resulting data from running a performance test will become your baseline.

def expensive_method n
	5000.times do 
		n*n
	end
end

def measure_time
	before = Time.now
	yield
	Time.now - before
end

p measure_time { expensive_method 1000 }




# Using ruby-prof
# Instead of benchmarking a few methods against each other you can profile everything

# TO use ruby-prof gem
# gem install ruby-prof [--no-document]

# To check the performance
# ruby-prof  <script.rb>
def my_sort(nums, sorted=[])
	# get min
	# Remove min from nums
	# recursion until nums.size == 0 with new nums and new sorted
	# Return sorted

	min = nums.min
	sorted << min

	nums.delete_if {|n| n == min}

	if nums.size > 0
		my_sort nums, sorted
	else
		sorted
	end
end

arr = (1..500).to_a.shuffle
p my_sort arr

# profiling data
# %self      total      self      wait     child     calls  name                           location
# 90.96      0.019     0.019     0.000     0.000      500   Array#delete_if                
# 4.16      0.020     0.001     0.000     0.019      500  *Object#my_sort                 performance.rb:31
# 2.96      0.001     0.001     0.000     0.000      500   Array#min 


# Get min with index
def my_min(nums)
	idx = 0
	min = nums[idx]

	nums.each_with_index do |num, index|
		if min > num
			min = num
			idx = index
		end
	end

	[min, idx]
end

def second_sort nums, sorted=[]
	min, idx = my_min nums
	sorted << min

	nums.delete_at idx

	if nums.size > 0
		second_sort nums, sorted
	else
		sorted
	end
end


arr = (1..500).to_a.shuffle
p second_sort arr
# %self      total      self      wait     child     calls  name                           location
# 88.26      0.022     0.022     0.000     0.000      500   Array#each                     
# 3.75      0.024     0.001     0.000     0.023      500  *Object#optimized_sort          performance.rb:73
# 2.63      0.023     0.001     0.000     0.022      500   Object#my_min                  performance.rb:59
# 1.98      0.022     0.000     0.000     0.022      500   Enumerable#each_with_index     
# 1.60      0.000     0.000     0.000     0.000      500   Array#delete_at          



# OTHER TOOLS
# rack-mini-profiler    https://github.com/MiniProfiler/rack-mini-profiler 
# memory_profiler       https://github.com/SamSaffron/memory_profiler