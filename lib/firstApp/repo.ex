defmodule FirstApp.Repo do
  use Ecto.Repo,
    otp_app: :firstApp,
    adapter: Ecto.Adapters.Postgres
end
