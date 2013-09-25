defmodule Pinger do
  def start do
    await()
  end

  def await do
    receive do
      {:ping, pid} -> pong(pid)
      await
    end
  end

  defp pong(pid) do
    pid <- {:pong, 2}
  end
end

defmodule AssertReceiveBugTest do
  use ExUnit.Case

  test "assert_receive doesn't fail properly when passing a bound variable in as part of a pattern" do
    pinger = spawn_link(Pinger, :start, [])
    pinger <- {:ping, self()}
    expected = 1
    assert_receive({:pong, expected})
  end

  test "assert_receive fails fine if you don't pass a bound variable though..." do
    pinger = spawn_link(Pinger, :start, [])
    pinger <- {:ping, self()}
    assert_receive({:pong, 1})
  end
end
