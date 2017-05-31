# Configuration for the Raspberry Pi 2 Model B (target rpi2)
use Mix.Config

config :blink_leds, :pins, [
  %{color: "red", pin: 17},
  %{color: "blue", pin: 22},
  %{color: "green", pin: 27}
]
