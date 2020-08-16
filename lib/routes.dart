import 'package:flutter/material.dart';

import 'package:otagu_app/views/home_page.dart';
import 'package:otagu_app/views/login_screen.dart';

final routes = {
  '/login':         (BuildContext context) => new LoginScreen(),
  '/home':         (BuildContext context) => new HomePage(),
  '/' :          (BuildContext context) => new HomePage(),
};