# Rapid7 - Code Exercise

## Original Method

```
def function(a)
  a.inject({}){ |a,b| a[b] = a[b].to_i + 1; a}.\
  reject{ |a,b| b == 1 }.keys
end
```

## Explanation

Assuming that this function takes an array as the parameter “a”, the method takes the values of the given array and injects them into a hash with the keys (a) being the original array values and the values (b) being how many times the original array value was duplicated throughout the array.  

The next line removes all keys and values that only appeared in the original array once and returned just the keys that were left.

To give an example, if you provided the method with an array of [1,2,2,3,4,5,6,6,6,7], the final result would be [2, 6].

## Solution

To improve the given function, I broke it down into a few steps:

**1: I wrote tests to test the original function to confirm it's functionality.
**2: I added tests for my new methods I would add later.
**3: I rewrote the function into two more explicit methods that separated the responsibilities so that each would only do one thing.
**4: Throughout my refactoring, I ran my tests and consulted the results to make sure that with every change I made, I still had functioning methods.
**5: I created a benchmarking program to test which was faster, the original function or my new methods.

## New Methods

```
  def count_duplicates(input_array)
    items_count = Hash.new(0)
    input_array.each do |item|
      items_count[item] += 1
    end
    items_count
  end

  def return_duplicated_values(input_array)
    duplicated_values =[]
    duplicate_count = count_duplicates(input_array)

    duplicate_count.each do |key, value|
      if value > 1
        duplicated_values.push(key)
      end
    end
    duplicated_values
  end
```  

## Conclusion

While both methods should scale with the same complexity, benchmarking the results showed that my methods would run about 3-5% faster than the original function.

Each approach inserts n elements into a hash and does n lookups in a hash in the worst case.  
The cost would be n times the cost of an insert or a lookup.  

In the average case scenario, the cost will be O(1*n) which is O(n) or linear and the worst case scenario would be O(n*n) which is O(n^2) or quadratic.  

![](https://cloud.githubusercontent.com/assets/7490960/4708226/33a2a36c-5895-11e4-90ef-926be80f0c9b.png)