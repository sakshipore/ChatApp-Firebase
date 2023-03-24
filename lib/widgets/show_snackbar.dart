import 'package:flutter/material.dart';
import 'package:get/get.dart';

showSnackBar(Color color, String message, String title) {
  Get.snackbar(
    title,
    message,
    backgroundColor: color,
    colorText: Colors.white,
    duration: Duration(seconds: 2),
    
  );
}
