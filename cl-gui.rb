#Adding Colorize for Coloring Terminal Outputs
require 'colorize'

def logo
  system('clear')
  window_l = ENV['COLUMNS'].to_i
  window_h = ENV['LINES'].to_i

  padding = (" "*window_l).colorize(:background => :black)
  color_logo = {:color => :red, :background => :black}
  small_art = [
    padding,
    l1 = "                                                           ".center(window_l).colorize(color_logo),
    l2 = "                                                           ".center(window_l).colorize(color_logo),
    l3 = "   ▄████████  ▄██████▄      ███        ▄████████ ███▄▄▄▄   ".center(window_l).colorize(color_logo),
    l4 = "  ███    ███ ███    ███ ▀█████████▄   ███    ███ ███▀▀▀██▄ ".center(window_l).colorize(color_logo),
    l5 = "  ███    ███ ███    ███    ▀███▀▀██   ███    █▀  ███   ███ ".center(window_l).colorize(color_logo),
    l6 = " ▄███▄▄▄▄██▀ ███    ███     ███   ▀  ▄███▄▄▄     ███   ███ ".center(window_l).colorize(color_logo),
    l7 = "▀▀███▀▀▀▀▀   ███    ███     ███     ▀▀███▀▀▀     ███   ███ ".center(window_l).colorize(color_logo),
    l8 = "▀███████████ ███    ███     ███       ███    █▄  ███   ███ ".center(window_l).colorize(color_logo),
    l9 = "  ███    ███ ███    ███     ███       ███    ███ ███   ███ ".center(window_l).colorize(color_logo),
    l10 ="  ███    ███  ▀██████▀     ▄████▀     ██████████  ▀█   █▀  ".center(window_l).colorize(color_logo),
    l11 ="  ███    ███                                               ".center(window_l).colorize(color_logo),
    l12 ="                                                           ".center(window_l).colorize(color_logo),
    l13 ="                                                           ".center(window_l).colorize(color_logo),
    padding
  ]
  small_art.each{|x| puts x}
  ((ENV['LINES'].to_i-2)/2-9).times do
    puts (" "*window_l).colorize(:color => :red, :background => :black)
  end
end