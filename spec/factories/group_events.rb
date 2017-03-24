FactoryGirl.define do
  factory :group_event do
    name "MyEvent"
    description "MyEvent description"
    start_date DateTime.now.to_date
    end_date DateTime.now.to_date + 9.days
    publish_status "published"
    latitude 10.44
    longitude -66.04
  end
end
