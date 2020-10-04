import 'package:flutter/material.dart';

import 'pages/index.dart';

final routes = {
  '/': (BuildContext context) => HomePage(),
  '/accounts': (BuildContext context) => AccountPage(),
  '/items': (BuildContext context) => ItemsPage(),
  '/types': (BuildContext context) => TypesPage(),
};
