defmodule Chapter_2 do
  @moduledoc """
  Chapter 2 - Induction and Recursion
  """

  @spec are_equal?([any], [any]) :: boolean
  @doc """
  Def. 2.12 - Two sequences S and T are equal iff
  1. they are both empty or
  2. the head of S equals the head of T and the tail of S equals the tail of T
  """
  def are_equal?(_s = [], _t = []), do: true
  def are_equal?(_s = [], _t), do: false
  def are_equal?(_s, _t = []), do: false

  def are_equal?([head_s | tail_s], [head_t | tail_t]),
    do: head_s == head_t and are_equal?(tail_s, tail_t)

  @spec is_member_of?(any, [any]) :: boolean
  @doc """
  Def 2.1.3 - ElementOf(x, S) is
  1. FALSE if S is empty
  2. TRUE if S is nonempty and x = head(S)
  2'. ElementOf(x, tail(S)) otherwise.
  """
  def is_member_of?(_x, []), do: false
  def is_member_of?(x, [head_s | _tail_s]) when x == head_s, do: true

  def is_member_of?(x, [_head_s | tail_s]),
    do: is_member_of?(x, tail_s)

  @spec get_length([any]) :: non_neg_integer
  @doc """
  Def 2.1.4 - If S is a sequence, then Length(S) is
  1. 0, if S is empty
  2. 1 + Length(tail(s)), if not.
  """
  def get_length([]), do: 0

  def get_length([_s_head | s_tail]),
    do: 1 + length(s_tail)

  @spec get_elem(any, [any]) :: any
  @doc """
  Def 2.1.5 - Kth(k, S) is
  1. undefined, if S is empty
  1'. head(S) if k= 1
  2. Kth(k - 1, tail(S)) otherwise

  Note: This utilizes 0th indexing
  """
  def get_elem(_idx, []), do: nil
  def get_elem(-1, _), do: nil
  def get_elem(0, [s_head | _s_tail]), do: s_head

  def get_elem(idx, [_s_head | s_tail]),
    do: get_elem(idx - 1, s_tail)
end