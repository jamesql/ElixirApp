defmodule Castle.Repo.Migrations.CreateDatabase do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :uid, :string
      add :password, :string
    end

    create table(:classes) do
      add :cid, :string
      add :name, :string
    end

    create table (:class_members) do
      add :uid, references(:users)
      add :cid, references(:classes)
    end

    create unique_index(:class_members, [:cid, :uid])
  end
end
