def buy_milk 
	"got milk"
end

def buy_bacon
	raise "No bacon left!"
end

def go_shopping 
	buy_milk 
	buy_bacon
end

go_shopping