defmodule Rockelivery.Factory do
  use ExMachina.Ecto, repo: Rockelivery.Repo

  alias Rockelivery.Users.User

  def user_params_factory do
    %{
      "address" => "Rua das bananeiras",
      "age" => 27,
      "cep" => "74464160",
      "cpf" => "12345678900",
      "email" => "email@email.com",
      "password" => "123456",
      "name" => "Teste User"
    }
  end

  def user_factory do
    %User{
      address: "Rua das bananeiras",
      age: 27,
      cep: "74464160",
      cpf: "12345678900",
      email: "email@email.com",
      password: "123456",
      name: "Teste User",
      id: "475a2d5d-890a-44a2-bbef-d66c153f6e5b"
    }
  end

  def user_update_params_factory do
    %{
      "id" => "475a2d5d-890a-44a2-bbef-d66c153f6e5b",
      "email" => "email2@email.com",
      "age" => 27
    }
  end
end
