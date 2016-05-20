require 'pry'

class TwentyFour

  def self.solve(a)
    operations = get_sets_of_operations                 #64 sets [["+", "+", "+"], ["+", "+", "-"]...]
    numbers = get_sets_of_numbers(a)             #24 sets [[1, 2, 3, 4], [1, 2, 4, 3]...]  
    make_possible_solutions(numbers, operations)
    # find_solutions
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
    all_expressions = []
  
    all_expressions << add_o_o_1(expressions[0])  #send expression to order of operations method # 1
    all_expressions << add_o_o_2(expressions[0])  #send expression to order of operations method # 2

  end

  def self.add_o_o_1(exp1)      
    exp1.dup.insert(0, "((").insert(4, ")").insert(7, ")") 
  end

  def self.add_o_o_2(exp2)    
    exp2.dup.insert(0, "(").insert(3, "(").insert(7, "))") 
  end

  def self.find_solutions
    # solutions = []

    # @possible_solutions.each do |s|   #[2.0, "+", 12.0, "+", 5.0, "+", 3.0, nil]
    #   current_value = eval(s[0..2].join)            # 14
    #   current_value = eval(s[3..4].unshift(current_value).join)     # [14.0, "+", 5.0]
    #   current_value = eval(s[5..6].unshift(current_value).join)

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

p TwentyFour.solve([1,2,3,4])

#[2,12,5,3]