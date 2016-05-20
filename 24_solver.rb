require 'pry'

class TwentyFour

  def self.solve(a)
    operations = get_set_of_operations                 #64 sets [["+", "+", "+"], ["+", "+", "-"]...]
    numbers = get_unique_set_of_numbers(a)             #24 sets [[1, 2, 3, 4], [1, 2, 4, 3]...]  
    make_possible_solutions(numbers, operations)
    find_solutions
  end 

  private

  def self.get_set_of_operations
    set_of_operations = ["+","-","/","*"].repeated_permutation(3).to_a
  end

  def self.get_unique_set_of_numbers(a)
    set_of_numbers = a.repeated_permutation(4).to_a #[[1, 1, 1, 1], [1, 1, 1, 2]...] not unique
    unique_sets = []

    set_of_numbers.each do |permutation|
      if permutation.uniq == permutation
        unique_sets << permutation
      end
    end

    unique_sets.each do|set|
      set.map! { |num| num.to_f }
    end
    unique_sets 
  end

  def self.make_possible_solutions(nums, ops)
    @possible_solutions = []

    nums.each do |num|
      ops.each do |op|
        @possible_solutions << num.zip(op).flatten.join
      end 
    end
    @possible_solutions
  end

  def self.find_solutions
    solutions = []
    @possible_solutions.each do |equation|
      if eval(equation) == 24
        solutions << equation
      end
    end
    solutions
  end
end

p TwentyFour.solve([2,12,5,3])