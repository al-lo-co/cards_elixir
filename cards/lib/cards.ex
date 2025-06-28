defmodule Cards do
  @moduledoc """
    Documentation for Cards.
  """
  @doc """
    Creates a deck of cards.
  """
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

  @doc """
    Create a deck and shuffles the cards.
  """
  def shuffle do
    create_deck() |> Enum.shuffle()
  end

  @doc """
    Shuffles a deck of cards.
  """
  def shuffle(deck) do
    Enum.shuffle(deck) #inmutable original data
  end

  @doc """
    Checks if a deck contains a card.

  ## Examples

      iex> deck = Cards.create_deck()
      iex> Cards.contains?(deck, "Ace of Spades")
      true

  """
  def contains?(deck, card) do #boolean answer adds ?
    Enum.member?(deck, card)
  end

  @doc """
    Deals a hand of cards with a `hand_size`.

  ## Examples

      iex> deck = Cards.create_deck()
      iex> hand = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]

  """
  def deal(deck, hand_size) do
    {hand, _remaining_deck} = Enum.split(deck, hand_size) # _remaining_deck is not used, ignored variable

    hand
  end #elixir replacement for variable assigment

  @doc """
    Saves a deck of cards to a file.
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck) #encode the file

    File.write(filename, binary)
  end

  @doc """
    Loads a deck of cards from a file.
  """
  def load(filename) do
    case File.read(filename) do
      # :ok is an atom
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "File does not exist" #error handling
    end
  end

  @doc """
    Creates a hand of cards.
  """
  def create_hand(hand_size) do
    Cards.create_deck()
    |> Cards.shuffle()
    |> Cards.deal(hand_size)
    |> Cards.save("My deck")

    Cards.load("My deck")
  end
end
