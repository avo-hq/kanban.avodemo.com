require "faker"

FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    roles { {admin: false, manager: [true, false].sample, writer: [true, false].sample} }
  end

  factory :project do
    name { Faker::App.name }
    status { [:closed, :rejected, :failed, :loading, :running, :waiting, :done, :finalized, :archived, :finished].sample }
    stage { ['discovery', 'idea', 'done', 'on hold', 'cancelled'].sample }
    budget { Faker::Number.decimal(l_digits: 4) }
    users_required { Faker::Number.between(from: 10, to: 100) }
    started_at { Time.now - rand(10...365).days }
    meta { [{ foo: 'bar', hey: 'hi' }, { bar: 'baz' }, { hoho: 'hohoho' }].sample }
    progress { Faker::Number.between(from: 0, to: 100) }
  end
end
