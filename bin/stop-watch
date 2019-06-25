#!/usr/bin/env ruby
# frozen_string_literal: true

st = Time.now
loop do
  begin
    sleep 0.1234
    elapsed = Time.now - st
    min = elapsed.to_i / 60
    sec = elapsed - min * 60
    print format("\r%02d:%05.2f", min, sec)
  rescue Interrupt
    break
  end
end
