defmodule Operations do
  def calculate(nil), do: nil

  def calculate(first, second, operator) do
    result =
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

    result
  end
end
