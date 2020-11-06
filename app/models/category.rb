class Category < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '5000円までの商品' },
    { id: 2, name: '10000円までの商品' },
    { id: 3, name: '20000円までの商品' },
    { id: 4, name: '30000円までの商品' },
  ]
end
