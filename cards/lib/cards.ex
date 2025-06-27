defmodule Cards do
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    ## for value <- values do
    ##   for suit <- suits do
    ##     "#{value} of #{suit}" 
    ##   end
    ## end
    ## |> List.flatten()

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end #less computation and less code solution
  end

  def shuffle do
    create_deck() |> Enum.shuffle()
  end

  def shuffle(deck) do
    Enum.shuffle(deck) #inmutable original data
  end

  def contains?(deck, card) do #boolean answer adds ?
    Enum.member?(deck, card)
  end
end
