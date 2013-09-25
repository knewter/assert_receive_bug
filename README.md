# AssertReceiveBug

This is a little reproduction case for a bug I found in ExUnit's
`assert_receive` when using a bound variable in a pattern match.

To see the problem, run the tests with `mix test`.  One of the two tests will
pass.  They should both be failing.
