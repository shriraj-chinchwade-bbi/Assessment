import 'package:clean_json_to_ui/features/home_screen/data/model/home_screen_guideline_model.dart'
    as modal;
import 'package:clean_json_to_ui/features/home_screen/domain/entities/home_screen_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:clean_json_to_ui/features/home_screen/presentation/widgets/color_from_hex.dart';
import '../../../../core/util/utility.dart';

ListView DisplayGuideLines() {
  return ListView.builder(
      itemCount: listGuideLineModal.length,
      itemBuilder: (context, index) {
        modal.GuideLinesModal guideLineModal = listGuideLineModal[index];
        return Column(
          children: [
            SizedBox(
              height: 150,
              width: 400,
              child: Column(
                children: [
                  Text(
                    guideLineModal.categoryName!,
                  ),
                  SizedBox(
                    width: 1000,
                    height: 100,
                    child: ListView.builder(
                        itemCount: guideLineModal.items!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          modal.ItemsModel itemModal =
                              guideLineModal.items![index];
                          return Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(
                              children: [
                                Container(
                                  color: colorFromHex(itemModal
                                      .defaultProperties!.color!.themeColor!),
                                  width: 10,
                                  height: 100,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 4,
                                      color: Colors
                                          .black, //                   <--- border width here
                                    ),
                                    color: colorFromHex(itemModal
                                        .defaultProperties!
                                        .color!
                                        .backgroundColor!),
                                  ),
                                  height: 100,
                                  width: 100,
                                  child: Text(
                                    '${itemModal.id!}\n${itemModal.tag!}',
                                    style: TextStyle(
                                      color: colorFromHex(itemModal
                                          .defaultProperties!
                                          .color!
                                          .textColor!),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: guideLineModal.showOnlySubCategory!,
              child: SizedBox(
                height: 150,
                width: 400,
                child: Column(
                  children: [
                    Text(
                      guideLineModal.subCategory!.title!,
                    ),
                    SizedBox(
                      width: 1000,
                      height: 100,
                      child: ListView.builder(
                          itemCount: guideLineModal.subCategory!.items!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            modal.Items1Model itemModal =
                                guideLineModal.subCategory!.items![index];
                            return Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text(
                                              "target: ${itemModal.defaultProperties!.onClick!.target!}\n${itemModal.defaultProperties!.onClick!.parameter!}"),
                                        );
                                      });
                                },
                                child: Row(
                                  children: [
                                    Container(
// decoration: BoxDecoration(border: Border.all(color: Colors.black),borderRadius: ),
                                      color: colorFromHex(itemModal
                                          .defaultProperties!
                                          .color!
                                          .themeColor!),
                                      width: 10,
                                      height: 100,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 3,
                                          color: Colors
                                              .black, //                   <--- border width here
                                        ),
                                        color: colorFromHex(itemModal
                                            .defaultProperties!
                                            .color!
                                            .backgroundColor!),
                                      ),
                                      height: 100,
                                      width: 100,
                                      child: Text(
                                        '${itemModal.id!}\n${itemModal.name!}',
                                        style: TextStyle(
                                          color: colorFromHex(itemModal
                                              .defaultProperties!
                                              .color!
                                              .textColor!),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      });
}
