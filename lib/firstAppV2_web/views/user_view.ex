defmodule FirstAppV2Web.UserView do
  use FirstAppV2Web, :view
  def render("getUsers.json", %{data: data}) do
    %{response: data}
  end
end
