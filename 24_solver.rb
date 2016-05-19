require 'pry'
class TwentyFour

  # def self.solve(a)
  #   set_of_operations = ["+","-","/","*"].repeated_permutation(3).to_a #[["+", "+", "+"], ["+", "+", "-"]...]
  #   current_value = 0

  #   operator = set_of_operations[0][0].to_sym 
  #   # current_value = current_value operator 1

  #   # set_of_operations.each_with_index do |operations, index|
  #   #   current_value= a[0] operations[index] a[1]
  #   #   binding.pry
  #   #   p current_value
  #   # end
  
  # #(1 + 2) + 3) * 4) = 24
  # end 

  def self.solve(a)
    set_of_operations = ["+","-","/","*"].repeated_permutation(3).to_a
    set_of_numbers = a.repeated_permutation(4).to_a
    good_set = []

    set_of_numbers.each do |permutation|
      if permutation.uniq == permutation
        good_set << permutation
      end
    end

    good_set
  end
end



p TwentyFour.solve([1,2,3,4])