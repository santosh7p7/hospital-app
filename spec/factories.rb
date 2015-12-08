FactoryGirl.define do

  factory :department do |f|
     f.sequence(:name) {|n| "test#{n}"}
     after(:create) do |department|
        FactoryGirl.create_list(:user, 2, department_id: department.id)
     end
  end

  factory :user do |f|
     f.sequence(:name) {|n| "name#{n}"}
     f.department_id 1
     after(:create) do |user|
       FactoryGirl.create_list(:chat, 12, user: user)
     end
  end

  factory :chat do |f|
    f.content "content"
    association :user, factory: :user
  end

end
