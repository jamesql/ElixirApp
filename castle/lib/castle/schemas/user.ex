defmodule Castle.Structures.User do
    use Ecto.Schema
    import Ecto.Changeset

    schema "users" do
        field :password, :string
        has_many :classes, Castle.Structures.Class
    end

    def changeset(struct, params) do
        struct
        |> cast(params, [:password, :classes])
    end

end