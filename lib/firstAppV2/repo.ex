defmodule FirstAppV2.Repo do
  use Ecto.Repo,
    otp_app: :firstAppV2,
    adapter: Ecto.Adapters.Postgres
end
