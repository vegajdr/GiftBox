json.user @wishlists do |wishlist|
  json.id wishlist.id
  json.name wishlist.name
  json.items wishlist.items do |item|
    json.id             item.id
    json.name           item.name
    json.description    item.description
    json.image_url      item.image_url
    json.product_url    item.product_url
  end
end
