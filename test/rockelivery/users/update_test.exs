defmodule Rockelivery.Users.UpdateTest do
  use Rockelivery.DataCase, async: true

  import Rockelivery.Factory

  alias Rockelivery.Error
  alias Rockelivery.Users.{Create, Update, User}

  describe "call/1" do
    setup do
      params = build(:user_params)
      {:ok, %User{id: id}} = Create.call(params)
      {:ok, id: id}
    end

    test "when all params are valid, returns the user updated", %{id: id} do
      params = string_params_for(:user_update_params, %{"id" => id})

      response = Update.call(params)

      assert {:ok, %User{id: _id, age: 27, email: "email2@email.com"}} = response
    end

    test "when there are invalid params, return an error", %{id: id} do
      params = string_params_for(:user_update_params, %{"id" => id, "age" => 15})

      expected_response = %{age: ["must be greater than or equal to 18"]}

      response = Update.call(params)

      assert {:error, %Error{status: :bad_request, result: changeset}} = response
      assert errors_on(changeset) == expected_response
    end
  end
end
