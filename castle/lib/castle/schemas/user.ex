defmodule Castle.Structures.User do
    use Ecto.Schema
    import Ecto.Changeset
    import Ecto.Query

    schema "users" do
        field :uid, :string
        field :password, :string
        many_to_many :classes, Castle.Structures.Class, join_through: "class_members"
    end

    def changeset(struct, params) do
        struct
        |> cast(params, [:password, :classes])
    end

end