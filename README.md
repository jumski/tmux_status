# TmuxStatus

Object-oriented way to build Tmux status string in Ruby

## Installation

Install gem

    $ gem install tmux_status

## Requirements

- ruby 1.9
- ifconfig if you want to use Transfer wrapper (available on any linux machine)
- acpi if you want to use Battery wrapper (`sudo apt-get install acpi`)

## Usage

Add this to your ~/.tmux.conf`

    set -g status-utf8 on
    set -g status-justify left
    set -g status-interval 2
    set-option -g status-right-length 120
    set-option -g status-right "#(tmux-status music_player,date_time,transfer,battery)"

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
