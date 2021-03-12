defmodule Castle.Structures.Class do
    use Ecto.Schema
    import Ecto.Changeset

    schema "classes" do
        field :cid, :string
        field :name, :string
        many_to_many :members, Castle.Structures.User, join_through: "class_members"
    end

    def changeset(struct, params) do
        struct
        |> cast(params, [:user, :data])
    end

end