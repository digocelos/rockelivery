defmodule RockeliveryWeb.ItemsView do
  use RockeliveryWeb, :view

  alias Rockelivery.Items.Item

  def render("create.json", %{item: %Item{} = item}) do
    %{
      message: "Item created!",
      item: item
    }
  end
end
