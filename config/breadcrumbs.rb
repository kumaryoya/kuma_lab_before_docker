crumb :top do
  link "くまらぼ", root_path
end

crumb :privacy_policy do
  link "プライバシーポリシー"
  parent :top
end

crumb :terms_of_service do
  link "利用規約"
  parent :top
end

crumb :zoo_top do
  link "ZooMania", top_zoos_path
  parent :top
end

crumb :zoo_index do
  link "動物園一覧", zoos_path
  parent :zoo_top
end

crumb :zoo_show do
  link "動物園詳細"
  parent :zoo_index
end

crumb :zoo_map do
  link "動物園日本地図"
  parent :zoo_top
end

crumb :zoo_recommend do
  link "おすすめの動物園"
  parent :zoo_top
end

crumb :devil_fruit do
  link "DevilFruitApp"
  parent :top
end

crumb :dog do
  link "わんわんルーレット"
  parent :top
end

crumb :qiita do
  link "Railsちゃんねる"
  parent :top
end