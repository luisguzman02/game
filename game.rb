class Universe

	attr_accessor :universe

  def initialize(rows, col)
  	@rows = rows
  	@col = col
  	self.universe = Array.new
  	@rows.times do
  		self.universe << Array.new(@col)
  	end
  end

  def set_cell(row, col)
  	type = ["Dead", "Live"].sample
  	eval("#{type}Cell.new(#{row},#{col})")
  end

  def fill
  	self.universe.size.times do |row|
  	  self.universe[row].size.times do |col|
  	  	self.universe[row][col] = set_cell(row, col)
  	  end
  	end
  end

  def print_universe
  	p self.universe
  end

  #live cells
  def less_than_two
  end
  def more_than_three
  end
  def two_or_three
  end

  #dead cells
  def equals_three
  end
end

class Cell
	attr_accessor :row, :col, :neighbours
  def initialize(row, col, neighbours=[])
    self.row = row
    self.col = col
    self.neighbours = neighbours
  end

  def get_neighbours
    (self.row..self.row+1).times do
    	
    end
  end
end

class LiveCell < Cell

  def die
  	dead_cell = DeadCell.new(@row, @col, @neighbours)
  end
end

class DeadCell < Cell

  def live
    live_cell = LiveCell.new(@row, @col, @neighbours)
  end
end

universe = Universe.new(3,3)
universe.fill
universe.print_universe
