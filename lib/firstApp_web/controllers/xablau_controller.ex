defmodule FirstAppWeb.XablauController do
  use FirstAppWeb, :controller
  # import Plug.Conn pra retornar direto
  def get(conn, %{"coxinha" => "2" }) do
    # send_resp(conn, 200, "Funcionou")
    IO.inspect("veio 2")
    render(conn, "list.json", toot: ["Funcionou", "1"])
  end
  def get(conn, %{"coxinha" => valor }) do
    # send_resp(conn, 200, "Funcionou")
    IO.inspect(valor)
    render(conn, "list.json", response: %{ok: :true, toot: ["Funcionou", "OPA"]})
  end
end
