# BlinkLeds

## Targets

Nerves applications produce images for hardware targets based on the
`MIX_TARGET` environment variable. If `MIX_TARGET` is unset, `mix` builds an
image that runs on the host (e.g., your laptop). This is useful for executing
logic tests, running utilities, and debugging. Other targets are represented by
a short name like `rpi2` that maps to a Nerves system image for that platform.
All of this logic is in the generated `mix.exs` and may be customized. For more
information about targets see:

https://hexdocs.pm/nerves/targets.html#content

## Getting Started

Wire your Raspberry Pi components:

![Raspberry Pi Diagram](assets/raspberry_pi_3LED_schem.jpg/?raw=true "Raspberry Pi Diagram")

To start your Nerves app:
  * `export MIX_TARGET=my_target` or prefix every command with
    `MIX_TARGET=my_target`. For example, `MIX_TARGET=rpi2`
  * Install dependencies with `mix deps.get`
  * Create firmware with `mix firmware`
  * Burn to an SD card with `mix firmware.burn`

Tips:
  * Install all programs needed by Nerves Project

  ```bash
  $ brew update
  $ brew install erlang
  $ brew install elixir
  $ brew install fwup squashfs coreutils
  ```

  * Add the nerves_bootstrap archive to your Mix environment

  ```bash
  $ mix archive.install https://github.com/nerves-project/archives/raw/master/nerves_bootstrap.ez
  ```

## Learn more

  * Official docs: https://hexdocs.pm/nerves/getting-started.html
  * Official website: http://www.nerves-project.org/
  * Discussion Slack elixir-lang #nerves ([Invite](https://elixir-slackin.herokuapp.com/))
  * Source: https://github.com/nerves-project/nerves
