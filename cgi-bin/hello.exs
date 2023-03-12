#!/usr/bin/env HOME=/tmp elixir

# Install plug_cgi as a dependency
Mix.install([
  :plug_cgi
])

# Define your plug
# You can use middleware, routing, or anything else
defmodule MyPlug do
  import Plug.Conn

  def init(options) do
    # initialize options
    options
  end

  def call(conn, _opts) do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "Hello world")
  end
end

# Run your plug with plug_cgi
Plug.CGI.run(MyPlug)
