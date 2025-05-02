import 'package:grabber_app/models/categorymodel.dart';
import 'package:grabber_app/models/fruitmodel.dart';
import 'package:grabber_app/resources/app_assets.dart';

class DataApp {
  static List<String> sliders = [
    AppAssets.slider1,
    AppAssets.slider2,
    AppAssets.slider3
  ];
  static List<FruitModel> fruits = [
    FruitModel(
        fruitImage: "assets/images/Banana.png",
        fruitName: "Banana",
        fruitRating: "4.8",
        numOfPeopleRating: "287",
        price: "3.99"),
    FruitModel(
        fruitImage: "assets/images/pepper.png",
        fruitName: "Pepper",
        fruitRating: "4.8",
        numOfPeopleRating: "287",
        price: "2.99"),
    FruitModel(
        fruitImage: "assets/images/orange.png",
        fruitName: "Orange",
        fruitRating: "4.8",
        numOfPeopleRating: "287",
        price: "3.99"),
  ];
  static List<CategoryModel> categories = [
    CategoryModel(
        categoryImage: AppAssets.fruitsCategory, categoryTitle: "Fruits"),
    CategoryModel(
        categoryImage: AppAssets.milkEggsCategory, categoryTitle: "Milk&Eggs"),
    CategoryModel(
        categoryImage: AppAssets.beveragesCategory, categoryTitle: "Beverages"),
    CategoryModel(
        categoryImage: AppAssets.laundryCategory, categoryTitle: "Laundry"),
    CategoryModel(
        categoryImage: AppAssets.vegetablesCategory,
        categoryTitle: "Vegetables")
  ];
}
