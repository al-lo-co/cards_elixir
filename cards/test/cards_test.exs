defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create deck has 52 cards" do
    assert Cards.create_deck() |> length() == 52
  end

  test "shuffles a deck" do
    deck = Cards.create_deck()
    assert deck != Cards.shuffle(deck)
    refute deck == Cards.shuffle(deck)
  end
end
