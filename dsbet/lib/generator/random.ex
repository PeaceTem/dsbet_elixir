defmodule DSBet.RandomGenerator do
  @spec get() :: any()
  def get, do: random_number()


  defp random_number do
    # Enum.random(0..9) * NaiveDateTime.now()
    result = rem(Enum.random(0..9) * rem(:os.system_time(:millisecond), 10), 10)
    IO.inspect(result)
  end


end
