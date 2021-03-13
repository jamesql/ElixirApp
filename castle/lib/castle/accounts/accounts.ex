defmodule Castle.Accounts do
    import Ecto.Query
    alias Castle.{Repo, Structures.User}

    def auth_with_email_and_password(%{"email" => e, "pass" => p}) do
        d = User |> Repo.get_by(email: e)
        cond do
            d !== nil -> 
                # Auth User
                if(p |> Bcrypt.verify_pass(d.password), do: {:ok, "Logged in!"}, else: {:error, "Incorrect Password."})
            d == nil ->
                # Reject User 
                {:error, "Account not found with that email address."}
        end
    end

    def register_email_and_password(%{"email" => e, "pass" => p}) do
        c = User |> Repo.get_by(email: e)
        if c == nil do # Register User
            s = Snowflake.next_id()
            ep = Bcrypt.hash_pwd_salt(p)
            {:ok, u} = Repo.insert(%User{uid: s, email: e, password: p}) 
        else # Respond With Error
            {:error, "Account already registered with that email."}
        end
    end

end
