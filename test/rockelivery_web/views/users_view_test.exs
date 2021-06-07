defmodule RockeliveryWeb.UsersViewTest do
  use RockeliveryWeb.ConnCase, async: true

  import Phoenix.View
  import Rockelivery.Factory

  alias RockeliveryWeb.UsersView

  test "render create.json" do
    user = build(:user)

    response = render(UsersView, "create.json", user: user)

    assert %{
             message: "User created!",
             user: %Rockelivery.Users.User{
               address: "Rua das bananeiras",
               age: 27,
               cep: "74464160",
               cpf: "12345678900",
               email: "email@email.com",
               id: "475a2d5d-890a-44a2-bbef-d66c153f6e5b",
               inserted_at: nil,
               name: "Teste User",
               password: "123456",
               password_hash: nil,
               updated_at: nil
             }
           } = response
  end
end
