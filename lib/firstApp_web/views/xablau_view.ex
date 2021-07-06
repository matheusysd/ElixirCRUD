defmodule FirstAppWeb.XablauView do
  use FirstAppWeb, :view
  def render("list.json", %{response: valor}) do
    %{response: valor}
  end
  def render("list.json", %{}) do
    %{chave: "aaa"}
  end
  def render("create.json", valor) do
    %{chave: valor}
  end
end
