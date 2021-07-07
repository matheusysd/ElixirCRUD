defmodule FirstAppV2Web.UserView do
  use FirstAppV2Web, :view
  def render("getUsers.json", %{data: data}) do
    %{response: data}
  end
  def render("success.json", %{message: message}) do
    %{response: message}
  end
  def render("error.json", %{message: message}) do
    %{message: message}
  end
end
