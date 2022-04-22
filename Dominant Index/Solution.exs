defmodule Solution do
  def dominant_index(nums) when length(nums) == 1 do
    0
  end
  @spec dominant_index(nums :: [integer]) :: integer
  def dominant_index(nums) do
    {max, max_index, second, _} = nums
    |> Enum.with_index()
    |> Enum.reduce({0, -1, 0, -1}, fn {num, key}, acc ->
      cond do
        elem(acc, 0) < num ->
          {num, key, elem(acc, 0), elem(acc, 1)}
        elem(acc, 2) < num ->
          {elem(acc, 0), elem(acc, 1), num, key}
        true -> acc
      end
    end)

    if max >= 2 * second, do: max_index, else: -1
  end
end
IO.puts Solution.dominant_index([1,2,3,4]) === -1
IO.puts Solution.dominant_index([3,6,1,0]) === 1
IO.puts Solution.dominant_index([1]) === 0
IO.puts Solution.dominant_index([0, 0, 0, 1]) === 3
