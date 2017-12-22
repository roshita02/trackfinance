FactoryGirl.define do
  factory :record do
    title "Test expense"
    date Time.new(2017,12,25)
    amount "50000"
  factory :invalid_record do
    title "abc"
  end
end
end
