defmodule Solution do
  @spec two_sum(nums :: [integer], target :: integer) :: [integer]
  def two_sum(nums, target) do
    nums
    |> Enum.with_index()
    |> Enum.reduce_while(%{}, fn {num, key}, acc ->
      complement = target - num

      if Map.has_key?(acc, complement) do
        {:halt, {acc[complement], key}}
      else
        {:cont, Map.put(acc, num, key)}
      end
    end)
  end
end

IO.inspect Solution.two_sum([2, 7, 11, 15], 9)
