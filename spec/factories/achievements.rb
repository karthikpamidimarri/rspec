FactoryGirl.define do
  factory :achievement do
    sequence(:title) { |n| "Achievement #{n}"} # sequences are used to maintain uniquiness id,email...
    description "description"
    featured false
    cover_image "some_file.png"

    #Defining Subfactory
    factory :public_achievement do
      privacy :public_access
    end

    factory :private_achievement do
      privacy :private_access
    end

  end
end
