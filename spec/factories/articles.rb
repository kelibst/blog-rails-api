FactoryBot.define do
  factory :article do
    sequence(:title) { |n| "The Tittle of my awesome blog #{n}" }
    sequence(:content) { |n| "The content of my awesome blog #{n}"}
    sequence(:slug) { |n| "my_awesome_title_#{n} "}
  end
end
