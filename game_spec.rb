require_relative 'game'

describe Universe do
	describe '#initialize' do
		it "debe inicializa el universo" do
			@universe = Universe.new(2, 3)
			@universe.universe.should be_kind_of Array
		end
	end

	describe '#set_cell' do
		it 'debe retornar cualquier tipo de celula' do
			@universe = Universe.new(3,3)
			@universe.set_cell(1,1).should be_kind_of Cell
		end
	end

	describe '#fill' do
		it 'debe llenar el universo' do
			@universe = Universe.new(2, 2)
			@universe.fill
			@universe.universe.size.times do |row|
  	  			@universe.universe[row].size.times do |col|
  	  				@universe.universe[row][col].should_not be_nil
  	  			end
  			end

		end
	end
end

describe Cell do
	describe '#initialize' do
		it 'debe de inicializar los valores en row y col para la celula' do
			@cell = Cell.new(1,1)
			@cell.row.should eq 1
			@cell.col.should eq 1
		end
	end
	describe '#get_neighbours' do
		it 'debe de retornar un array de celulas' do
			@universe = Universe.new(3,3)
			@universe.fill
			@universe.universe[0][0].get_neighbours.should be_kind_of Array
		end

	end
end

describe LiveCell do
	describe '#die' do
		it 'debe devolver celula muerta' do
			@cell_live = LiveCell.new(1,1)
			@cell_live.die.should be_kind_of DeadCell
		end
	end
end

describe DeadCell do
	describe '#live' do
		it 'debe devolver celula viva' do
			@cell_dead = DeadCell.new(1,0)
			@cell_dead.live.should be_kind_of LiveCell
		end
	end
end



