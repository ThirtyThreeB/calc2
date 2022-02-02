defmodule CalcWeb.PageController do
  use CalcWeb, :controller
  alias Calc.{Repo, Operations, Calculation}
  import Ecto.Query

  def index(conn, _params) do
    current_user =
      if conn.assigns.current_user |> is_nil() do
        0
      else
        conn.assigns.current_user.id
      end

    conn
    |> render("index.html",
      result: nil,
      params: nil,
      history: Repo.all(from(c in Calculation, where: c.user_id == ^current_user))
    )
  end

  def calculate(conn, params) do
    result = Operations.calculate(params["first"], params["second"], params["operator"])
    current_user = conn.assigns.current_user.id
    query = from(c in Calculation, where: c.user_id == ^current_user)

    %Calculation{}
    |> Calculation.changeset(%{"equation" => result, "user_id" => current_user})
    |> Repo.insert()

    render(conn, "index.html", result: result, history: Repo.all(query))
  end
end
