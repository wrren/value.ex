defmodule Value do
  @moduledoc """
  Exposes utiliy functions for manipulating single values. The Value package
  attempts to provide the same kind of ease-of-use as the Enum package, particularly
  when used as part of a function pipeline.
  """

  @doc """
  Simple equality check. Returns true if the first parameter matches the second, false
  otherwise.
  """
  def is?(value, value),
    do: true
  def is?(_value, _other),
    do: false

  @doc """
  Transform the given value by passing it to the given function and returning the result.
  """
  def map(value, fun) when is_function(fun),
    do: fun.(value)

  @doc """
  Wrap the provided value in an {:ok, value} tuple. If the value is already wrapped
  in an {:ok, value} tuple it will be returned as-is.
  """
  def ok({:ok, value}),
    do: {:ok, value}
  def ok(value),
    do: {:ok, value}

  @doc """
  Wrap the provided value in an {:error, value} tuple. If the value is already wrapped
  in an {:error, value} tuple it will be returned as-is.
  """
  def error({:error, value}),
    do: {:error, value}
  def error(value),
    do: {:error, value}

  @doc """

  """
  def zip(value, list) when is_list(list),
    do: :erlang.list_to_tuple([value | list])
  def zip(value, other),
    do: {value, other}
end
