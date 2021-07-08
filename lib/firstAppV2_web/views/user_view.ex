defmodule FirstAppV2Web.UserView do
  use FirstAppV2Web, :view
  def render("show.json", %{list_users: list_users}) do
    %{response: list_users}
  end
  def render("show.json", %{user: user}) do
    %{response: user}
  end
  def render("success.json", %{message: message}) do
    %{response: message}
  end
  def render("error.json", %{message: message}) do
    %{message: message}
  end
end


# def render(list_users)
# def render(%{user: user})
