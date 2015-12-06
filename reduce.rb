array = [1,2,3,4,5]


def reduce(array, default=0)
  counter = 0
  acc = default

  while counter <  array.length
    acc = yield(acc, array[counter])
    counter += 1
  end

  acc
end

reduce(array) {|acc, num| acc + num }
