defmodule FirstAppV2Web.UserView do
  use FirstAppV2Web, :view
  def render("show.json", %{list_users: list_users}) do #pattern para mostrar todos usuários
    %{response: list_users}                           #render_many <- entender como funciona
  end
  def render("show.json", %{user: user}) do #pattern para mostrar apenas um usuário
    %{response: user}
  end
  def render("success.json", %{message: message}) do #pattern para mensagens de sucesso
    %{response: message}
  end
  def render("error.json", %{message: message}) do #pattern para mensagens de erro
    %{message: message}                            #provavelmente existe uma maneira mais prática
  end
end
