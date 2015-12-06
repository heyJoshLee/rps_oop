def select(array)
  new_array = []
  counter = 0
  while counter < array.length
    if yield(array[counter])
      new_array << array[counter]
    end
    counter += 1
  end
  new_array
end

#test cases

array = [1,2,3,4,5]

select(array) { |num| num.odd? }
select(array) { |num| puts num }
select(array) { |num| num + 1 }