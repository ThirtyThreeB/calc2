defmodule CalcWeb.PageController do
  use CalcWeb, :controller
  alias Calc.{Repo, Operations, Calculation}
  import Ecto.Query

  def index(conn, _params) do
    conn
    # |> assign(:calculations, Repo.all(Calculation))
    # |> IO.inspect(label: "hootie")
    |> render("index.html", result: nil, params: nil, calculations: Repo.all(from(Calculation)))
  end

  def calculate(conn, params) do
    result = Operations.calculate(params["first"], params["second"], params["operator"])

    %Calculation{}
    |> Calculation.changeset(%{"equation" => result})
    |> Repo.insert()
    render(conn, "index.html", result: result, calculations: Repo.all(from(Calculation)))
  end

end
