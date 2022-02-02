defmodule Calc.Operations do
  def calculate(nil), do: nil

  def calculate(first, second, operator) do
    IO.inspect(binding(), label: "binding")
    ans =
    case operator do
      "+" ->
        String.to_integer(first) + String.to_integer(second)

      "-" ->
        String.to_integer(first) - String.to_integer(second)

      "*" ->
        String.to_integer(first) * String.to_integer(second)

      "/" ->
        String.to_integer(first) / String.to_integer(second)
    end
    "#{first} #{operator} #{second} = #{ans}"
  end
end
