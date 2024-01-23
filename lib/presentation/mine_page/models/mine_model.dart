import '../../../core/app_export.dart';
import 'thirtytwo_item_model.dart';
import 'twenty_item_model.dart';

class MineModel {
  List<ThirtytwoItemModel> thirtytwoItemList = [
    ThirtytwoItemModel(frame: ImageConstant.imgFrame2261)
  ];

  List<TwentyItemModel> twentyItemList = [
    TwentyItemModel(
        vector: ImageConstant.imgVector,
        appleStore: "Apple Store",
        june: "21 June, 2022",
        price: "-220.00"),
    TwentyItemModel(
        vector: ImageConstant.imgThumbsUp,
        appleStore: "Netflix",
        june: "20 June, 2022",
        price: "-170.00"),
    TwentyItemModel(
        vector: ImageConstant.imgIcon50x50,
        appleStore: "Spotify",
        june: "20 June, 2022",
        price: "-54.00"),
    TwentyItemModel(
        vector: ImageConstant.imgVectorPink400,
        appleStore: "Dribbble",
        june: "18 June, 2022",
        price: "-107.00")
  ];
}
