defmodule Castle.Structures.User do
    use Ecto.Schema

    schema "user" do
        field :uid, :string
        field :password, :string
    end

end