defmodule Votting.Factory do
  use ExMachina.Ecto, repo: Votting.Repo

  def admin_factory do
    %Votting.Admin{
      name: "Luciano Correia",
      email: "luciano@luciano.com",
      password_hash: Bcrypt.hash_pwd_salt("123456")
    }
  end
end
