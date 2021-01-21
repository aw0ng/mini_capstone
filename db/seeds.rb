# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
  camera = Product.new({ name: 'Sony a7III', price: 1998, image_url: 'https://www.adorama.com/images/XLarge/isoa7m3.jpg', description: 'Sony Alpha a7 III 24MP UHD 4K Mirrorless Digital Camera (Body Only)' })
  camera.save

  camera = Product.new({ name: 'Canon EOS 5D Mark IV', price: 2499, image_url: 'https://www.adorama.com/images/XLarge/ica5dm4.jpg', description: 'Canon EOS 5D Mark IV DSLR Body' })
  camera.save

  camera = Product.new({ name: 'Nikon D850', price: 2997, image_url: 'https://www.adorama.com/images/XLarge/inkd850.jpg', description: 'Nikon D850 DSLR Camera Body' })
  camera.save


  Supplier.create({ name: 'Adorama', email: 'service@adorama.com', phone_number: '800-123-4567' })
  Supplier.create({ name: 'B&H Photo Video', email: 'service@bhphoto.com', phone_number: '800-321-7654' })
  Supplier.create({ name: 'Best Buy', email: 'service@bestbuy.com', phone_number: '800-234-5678' })
  