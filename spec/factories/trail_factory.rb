FactoryGirl.define do
  factory :trail_one, class: Trail do
    name "Trail one"
    description "Trail description"
  end

  factory :trail_two, parent: :trail_one do
    name "Trail two"
  end
end
