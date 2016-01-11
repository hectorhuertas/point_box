FactoryGirl.define do

  sequence :username do |n|
    "Peter #{n}"
  end
  factory :user do
    username
    # role 0
    # points 0
    # redeemed_points 0
  end

  factory :admin, class: User do
    username "admin"
    role 1
  end
end
