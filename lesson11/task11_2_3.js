use shop
db.createCollection("products")
db.createCollection("catalogs")

db.catalogs.insert({name: "Процессоры"})
db.catalogs.insert({name: "Материнские платы"})
db.catalogs.insert({name: "Видеокарты"})
db.catalogs.insert({name: "Жесткие диски"})
db.catalogs.insert({name: "Оперативная память"})

db.catalogs.find()
/*{ "_id" : ObjectId("5de0269ddf676c2ea1b7e490"), "name" : "Процессоры" }
{ "_id" : ObjectId("5de0269ddf676c2ea1b7e491"), "name" : "Материнские платы" }
{ "_id" : ObjectId("5de0269ddf676c2ea1b7e492"), "name" : "Видеокарты" }
{ "_id" : ObjectId("5de0269ddf676c2ea1b7e493"), "name" : "Жесткие диски" }
{ "_id" : ObjectId("5de026a0df676c2ea1b7e494"), "name" : "Оперативная память" }*/


db.products.insert(
  { name: "Intel Core i3-8100",
    description: "Процессор для настольных персональных компьютеров, основанных на платформе Intel.",
    price: 7890.00,
    catalog_id: new ObjectId("")
  }
)
