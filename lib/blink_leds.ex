defmodule BlinkLeds do

  @moduledoc """
  Simple example to blink a list of LEDs forever using ElixirALE.

  The list of LEDs is platform-dependent, and defined in the config
  directory (see config.exs). See README.md for build instructions.
  """

  alias ElixirALE.GPIO

  @on_duration  200 # ms
  @off_duration 200 # ms

  def start(_type, _args) do
    led_list = Application.get_env(:blink_leds, :pins)
      |> Enum.map(&(&1[:pin]))
      |> Enum.map(fn (pin) ->
        pin
          |> GPIO.start_link(:output)
          |> elem(1)
    end)

    spawn fn -> blink_list_forever(led_list) end

    {:ok, self()}
  end

  defp blink_list_forever(led_list) do
    Enum.each(led_list, &blink(&1))
    blink_list_forever(led_list)
  end

  defp blink(pin) do
    GPIO.write(pin, 1)
    :timer.sleep @on_duration
    GPIO.write(pin, 0)
    :timer.sleep @off_duration
  end
end
