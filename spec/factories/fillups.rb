# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :fillup do |f|
  f.miles_since_last_fillup 1.5
  f.gallons 1.5
end
