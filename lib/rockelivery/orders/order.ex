defmodule Rockelivery.Orders.Order do
  use Ecto.Schema

  import Ecto.Changeset

  alias Rockelivery.Items.Item
  alias Rockelivery.Users.User

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:address, :comments, :payment_method, :user_id]
  @payment_methods [:money, :credt_card, :debit_card]

  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "orders" do
    field :address, :string
    field :comment, :string
    field :payment_method, Ecto.Enum, values: @payment_methods

    many_to_many :items, Item, join_through: "orders_items"
    belongs_to :user, User

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params, items) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> put_assoc(:items, items)
    |> validate_length(:address, min: 10)
    |> validate_length(:comments, min: 6)
  end
end
