import 'package:flutter/material.dart';

class ProductsModel{
  ProductsModel({
    required this.productId,
    required this.productName,
    required this.productImage,
    required this.productDescription,
    required this.productDate,
    required this.productPrice,
    required this.quantity,
    required this.productTime,
    required this.productAddress,
  });
  final String productId;
  final String productName;
  final String productImage;
  final String productDescription;
  final DatePickerDialog productDate;
  final String productTime;
  final String productAddress;
  final int productPrice;
  final int quantity;

  ProductsModel.fromProductsJson(Map<String,dynamic> json):
        productId=json['productId']??"",
        productName=json['productName']??"",
        productPrice=json['productPrice']??0,
        productImage=json['productImage']??"",
        quantity=json['quantity']??"",
        productDescription=json['productDescription']??"",
        productDate=json['productDate']??"",
        productTime=json['productTime']??"",
        productAddress=json['productAddress']??"";

  Map<String, dynamic> toProductsJson()=>{
    'productId':productId,
    'productName':productName,
    'productPrice':productPrice,
    'productImage':productImage,
    'quantity':quantity,
    'productDescription':productDescription,
    'productDate':productDate,
    'productTime':productTime,
    'productAddress':productAddress,
  };

}