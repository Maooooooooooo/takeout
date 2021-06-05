class OrderTime < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },{ id: 2, name: '11:30' },{ id: 3, name: '12:00' },{ id: 4, name: '12:15' },{ id: 5, name: '12:30' },
    { id: 6, name: '12:45' },{ id: 7, name: '13:00' },{ id: 8, name: '13:15' },{ id: 9, name: '13:30' },{ id: 10, name: '13:45' },
    { id: 11, name: '14:00' },{ id: 12, name: '14:15' },{ id: 13, name: '14:30' },{ id: 14, name: '14:45' },{ id: 15, name: '15:00' },
    { id: 16, name: '15:30' },{ id: 17, name: '15:45' },{ id: 18, name: '16:00' },{ id: 19, name: '16:15' },{ id: 20, name: '16:30' },
    { id: 21, name: '16:45' },{ id: 22, name: '17:00' },{ id: 23, name: '17:15' },{ id: 24, name: '17:30' },{ id: 25, name: '17:45' },
    { id: 26, name: '18:00' },{ id: 27, name: '18:15' },{ id: 28, name: '18:30' },{ id: 29, name: '18:45' },{ id: 30, name: '19:00' },
    { id: 31, name: '19:15' },{ id: 32, name: '19:30' },{ id: 33, name: '19:45' },{ id: 34, name: '20:00' },{ id: 35, name: '20:15' },
    { id: 36, name: '20:30' },{ id: 37, name: '20:45' },{ id: 38, name: '21:00' },{ id: 39, name: '21:15' },{ id: 40, name: '21:30' },
    { id: 41, name: '21:45' },{ id: 42, name: '22:00' }
  ]

  include ActiveHash::Associations
  has_many :pays
end