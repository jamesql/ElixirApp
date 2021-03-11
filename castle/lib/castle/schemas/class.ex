defmodule Castle.Structures.Class do
    use Ecto.Schema
    import Ecto.Changeset

    schema "class" do
        belongs_to :user, Castle.Structures.User
        field :data, :string
    end

    def changeset(struct, params) do
        struct
        |> cast(params, [:user, :data])
    end

end