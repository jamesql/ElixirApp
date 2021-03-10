defmodule Castle.Accounts do
    import Ecto.Query

    def auth_with_email_and_password(%{"email" => email, "pass" => pass}) do
      IO.puts(Application.get_env(:castle, CastleWeb.Bcrypt)[:salt])
    end

    def register_email_and_password(%{"email" => email, "pass" => pass}) do
    end

end
