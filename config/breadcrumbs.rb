crumb :zoo_top do
  link "ZooMania", top_zoos_path
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
