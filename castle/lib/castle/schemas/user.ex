defmodule Castle.Structures.User do
    use Ecto.Schema

    schema "user" do
        field :uid, :string
        field :password, :string
    end

    def changeset(struct, params) do
        struct
        |> cast(params, [:uid, :password])
    end

end