FactoryGirl.define do
  factory :achievement do
    sequence(:title) { |n| "Achievement #{n}"} # sequences are used to maintain uniquiness id,email...
    description "description"
    privacy Achievement.privacies[:private_access]
    featured false
    cover_image "some_file.png"

    #Defining Subfactory
    factory :public_achievement do
      privacy Achievement.privacies[:public_access]
    end
  end
end
