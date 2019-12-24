
class Cabang {
    int id;
    String name = '';

    Cabang({
        this.id,
        this.name,
    });

    // Create a Note from JSON data
    factory Cabang.fromJson(Map<String, dynamic> json) => new Cabang(
        id: json["id"],
        name: json["name"],
    );

    // Convert our Note to JSON to make it easier when we store it in the database
    Map<String, dynamic> toJson() => {
        "id": id,
        "name":name,
    };
}

class Category {
    int id;
    String name = '';
    String image = '';

    Category({
        this.id,
        this.name,
        this.image
    });

    // Create a Note from JSON data
    factory Category.fromJson(Map<String, dynamic> json) => new Category(
        id: json["id"],
        name: json["name"],
        image: json["image"],
    );

    // Convert our Note to JSON to make it easier when we store it in the database
    Map<String, dynamic> toJson() => {
        "id": id,
        "name":name,
        "image":image,
    };
}
class SliderM {
    int id;
    String name = '';
    String image = '';

    SliderM({
        this.id,
        this.name,
        this.image
    });

    // Create a Note from JSON data
    factory SliderM.fromJson(Map<String, dynamic> json) => new SliderM(
        id: json["id"],
        name: json["name"],
        image: json["image"],
    );

    // Convert our Note to JSON to make it easier when we store it in the database
    Map<String, dynamic> toJson() => {
        "id": id,
        "name":name,
        "image":image,
    };
}