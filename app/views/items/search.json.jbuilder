json.array! @item_search do |item|
  json.id item.id
  json.name item.name
  json.images url_for(item.images.first)
  json.price item.price
end