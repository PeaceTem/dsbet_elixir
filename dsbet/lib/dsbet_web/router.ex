defmodule DSBetWeb.Router do
  use DSBetWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    # plug DSBet.Plugs.SetUser #our module plug is added onto list of plugs. notice the all above are function plugs.

  end


  pipeline :require_authenticated_user do
    # remove this plug after it has been tested
    plug DSBet.Plugs.SetUser #our module plug is added onto list of plugs. notice the all above are function plugs.

    plug DSBet.Plugs.RequireAuth

  end

  scope "/api", DSBetWeb do
    pipe_through :api
  end

  scope "/auth", DSBetWeb do
    pipe_through :api
    # go to costmap and fetch the :browser atom properties
    # auth
    get "/signout", AuthController, :signout
    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback

  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:dsbet, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery] # research more about :protect_from_forgery

      live_dashboard "/dashboard", metrics: DSBetWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
