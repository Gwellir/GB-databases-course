// Задание 11_2.3
/* Организуйте хранение категорий и товарных позиций учебной базы данных shop в СУБД MongoDB.
*/

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
    catalog_id: new ObjectId("5de0269ddf676c2ea1b7e490")
  }
);
db.products.insert(
  { name: "AMD FX-8320E",
    description: "Процессор для настольных персональных компьютеров, основанных на платформе AMD.",
    price: 4780.00,
    catalog_id: new ObjectId("5de0269ddf676c2ea1b7e490")
  }
);
db.products.insert(
  { name: "MSI B250M GAMING PRO",
    description: "Материнская плата MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX.",
    price: 5060.00,
    catalog_id: new ObjectId("5de0269ddf676c2ea1b7e491")
  }
);

db.products.find()
/*{ "_id" : ObjectId("5de02739df676c2ea1b7e495"), "name" : "Intel Core i3-8100", "description" : "Процессор для настольных персональных компьютеров, основанных на платформе Intel.", "price" : 7890, "catalog_id" : ObjectId("5de0269ddf676c2ea1b7e490") }
{ "_id" : ObjectId("5de02a3cdf676c2ea1b7e496"), "name" : "AMD FX-8320E", "description" : "Процессор для настольных персональных компьютеров, основанных на платформе AMD.", "price" : 4780, "catalog_id" : ObjectId("5de0269ddf676c2ea1b7e490") }
{ "_id" : ObjectId("5de02a3ddf676c2ea1b7e497"), "name" : "MSI B250M GAMING PRO", "description" : "Материнская плата MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX.", "price" : 5060, "catalog_id" : ObjectId("5de0269ddf676c2ea1b7e491") }
*/
