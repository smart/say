require 'rubygems'
require 'pp'
require 'rbconfig'

VOICES = [
  "Agnes",
  "Kathy",
  "Princess",
  "Vicki",
  "Victoria",
  "Bruce",
  "Fred",
  "Junior",
  "Ralph",
  "Albert",
  "Bad News",
  "Bahh",
  "Bells",
  "Boing",
  "Bubbles",
  "Cellos",
  "Deranged",
  "Good News",
  "Hysterical",
  "Pipe Organ",
  "Trinoids",
  "Whisper",
  "Zarvox"
]
unless Config::CONFIG['host_os'] =~ /darwin/
  raise "say is only supported by OS X right now"
end

module Kernel

  def say(*args, &block)
    say_as(nil, *args, &block)
  end

  def say_as(voice, *args, &block)
    args.push(block) if block

    messages = args.empty? ? ["I have nothing to say"]  : args.map{|i| i.pretty_inspect}
    say_args = ""
    say_args += "-v #{voice}" if VOICES.include?(voice)
    messages.each {|i| `say #{say_args} #{i}`}

    if args.empty?
      nil
    elsif args.size == 1
      args.first
    else
      args
    end
  end

end


