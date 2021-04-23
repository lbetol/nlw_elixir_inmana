defmodule Inmana.WelcomerTest do
  use ExUnit.Case

  alias Inmana.Welcomer

  describe "welcome/1" do
    test "When the user is spacial, returns a special message" do
      params = %{"name" => "banana", "age" => "42"}
      expeted_result = {:ok, "You are very special banana"}

      result = Welcomer.welcome(params)

      assert result == expeted_result
    end

    test "When the user is not special, return a message" do
      params = %{"name" => "alberto", "age" => "29"}
      expeted_result = {:ok, "Welcome alberto"}

      result = Welcomer.welcome(params)

      assert result == expeted_result
    end

    test "When the user is under age, return an error" do
      params = %{"name" => "alberto", "age" => "15"}
      expeted_result = {:error, "You shall not pass alberto"}

      result = Welcomer.welcome(params)

      assert result == expeted_result
    end
  end
end
