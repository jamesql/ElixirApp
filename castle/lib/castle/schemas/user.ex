defmodule Castle.Structures.UserSocket do
    use Ecto.Schema

    schema "user" do
        field :id, :string
        field :password, :string
    end

end