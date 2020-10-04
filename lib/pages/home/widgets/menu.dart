import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).primaryColor;
    return SizedBox(
      width: 150,
      child: Drawer(
        child: Column(
          children: [
            Container(
              height: 100,
              alignment: Alignment.bottomCenter,
              child: Text(
                'MENU',
                style: TextStyle(
                  fontSize: 20,
                  color: color,
                ),
              ),
            ),
            Divider(
              height: 20,
              color: Colors.black,
            ),
            _MenuItem(
              title: 'Accounts',
              color: color,
              icon: Icons.account_balance,
              onTap: () => onNavigate(context, '/accounts'),
            ),
            Divider(
              height: 20,
              color: Colors.black,
            ),
            _MenuItem(
              title: 'Budget Items',
              color: color,
              icon: Icons.attach_money,
              onTap: () => onNavigate(context, '/items'),
            ),
            Divider(
              height: 20,
              color: Colors.black,
            ),
            _MenuItem(
              title: 'Types',
              color: color,
              icon: Icons.widgets,
              onTap: () => onNavigate(context, '/types'),
            ),
            Divider(
              height: 20,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }

  void onNavigate(BuildContext context, String uri) {
    Navigator.of(context).pop();
    Navigator.of(context).pushNamed(uri);
  }
}

class _MenuItem extends StatelessWidget {
  const _MenuItem({
    Key key,
    @required this.color,
    @required this.title,
    @required this.icon,
    @required this.onTap,
  }) : super(key: key);

  final Color color;
  final String title;
  final IconData icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Opacity(
        opacity: 0.6,
        child: Container(
          child: Column(
            children: [
              Icon(
                icon,
                color: color,
                size: 50.0,
              ),
              Text(
                title,
                style: TextStyle(
                    color: color, fontSize: 14, fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ),
    );
  }
}
