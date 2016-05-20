require 'pry'

class TwentyFour

  def self.solve(a)
    operations = get_sets_of_operations                 #64 sets [["+", "+", "+"], ["+", "+", "-"]...]
    numbers = get_sets_of_numbers(a)             #24 sets [[1, 2, 3, 4], [1, 2, 4, 3]...]  
    make_possible_solutions(numbers, operations)
    puts find_solutions
  end 

  private

  def self.get_sets_of_operations
    set_of_operations = ["+","-","/","*"].repeated_permutation(3).to_a
  end

  def self.get_sets_of_numbers(a)
    sets_of_integers = a.permutation(4).to_a

    sets_of_integers.each do |set|
      set.map!(&:to_f)     #equivalent to set.map!(|num| num.to_f)
    end
    sets_of_integers
  end

  def self.make_possible_solutions(nums, ops)
    expressions = []

    nums.each do |num|
      ops.each do |op|
        expressions << num.zip(op).flatten.compact
      end 
    end 
    @all_expressions = []
  
    @all_expressions << add_o_o_1(expressions)  #send expression to order of operations method # 1
    @all_expressions << add_o_o_2(expressions)  #send expression to order of operations method # 2

    @all_expressions
  end

  def self.add_o_o_1(expressions)
    temp_storage = []  
    expressions.each do |exp|   
      temp_storage << exp.dup.insert(0, "((").insert(4, ")").insert(7, ")") 
    end
    temp_storage
  end

  def self.add_o_o_2(expressions)  
    temp_storage = []   
    expressions.each do |exp| 
      temp_storage << exp.dup.insert(0, "(").insert(3, "(").insert(7, "))") 
    end
    temp_storage
  end

  def self.find_solutions
    solutions = []

    @all_expressions.each do |wrapper|
      wrapper.each do |exp|
        value = eval(exp.join)
        if value == 24
          solutions << exp.join
        end
      end
    end

    solutions

    #   if current_value == 24
    #     solutions << s.join
    #   end
    # end
    # solutions

    # @possible_solutions.each do |equation|
    #   if eval(equation) == 24
    #     solutions << equation
    #   end
    # end
    # solutions
  end
end

p TwentyFour.solve([5,6,8,13])

#[2,12,5,3]