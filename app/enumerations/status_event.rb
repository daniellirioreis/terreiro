class StatusEvent < EnumerateIt::Base
  associate_values :open => 0,
                   :finish=> 1,
                   :canceled=> 2
end