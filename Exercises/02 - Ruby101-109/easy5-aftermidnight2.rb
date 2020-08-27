MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = 24 * MINUTES_PER_HOUR

def after_midnight(time)
  sum = 0
  sum += ((time[0..1].to_i) % 24) * MINUTES_PER_HOUR
  sum += time[3..4].to_i
  sum
end

def before_midnight(time)
  minutes_after = after_midnight(time)
  (MINUTES_PER_DAY - minutes_after) % MINUTES_PER_DAY
end


p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0