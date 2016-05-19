require 'pry'
class TwentyFour
  def self.solve(a)
    get_set_of_operations                           #[["+", "+", "+"], ["+", "+", "-"]...]
    get_unique_set_of_numbers(a)                    #[[1, 2, 3, 4], [1, 2, 4, 3]...]
  end 
  
  private

  def self.get_set_of_operations
    set_of_operations = ["+","-","/","*"].repeated_permutation(3).to_a
  end

  def self.get_unique_set_of_numbers(a)
    set_of_numbers = a.repeated_permutation(4).to_a #[[1, 1, 1, 1], [1, 1, 1, 2]...] not unique

    unique_set = []

    set_of_numbers.each do |permutation|
      if permutation.uniq == permutation
        unique_set << permutation
      end
    end

    unique_set
  end
end

p TwentyFour.solve([1,2,3,4])