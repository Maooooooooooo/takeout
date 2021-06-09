class OrderTime < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },{ id: 2, name: '10~20分' },{ id: 3, name: '20~30分' },{ id: 4, name: '30~40分' },{ id: 5, name: '40~50分' },
    { id: 6, name: '50~60分' },{ id: 7, name: '60~70分' },{ id: 8, name: '70~80分' },{ id: 9, name: '80~90分' },{ id: 10, name: '90~100分' },
  ]

  include ActiveHash::Associations
  has_many :restaurants
end