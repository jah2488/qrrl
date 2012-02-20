Factory.define :user do |f|
  f.sequence(:email) { |n| "foo#{n}@test.com" }
  f.password "please"
end

