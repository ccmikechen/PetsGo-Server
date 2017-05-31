# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Petsgo.Repo.insert!(%Petsgo.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Petsgo.Repo
alias Petsgo.PostType

type_names = ["lost", "event", "adopt", "care"]
type_names
|> Enum.map(fn type_name -> %PostType{type_name: type_name} end)
|> Enum.each(fn type -> Repo.insert!(type) end)
