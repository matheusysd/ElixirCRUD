defmodule FirstAppWeb.UserView do
  use FirstAppWeb, :view

  def render("list.json", %{data: data}) do
    %{response: data}
  end

  def render("new.user", changeset) do
    %{response: %{ok: true, data: changeset}}
  end

  def render("create.json", %{response: response}) do
    %{response: %{message: "User created successfully", id: response}, ok: true}
  end

  def render("show.json", %{user: user}) do
    %{response: user}
  end

  def render("update.json", %{user: user}) do
    %{response: %{message: "User #{user.id} updated"}}
  end

  def render("error.json", %{message: message}) do
    %{response: %{message: message}}
  end
end
