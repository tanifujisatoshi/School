FactoryBot.define do
  factory :user do
    name                  { 'satoshi' }
    email                 { 'test@example' }
    password              { 'abc123' }
    password_confirmation { password }
  end
end
