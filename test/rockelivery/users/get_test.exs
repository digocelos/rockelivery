defmodule Rockelivery.Users.GetTest do
  use Rockelivery.DataCase, async: true

  import Rockelivery.Factory

  alias Rockelivery.Error
  alias Rockelivery.Users.{Create, Get, User}

  describe "by_id/1" do
    setup do
      params = build(:user_params)
      {:ok, %User{id: id}} = Create.call(params)
      {:ok, id: id}
    end

    test "when all params are valid, returns an user", %{id: id} do
      response = Get.by_id(id)

      assert {:ok,
              %User{
                age: 27,
                cep: "74464160",
                cpf: "12345678900",
                email: "email@email.com",
                name: "Teste User"
              }} = response
    end

    test "when a params is invalid, return an error" do
      response = Get.by_id("00000000-0000-0000-0000-000000000000")

      assert {:error,
              %Error{
                result: "User not found",
                status: :not_found
              }} = response
    end
  end

  describe("by_id/2") do
    setup do
      params = build(:user_params)
      {:ok, %User{id: id}} = Create.call(params)
      {:ok, id: id}
    end

    test "when all params are valid, returns an user", %{id: id} do
      response = Get.by_id2(id)

      assert {:ok,
              %User{
                age: 27,
                cep: "74464160",
                cpf: "12345678900",
                email: "email@email.com",
                name: "Teste User"
              }} = response
    end

    test "when a params is invalid, return an error" do
      response = Get.by_id2("00000000-0000-0000-0000-000000000000")

      assert {:error,
              %Error{
                result: "User not found",
                status: :not_found
              }} = response
    end
  end
end
