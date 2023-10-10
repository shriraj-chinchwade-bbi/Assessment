import 'package:clean_json_to_ui/features/home_screen/domain/entities/home_screen_data.dart';
import 'package:flutter/foundation.dart';

class GuideLinesModal extends HomeScreenData {
  GuideLinesModal(
      {int? id,
      String? categoryName,
      bool? showOnlySubCategory,
      String? sequenceNo,
      List<ItemsModel>? items,
      SubCategoryModel? subCategory})
      : super(
            id: id,
            categoryName: categoryName,
            showOnlySubCategory: showOnlySubCategory,
            sequenceNo: sequenceNo,
            items: items,
            subCategory: subCategory);

  factory GuideLinesModal.fromJson(Map<String, dynamic> json) {
    var items;
    if (json['items'] != null) {
      items = <ItemsModel>[];
      json['items'].forEach((v) {
        items!.add(ItemsModel.fromJson(v));
      });
    }
    var subCategory = json['subCategory'] != null
        ? new SubCategoryModel.fromJson(json['subCategory'])
        : null;
    return GuideLinesModal(
      id: json['id'],
      items: items,
      categoryName: json['categoryName'],
      showOnlySubCategory: json['showOnlySubCategory'],
      sequenceNo: json['sequenceNo'],
      subCategory: subCategory,
    );
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

class ItemsModel extends Items {
  ItemsModel({
    String? id,
    List<String>? tag,
    DefaultPropertiesModel? defaultProperties,
  }) : super(id: id, tag: tag, defaultProperties: defaultProperties);

  factory ItemsModel.fromJson(Map<String, dynamic> json) {
    return ItemsModel(
      id: json['id'],
      tag: json['tag'] == null
          ? []
          : List<String>.from(json["tag"].map((x) => x)),
      defaultProperties: json['defaultProperties'] != null
          ? DefaultPropertiesModel.fromJson(json['defaultProperties'])
          : null,
    );
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

class DefaultPropertiesModel extends DefaultProperties {
  DefaultPropertiesModel({
    ColorModel? color,
    bool? enabled,
    OnClickModel? onClick,
  }) : super(color: color, enabled: enabled, onClick: onClick);

  factory DefaultPropertiesModel.fromJson(Map<String, dynamic> json) {
    // color = json['color'] != null ? new ColorModel().fromJson(json['color']) : null;
    // enabled = json['enabled'];
    // onClick =
    //     json['onClick'] != null ? new OnClickModel().fromJson(json['onClick']) : null,
    return DefaultPropertiesModel(
      color: json['color'] != null ? ColorModel.fromJson(json['color']) : null,
      enabled: json['enabled'],
      onClick: json['onClick'] != null
          ? OnClickModel.fromJson(json['onClick'])
          : null,
    );
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

class ColorModel extends Color {
  ColorModel({
    String? backgroundColor,
    String? themeColor,
    String? textColor,
  }) : super(
            backgroundColor: backgroundColor,
            themeColor: themeColor,
            textColor: textColor);

  factory ColorModel.fromJson(Map<String, dynamic> json) {
    return ColorModel(
      backgroundColor: json['backgroundColor'],
      themeColor: json['themeColor'],
      textColor: json['textColor'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['backgroundColor'] = this.backgroundColor;
    data['themeColor'] = this.themeColor;
    data['textColor'] = this.textColor;
    return data;
  }
}

class OnClickModel extends OnClick {
  OnClickModel({
    String? target,
    String? parameter,
  }) : super(target: target, parameter: parameter);

  factory OnClickModel.fromJson(Map<String, dynamic> json) {
    return OnClickModel(
      target: json['target'],
      parameter: json['parameter'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['target'] = this.target;
    data['parameter'] = this.parameter;
    return data;
  }
}

class SubCategoryModel extends SubCategory {
  SubCategoryModel({
    String? title,
    String? sequenceNo,
    bool? showSubCategoriesAsSeparateCarousel,
    List<Items1Model>? items,
  }) : super(
            title: title,
            sequenceNo: sequenceNo,
            showSubCategoriesAsSeparateCarousel:
                showSubCategoriesAsSeparateCarousel,
            items: items);

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
    var items;
    if (json['items'] != null) {
      items = <Items1Model>[];
      json['items'].forEach((v) {
        items!.add(Items1Model.fromJson(v));
      });
    }
    return SubCategoryModel(
      title: json['title'],
      sequenceNo: json['sequenceNo'],
      showSubCategoriesAsSeparateCarousel:
          json['showSubCategoriesAsSeparateCarousel'],
      items: items,
    );
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

class Items1Model extends Items1 {
  Items1Model({
    String? id,
    String? name,
    DefaultPropertiesModel? defaultProperties,
  }) : super(id: id, name: name, defaultProperties: defaultProperties);

  factory Items1Model.fromJson(Map<String, dynamic> json) {
    return Items1Model(
      id: json['id'],
      name: json['name'],
      defaultProperties: json['defaultProperties'] != null
          ? new DefaultPropertiesModel.fromJson(json['defaultProperties'])
          : null,
    );
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
