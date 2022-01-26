defmodule CalcWeb.PageController do
  use CalcWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html", result: nil, params: nil)
  end

  def calculate(conn, params) do
    result = Operations.calculate(params["first"], params["second"], params["operator"])
    render(conn, "index.html", result: result, params: params)
  end
end
