import 'package:flutter/material.dart';

import 'package:otagu_app/views/home_page.dart';
import 'package:otagu_app/views/login_screen.dart';
import 'package:otagu_app/widgets/details_body.dart';

final routes = {
  '/login': (BuildContext context) => new LoginScreen(),
  '/home': (BuildContext context) => new HomePage(),
  '/detail': (BuildContext context) => new DetailsBody(),
  '/': (BuildContext context) => new HomePage(),
};
