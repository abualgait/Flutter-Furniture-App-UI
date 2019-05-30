import 'package:flutter/material.dart';

var images = [
  "assets/image_01.png",
  "assets/image_02.png",
  "assets/image_03.png",
  "assets/image_01.png",
  "assets/image_02.png",
  "assets/image_03.png",
];

var title = ["Hemes ArmChair", "Sofar ArmChari", "Wooden ArmChair","Hemes ArmChair", "Sofar ArmChari", "Wooden ArmChair"];
var body = ["New Sale", "Sale", "New Collection","Awesome", "Fantastic", "Wooden ArmChair"];
var price = ["126", "148", "179","126", "148", "179"];

var pageList = [
  PageModel(
      imageUrl: "assets/illustration.png",
      title: title[0],
      body: body[0],
      price: price[0]),
  PageModel(
      imageUrl: "assets/illustration2.png",
      title: title[1],
      body: body[1],
      price: price[1]),
  PageModel(
      imageUrl: "assets/illustration3.png",
      title: title[2],
      body: body[2],
      price: price[2]),
  PageModel(
      imageUrl: "assets/illustration.png",
      title: title[3],
      body: body[3],
      price: price[3]),
  PageModel(
      imageUrl: "assets/illustration2.png",
      title: title[4],
      body: body[4],
      price: price[4]),
  PageModel(
      imageUrl: "assets/illustration3.png",
      title: title[5],
      body: body[5],
      price: price[5]),
];



class PageModel {
  var imageUrl;
  var title;
  var body;
  var price;

  PageModel({this.imageUrl, this.title, this.body, this.price});
}
