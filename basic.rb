# === Array subtraction ===
[1,2,3] - [2]


# === Map ===
(1..10).map
# or
(1..10).collect

# with a block
(1..10).map {|x| x + 1 }

# or a lambda
add_one = lambda {|x| x + 1 }
(1..10).map &add_one


# === Inject ===
(1..10).inject { |res,elem| res += elem }

# create a hash from an array?

[[:foo, 0], [:bar, 1]].inject({}) {|res,elem| res[elem.first] = elem.last; res }
