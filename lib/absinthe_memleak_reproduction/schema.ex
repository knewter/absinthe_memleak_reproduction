defmodule AbsintheMemleakReproduction.Schema do
  use Absinthe.Schema

  @desc "A tag"
  object :tag do
    field(:id, non_null(:integer))
    field(:name, non_null(:string))
  end

  query do
    field :tags, list_of(:tag) do
      resolve(fn _, args, _ ->
        {:ok, []}
      end)
    end
  end
end
