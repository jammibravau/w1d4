class Person

attr_accessor :first_name, :last_name

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
  end

  def greeting
    puts "Hi my name is #{first_name} #{last_name}"
  end
end

class Student < Person

  def learn
    puts "I get it"
  end

end

class Instructor < Person

  def teach
    puts "Everything in Ruby is an object"
  end

end
