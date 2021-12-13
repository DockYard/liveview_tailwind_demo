defmodule LiveviewTailwindDemo.Repo do
  use Ecto.Repo,
    otp_app: :liveview_tailwind_demo,
    adapter: Ecto.Adapters.Postgres
end
