defmodule Castle.Repo do
  use Ecto.Repo,
    otp_app: :castle,
    adapter: Ecto.Adapters.Postgres
end
