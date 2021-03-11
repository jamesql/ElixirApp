defmodule Castle.Repo do
  use Ecto.Repo,
    otp_app: :castle,
    adapter: Ecto.Adapters.Postgres

  def start(_,_) do
    # Start supervisor
    children = [
      Friends.Repo
    ]
end
