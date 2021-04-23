defmodule InmanaWeb.RestaurantsControllerTest do
  use InmanaWeb.ConnCase, async: true

  # describe create/2 o barra 2 é de dois parametros
  describe "create/2" do
    test "When all params are valid, creates the user", %{conn: conn} do
      params = %{name: "Siri cascudo", email: "siri@cascudo.com"}

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "Restaurant created!",
               "restaurant" => %{
                 "email" => "siri@cascudo.com",
                 "id" => _id,
                 "name" => "Siri cascudo"
               }
             } = response
    end

    test "When there are invalid params, returns an error", %{conn: conn} do
      params = %{email: "siri@cascudo.com"}

      expeted_response = %{"message" => %{"name" => ["can't be blank"]}}

      response =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:bad_request)

      assert response == expeted_response
    end
  end
end
