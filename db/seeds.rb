User.create!(name: "Anna", email: "anna@test.com", password: "password")
User.create!(name: "Test", email: "test@test.com", password: "password")

Supplier.create!(name: "Adorama", email: "service@adorama.com", phone_number: "8001234567")
Supplier.create!(name: "B&H Photo Video", email: "service@bhphoto.com", phone_number: "8003217654")
Supplier.create!(name: "Best Buy", email: "service@bestbuy.com", phone_number: "8002345678")

Product.create!(name: "Sony a7III", price: 1998, description: "mirrorless")
Product.create!(name: "Canon EOS 5D Mark IV", price: 2499, description: "dslr")
Product.create!(name: "Nikon D850", price: 2997, description: "dslr")
  
Image.create(url: "https://www.lonelyspeck.com/wp-content/uploads/2018/11/a7iii-touchscreen-af-point-selection.gif", product_id: 1)
Image.create(url: "https://www.adorama.com/images/XLarge/ica5dm4.jpg", product_id: 2)
Image.create(url: "https://www.adorama.com/images/XLarge/inkd850.jpg", product_id: 3)

Category.create!(name: "Mirrorless")
Category.create!(name: "DSLR")

CategoryProduct.create!(product_id: 1, category_id: 1)
CategoryProduct.create!(product_id: 1, category_id: 2)
CategoryProduct.create!(product_id: 2, category_id: 2)
CategoryProduct.create!(product_id: 3, category_id: 2)