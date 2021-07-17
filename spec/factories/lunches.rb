FactoryBot.define do
  factory :lunch do
    soup                 { '豚汁' }
    staple_food          { 'ご飯' }
    main_dish            { '焼き魚' }
    side_dish            { 'サラダ' }
    drink                { '牛乳' }
    other                { 'デザート' }
    menu_date            { '7月7日' }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.jpg'), filename: 'test.jpg')
    end
  end
end



