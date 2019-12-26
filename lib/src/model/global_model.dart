
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


class DateOptions {
    int id;
    String date = '';
    String month = '';
    String year = '';
    String day = '';
    DateTime val;

    DateOptions({
        this.id,
        this.date,
        this.month,
        this.year,
        this.day,
        this.val,
    });

    // Create a Note from JSON data
    factory DateOptions.fromJson(Map<String, dynamic> json) => new DateOptions(
        id: json["id"],
        val: json["val"],
        date: json["date"],
        month: json["month"],
        day: json["day"],
        year: json["year"],
    );

    // Convert our Note to JSON to make it easier when we store it in the database
    Map<String, dynamic> toJson() => {
        "id": id,
        "val":val,
    };
}