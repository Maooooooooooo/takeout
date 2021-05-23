class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },{ id: 2, name: '和食・日本料理' },{ id: 3, name: 'ラーメン・麺類' },{ id: 4, name: 'アジア・エスニック' },
    { id: 5, name: '中華' },{ id: 6, name: 'イタリアン' },{ id: 7, name: 'フレンチ' },{ id: 8, name: 'ファミレス・ファストフード' },
    { id: 9, name: '焼肉・ステーキ' },{ id: 10, name: '居酒屋・バー' },{ id: 11, name: 'カフェ・スイーツ' }
  ]

  include ActiveHash::Associations
  has_many :restaurants
end