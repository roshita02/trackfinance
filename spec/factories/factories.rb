FactoryGirl.define do
  factory :record do
    title "Test expense"
    date "2017-12-25"
    amount "50000"
  factory :invalid_record do
    amount "cant be blank"
  end
end
end
