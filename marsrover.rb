class Rover

  attr_accessor :x, :y, :direction, :plateau_x, :plateau_y

  def initialize(x, y, direction)
    @x = x
    @y = y
    @direction = direction
  end

  def read_instruction(instruction_array)
    instruction_array.each do |instruction|
      if instruction.is_a? Integer
        move(instruction)
      elsif instruction.is_a? String
        turn(instruction)
      else
        puts "I'm broken"
      end
    end
  end

  def move(instruction)
    unless @y >= 10 || @y < 0
      if @direction == "N" || @direction == "S"
        @y += instruction
        return @y
      end
    else
      rover_down
    end
    unless @x >= 10 || @x < 0
      if @direction == "E" || @direction == "W"
        @x += instruction
        return @x
      end
    else
      rover_down
    end
  end

  def turn(instruction)
    case instruction
    when "L"
      if @direction == "N" && instruction == "L"
        @direction = "W"
      elsif @direction == "W" && instruction == "L"
        @direction = "S"
      elsif @direction == "S" && instruction == "L"
        @direction = "E"
      elsif @direction == "E" && instruction == "L"
        @direction = "N"
      end

    when "R"
      if @direction == "N" && instruction == "R"
        @direction = "E"
      elsif @direction == "E" && instruction == "R"
        @direction == "S"
      elsif @direction == "S" && instruction == "R"
        @direction = "W"
      elsif @direction == "W" && instruction == "R"
        @direction = "N"
      end
    end
  end

  def current_location
    puts "#{@x}, #{@y}, #{@direction}"
  end

  def rover_down
    puts "Houston to Apollo, Rover is Down!"
  end





end

puts "Rovers have lauched...\nRover1 has landed...\nRover2 has landed...\nRover3 had landed"
rover1 = Rover.new(gets.chomp, gets.chomp, gets.chomp)
print rover1.current_location










=begin

@x and @y can't be less than 0 or greater than 10
  return off grid error

When moving check for direction. If East or West update @x or If North and South
update @y - DONE

When changing direciton check for current direction and update depending on whether asked to turn left or right - DONE

When reading instruction_array check if instruction is_a_int? then call self.move(instruction)
or if is_a_string? call self.turn(instruction) - DONE

=end
