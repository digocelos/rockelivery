defmodule Rockelivery.Users.UserTest do
  use Rockelivery.DataCase, async: true

  import Rockelivery.Factory

  alias Ecto.Changeset
  alias Rockelivery.Users.User

  describe "changeset/1" do
    test "when all params are valid, return a valid changeset" do
      params = build(:user_params)

      response = User.changeset(params)
      assert %Changeset{changes: %{name: "Teste User"}, valid?: true} = response
    end

    test "when there are some error, returns an invalid changeset" do
      params = build(:user_params, %{"age" => 15, "password" => "123"})

      response = User.changeset(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["should be at least 6 character(s)"]
      }

      assert errors_on(response) == expected_response
    end
  end

  describe "changeset/2" do
    test "when updating a changeset, returns a valid changeset with the given changes" do
      params = build(:user_params)

      update_params = %{name: "Bananinha"}

      response =
        params
        |> User.changeset()
        |> User.changeset(update_params)

      assert %Changeset{changes: %{name: "Bananinha"}, valid?: true} = response
    end
  end
end
