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
