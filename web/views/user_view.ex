defmodule Petsgo.UserView do
  use Petsgo.Web, :view

  def render("user.json", %{user: user}) do
    %{id: user.id,
      username: user.username,
      email: user.email,
      password_hash: user.password_hash,
      first_name: user.first_name,
      last_name: user.last_name,
      sex: user.sex,
      birthday: user.birthday,
      email: user.email,
      phone_number: user.phone_number,
      image: user.image}
  end
end
