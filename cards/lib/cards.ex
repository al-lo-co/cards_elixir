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

  def deal(deck, hand_size) do
    {hand, _remaining_deck} = Enum.split(deck, hand_size) # _remaining_deck is not used, ignored variable
    
    hand
  end #elixir replacement for variable assigment

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck) #encode the file
  
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      # :ok is an atom 
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "File does not exist" #error handling 
    end
  end

  def create_hand(hand_size) do
    Cards.create_deck()
    |> Cards.shuffle()
    |> Cards.deal(hand_size)
    |> Cards.save("My deck")
  
    Cards.load("My deck")
  end
end
