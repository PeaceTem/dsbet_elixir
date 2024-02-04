defmodule DSBet.UsersTest do

  describe "random generator" do
    alias DSBet.RandomGenerator


    test "generate random number from 0 to 9" do
      assert Enum.member(0..9,RandomGenerator.get()) == true
    end
  end
end
