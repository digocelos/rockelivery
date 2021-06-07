defmodule Rockelivery.Users.Get do
  alias Rockelivery.{Error, Repo}
  alias Rockelivery.Users.User

  # outra forma de fazer
  def by_id2(id) do
    with %User{} = user <- Repo.get(User, id) do
      {:ok, user}
    else
      :error -> {:error, Error.build_id_format_error()}
      nil -> {:error, Error.build_user_not_found_error()}
    end
  end

  def by_id(id) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build_user_not_found_error()}
      user -> {:ok, user}
    end
  end
end
