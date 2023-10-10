import 'dart:ui';
import 'package:equatable/equatable.dart';

import '../../data/model/home_screen_guideline_model.dart';

class HomeScreenData extends Equatable {
  int? id;
  String? categoryName;
  bool? showOnlySubCategory;
  String? sequenceNo;
  List<ItemsModel>? items;
  SubCategoryModel? subCategory;

  HomeScreenData(
      {this.id,
      this.categoryName,
      this.showOnlySubCategory,
      this.sequenceNo,
      this.items,
      this.subCategory});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, categoryName, showOnlySubCategory, sequenceNo, items, subCategory];
}

class Items {
  String? id;
  List<String>? tag;
  DefaultPropertiesModel? defaultProperties;

  Items({this.id, this.tag, this.defaultProperties});
}

class DefaultProperties {
  ColorModel? color;
  bool? enabled;
  OnClickModel? onClick;

  DefaultProperties({this.color, this.enabled, this.onClick});
}

class Color {
  String? backgroundColor;
  String? themeColor;
  String? textColor;

  Color({this.backgroundColor, this.themeColor, this.textColor});
}

class OnClick {
  String? target;
  String? parameter;

  OnClick({this.target, this.parameter});
}

class SubCategory {
  String? title;
  String? sequenceNo;
  bool? showSubCategoriesAsSeparateCarousel;
  List<Items1Model>? items;

  SubCategory(
      {this.title,
      this.sequenceNo,
      this.showSubCategoriesAsSeparateCarousel,
      this.items});
}

class Items1 {
  String? id;
  String? name;
  DefaultPropertiesModel? defaultProperties;

  Items1({this.id, this.name, this.defaultProperties});
}
