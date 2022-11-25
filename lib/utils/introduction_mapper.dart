import 'package:flutter/material.dart';
import 'package:on_boarding/data/model/introduction.dart';
import 'package:introduction_screen/introduction_screen.dart';

extension IntroductionMapper on Introduction {
  PageViewModel mapper() {
    return PageViewModel(
      title: title,
      body: description,
      image: Image.network(imagePath),
    );
  }
}