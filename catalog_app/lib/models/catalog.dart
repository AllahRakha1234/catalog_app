
class CatalogModel{

  // // SINGLETON CLASS (WHICH CREATES ONE OBJECT AND THAT IS USE ALWAYS)
  // static final catalogModel = CatalogModel._internal();
  // CatalogModel._internal();
  // factory CatalogModel () => catalogModel;

  static List<Item> items = [];

  // GET ELEMENT BY ID
  Item getById(int id) => items.firstWhere((element) => element.id == id);

  // GET ELEMENT BY POSITION
  Item getByPos(int pos) => items[pos];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;
  // Item({this.id, this.name, this.desc, this.price, this.color, this.image});
  Item({
    this.id = 0,
    this.name = '',
    this.desc = '',
    this.price = 0,
    this.color = '',
    this.image = '',
  });

  // NAMED CONSTRUCTOR (Item.---) AND FACTORY IS USED TO SELECT THE CONSTRUCTOR
  factory Item.fromMap(Map<String, dynamic>? map) {
    if (map == null) {
      return Item(); // Return a default instance if map is null
    }
    return Item(
      id: map["id"] ?? 0,
      name: map["name"] ?? '',
      desc: map["desc"] ?? '',
      price: map["price"] ?? 0,
      color: map["color"] ?? '',
      image: map["image"] ?? '',
    );
  }

  factory Item.toMap(Map<String, dynamic> map){
    return Item(  // MAKING CLASS FROM MAP
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      image: map["image"],
    );
  }
  // MAKING MAP FROM CLASS (OPPOSITE OF ABOVE) (FOR BACKEND SIDE MAPPING)
  toMap(){
    return {
      "id": id,
      "name": name,
      "desc": desc,
      "price": price,
      "color": color,
      "image": image,
    };
  }
}

