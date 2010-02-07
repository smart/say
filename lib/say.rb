require 'rubygems'
require 'pp'

$g_host ||= "localhost"
$g_priority ||= 0
$g_sticky ||= true

module Kernel

  def say(*args, &block)
    args.push(block) if block

    messages = args.empty? ? ["I have nothing to say"]  : args.map{|i| i.pretty_inspect}

    messages.each {|i| `say #{i}`}

    if args.empty?
      nil
    elsif args.size == 1
      args.first
    else
      args
    end
  end
end


