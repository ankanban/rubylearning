Exercise 1:

I expected the output:
true
false
true

However, the actual output was
false
false
true

So the operator precendence in Ruby is clearly different.

On doing some further reading, I discovered that the 'or' and '||' operators 
are identical except for precedence.
'or' has much lower precedence than '||'.
Apparently the 'or' operator is not meant for logical comparison, but is
used mostly as a control flow operator for statements such as:

<EXPRESSION1> or <EXPRESSION2> 

where the 2 expressions have some important side-effects.
Apparently this is a feature that was borrowed from Perl:

open( FILE, "<filename>" ) or die "error"; 

The above is a very common Perl idiom. 