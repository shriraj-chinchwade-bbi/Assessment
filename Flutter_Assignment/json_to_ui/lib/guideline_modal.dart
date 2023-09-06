class GuideLinesModal {
  int? id;
  String? categoryName;
  bool? showOnlySubCategory;
  String? sequenceNo;
  List<Items>? items;
  SubCategory? subCategory;

  GuideLinesModal(
      {this.id,
      this.categoryName,
      this.showOnlySubCategory,
      this.sequenceNo,
      this.items,
      this.subCategory});

  GuideLinesModal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['categoryName'];
    showOnlySubCategory = json['showOnlySubCategory'];
    sequenceNo = json['sequenceNo'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    subCategory = json['subCategory'] != null
        ? new SubCategory.fromJson(json['subCategory'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['categoryName'] = this.categoryName;
    data['showOnlySubCategory'] = this.showOnlySubCategory;
    data['sequenceNo'] = this.sequenceNo;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    if (this.subCategory != null) {
      data['subCategory'] = this.subCategory!.toJson();
    }
    return data;
  }
}

class Items {
  String? id;
  List<String>? tag;
  DefaultProperties? defaultProperties;

  Items({this.id, this.tag, this.defaultProperties});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tag =
        json['tag'] == null ? [] : List<String>.from(json["tag"].map((x) => x));
    defaultProperties = json['defaultProperties'] != null
        ? new DefaultProperties.fromJson(json['defaultProperties'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tag'] = this.tag;
    if (this.defaultProperties != null) {
      data['defaultProperties'] = this.defaultProperties!.toJson();
    }
    return data;
  }
}

class DefaultProperties {
  Color? color;
  bool? enabled;
  OnClick? onClick;

  DefaultProperties({this.color, this.enabled, this.onClick});

  DefaultProperties.fromJson(Map<String, dynamic> json) {
    color = json['color'] != null ? new Color.fromJson(json['color']) : null;
    enabled = json['enabled'];
    onClick =
        json['onClick'] != null ? new OnClick.fromJson(json['onClick']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.color != null) {
      data['color'] = this.color!.toJson();
    }
    data['enabled'] = this.enabled;
    if (this.onClick != null) {
      data['onClick'] = this.onClick!.toJson();
    }
    return data;
  }
}

class Color {
  String? backgroundColor;
  String? themeColor;
  String? textColor;

  Color({this.backgroundColor, this.themeColor, this.textColor});

  Color.fromJson(Map<String, dynamic> json) {
    backgroundColor = json['backgroundColor'];
    themeColor = json['themeColor'];
    textColor = json['textColor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['backgroundColor'] = this.backgroundColor;
    data['themeColor'] = this.themeColor;
    data['textColor'] = this.textColor;
    return data;
  }
}

class OnClick {
  String? target;
  String? parameter;

  OnClick({this.target, this.parameter});

  OnClick.fromJson(Map<String, dynamic> json) {
    target = json['target'];
    parameter = json['parameter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['target'] = this.target;
    data['parameter'] = this.parameter;
    return data;
  }
}

class SubCategory {
  String? title;
  String? sequenceNo;
  bool? showSubCategoriesAsSeparateCarousel;
  List<Items>? items;

  SubCategory(
      {this.title,
      this.sequenceNo,
      this.showSubCategoriesAsSeparateCarousel,
      this.items});

  SubCategory.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    sequenceNo = json['sequenceNo'];
    showSubCategoriesAsSeparateCarousel =
        json['showSubCategoriesAsSeparateCarousel'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['sequenceNo'] = this.sequenceNo;
    data['showSubCategoriesAsSeparateCarousel'] =
        this.showSubCategoriesAsSeparateCarousel;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items1 {
  String? id;
  String? name;
  DefaultProperties? defaultProperties;

  Items1({this.id, this.name, this.defaultProperties});

  Items1.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    defaultProperties = json['defaultProperties'] != null
        ? new DefaultProperties.fromJson(json['defaultProperties'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.defaultProperties != null) {
      data['defaultProperties'] = this.defaultProperties!.toJson();
    }
    return data;
  }
}
