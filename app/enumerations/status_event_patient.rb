class StatusEventPatient < EnumerateIt::Base
  associate_values :paid => 0,
                   :pending=> 1,
                   :free => 2,
                   :comfirmed => 3 
end