# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create(id: 1 ,name: 'レディース', parrent_id: 0)
Category.create(id: 2 ,name: 'メンズ', parrent_id: 0)
Category.create(id: 3 ,name: 'ベビー・キッズ', parrent_id: 0)
Category.create(id: 4 ,name: 'トップス', parrent_id: 1)
Category.create(id: 5 ,name: 'スカート', parrent_id: 1)
Category.create(id: 6 ,name: 'ワンピース', parrent_id: 1)
Category.create(id: 7 ,name: 'トップス', parrent_id: 2)
Category.create(id: 8 ,name: 'パンツ', parrent_id: 2)
Category.create(id: 9 ,name: '靴', parrent_id: 2)
Category.create(id: 10 ,name: 'ベビー服', parrent_id: 3)
Category.create(id: 11 ,name: 'キッズ服', parrent_id: 3)
Category.create(id: 12 ,name: 'キッズ靴', parrent_id: 3)
Category.create(id: 13 ,name: 'Tシャツ', parrent_id: 4)
Category.create(id: 14 ,name: 'ポロシャツ', parrent_id: 4)
Category.create(id: 15 ,name: 'キャミソール', parrent_id: 4)
Category.create(id: 16 ,name: 'ミニスカート', parrent_id: 5)
Category.create(id: 17 ,name: 'ひざ丈スカート', parrent_id: 5)
Category.create(id: 18 ,name: 'ロングスカート', parrent_id: 5)
Category.create(id: 19 ,name: 'ミニワンピース', parrent_id: 6)
Category.create(id: 20 ,name: 'ひざ丈ワンピース', parrent_id: 6)
Category.create(id: 21 ,name: 'ロングワンピース', parrent_id: 6)
Category.create(id: 22 ,name: 'Tシャツ', parrent_id: 7)
Category.create(id: 23 ,name: 'シャツ', parrent_id: 7)
Category.create(id: 24 ,name: 'ポロシャツ', parrent_id: 7)
Category.create(id: 25 ,name: 'デニム/ジーンズ', parrent_id: 8)
Category.create(id: 26 ,name: 'ワークパンツ/カーゴパンツ', parrent_id: 8)
Category.create(id: 27 ,name: 'スラックス', parrent_id: 8)
Category.create(id: 28 ,name: 'スニーカー', parrent_id: 9)
Category.create(id: 29 ,name: 'サンダル', parrent_id: 9)
Category.create(id: 30 ,name: 'ブーツ', parrent_id: 9)
Category.create(id: 31 ,name: 'トップス', parrent_id: 10)
Category.create(id: 32 ,name: 'アウター', parrent_id: 10)
Category.create(id: 33 ,name: 'パンツ', parrent_id: 10)
Category.create(id: 34 ,name: 'コート', parrent_id: 11)
Category.create(id: 35 ,name: 'トップス', parrent_id: 11)
Category.create(id: 36 ,name: 'パンツ', parrent_id: 11)
Category.create(id: 37 ,name: 'スニーカー', parrent_id: 12)
Category.create(id: 38 ,name: 'サンダル', parrent_id: 12)
Category.create(id: 39 ,name: 'ブーツ', parrent_id: 12)