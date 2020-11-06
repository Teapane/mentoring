# Welcome to Recursion Again
![](https://media.giphy.com/media/3GuP496Wrkos8/giphy.gif)

# Understanding Recursion
- Recursion is an interesting subject and can be confusing when you first think about it. A method calling itself? In this economy? Recursion also comes with its pitfalls,
`STACK LEVEL TOO DEEP` anyone? However, it can be a valuable tool in your programming toolbox so let's dive in and try to make sense of it.

# Ruby `Flatten`
In Ruby, we can `flatten` arrays, or in other words, make multi-dimensional arrays one dimensional. For Example:
```rb
$ irb
irb(main):003:0> arr = [1, 2, 3, [4, 5], [6]]
irb(main):004:0> arr
=> [1, 2, 3, [4, 5], [6]]
irb(main):005:0> arr.flatten
=> [1, 2, 3, 4, 5, 6]
```
How convenient! If we look at the docs, it's literally in the defintion that it is indeed recursive!
```
  flatten(p1 = v1) public

  Returns a new array that is a one-dimensional flattening of self (recursively).

  That is, for every element that is an array, extract its elements into the new array.

  The optional level argument determines the level of recursion to flatten.
```

And the C source shows this as well:
```c
static VALUE
rb_ary_flatten(int argc, VALUE *argv, VALUE ary)
{
  int mod = 0, level = -1;
  VALUE result, lv;

  rb_scan_args(argc, argv, "01", &lv);
  if (!NIL_P(lv)) level = NUM2INT(lv);
  if (level == 0) return ary_make_shared_copy(ary);

  result = flatten(ary, level, &mod);
  OBJ_INFECT(result, ary);

  return result;
}
```
Don't worry if you don't know C, its just to illustrate that it is in fact recursive. So, let's create our own `Flatten` method in Ruby, without using the enumerable to understand recursion better. Let's also make our `Flattener` a little fancier, and have it reject nils as well:

When done, our Flattener should operate in the same way that `flatten` and `compact` work:
```rb
# irb
irb(main):001:0> a = [1, 2, 3, [nil, 5, 6], [nil, nil, 7, 8]]
irb(main):002:0> a.flatten.compact
=> [1, 2, 3, 5, 6, 7, 8]
irb(main):003:0> require './flattener'
=> true
irb(main):004:0> Flattener.flatten(a)
=> [1, 2, 3, 5, 6, 7, 8]
```
Here are some tests to get you going:
```
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'flattener'

class FlattenerTest < MiniTest::Unit::TestCase
  def klass
    Flattener
  end

  def test_it_ignores_non_arrays
    non_arr = "Hi, I am not an array"
    non_arr_2 = {foo: "bar"}
    non_arr_3 = 179
    assert_equal "I shant flatten anything other than an array", Flattener.flatten(non_arr)
    assert_equal "I shant flatten anything other than an array", Flattener.flatten(non_arr_2)
    assert_equal "I shant flatten anything other than an array", Flattener.flatten(non_arr_3)
  end

  def test_empty_array
    skip
    arr = []
    new = []
    assert_equal new, Flattener.flatten(arr)
  end

  def test_simple_array
    skip
    arr = [1,2,[3]]
    new = [1, 2, 3]
    assert_equal new, Flattener.flatten(arr)
  end

  def test_it_rejects_nils
    skip
    arr = [1, 2, [nil, nil], [5, 6, nil]]
    new = [1, 2, 5, 6]
    assert_equal new, Flattener.flatten(arr)
  end

  def test_all_values_in_nested_list_are_nil
    skip
    arr = [nil, [[[nil]]], nil, nil, [[nil, nil], nil], nil]
    flat_array = Flattener.flatten(arr)
    assert_equal [], flat_array
  end
end


```

Also of note: `Flatten` takes an optional `depth` argument, so we can tell it how deeply we want it to flatten.
```rb
irb(main):008:0> a = [ 1, 2, [3, [4, 5]]]
irb(main):009:0> a.flatten(1)
=> [1, 2, 3, [4, 5]]
irb(main):010:0> a.flatten(2)
=> [1, 2, 3, 4, 5]
```
We can ignore this for now.
