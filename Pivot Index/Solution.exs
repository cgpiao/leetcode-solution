defmodule Solution do
  @spec pivot_index(nums :: [integer]) :: integer
  def pivot_index(nums) do
    result = nums
    |> Enum.with_index()
    |> Enum.reduce_while([], fn {num, key}, acc ->
      if Enum.sum([num | acc]) === Enum.sum(Enum.slice(nums, key..-1)) do
        {:halt, key}
      else
        {:cont, [num | acc]}
      end
    end)
    if is_integer(result), do: result, else: -1
  end
end
IO.puts Solution.pivot_index([1,7,3,6,5,6]) == 3
IO.puts Solution.pivot_index([1,2,3]) == -1
