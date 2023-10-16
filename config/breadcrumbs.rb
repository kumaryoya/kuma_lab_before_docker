# frozen_string_literal: true

crumb :top do
  link 'くまらぼ', root_path
end

crumb :privacy_policy do
  link 'プライバシーポリシー'
  parent :top
end

crumb :terms_of_service do
  link '利用規約'
  parent :top
end

crumb :zoo do
  link 'ZooMania'
  parent :top
end

crumb :devil_fruit do
  link 'DevilFruitApp'
  parent :top
end

crumb :dog do
  link 'わんわんルーレット'
  parent :top
end

crumb :qiita do
  link 'Railsちゃんねる'
  parent :top
end

crumb :manga do
  link 'コミックレコメンドロボ'
  parent :top
end

crumb :shogun do
  link '天下の大将軍診断'
  parent :top
end

crumb :cat do
  link 'にゃんにゃんルーレット'
  parent :top
end

crumb :movie do
  link 'FilmBaton'
  parent :top
end
