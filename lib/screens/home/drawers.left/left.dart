import 'package:flutter/material.dart';

class LeftDrawer extends StatefulWidget {
  const LeftDrawer({super.key});

  @override
  State<LeftDrawer> createState() => _LeftDrawerState();
}

class _LeftDrawerState extends State<LeftDrawer> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        DrawerHeader(
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 132, 120, 79)),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 70,
                    width: 70,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Hi, Bình',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Text(
                        'Your balance: \$99999',
                        style: TextStyle(color: Colors.amber[50], fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        side: const BorderSide(width: 1, color: Colors.grey),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        side: const BorderSide(width: 1, color: Colors.grey),
                      ),
                      child: const Text(
                        'Register',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        _buildDrawerItem(Icons.attach_money, 'Price board', 0),
        _buildDrawerItem(Icons.start, 'Watch list', 1),
        _buildDrawerItem(Icons.business, 'Top stocks', 2),
        _buildDrawerItem(Icons.notifications, 'Notifications', 3),
        _buildDrawerItem(Icons.bar_chart, 'Equities Trading', 4),
        const SizedBox(height: 10),
        const Divider(height: 1, color: Colors.grey),
        _buildDrawerItem(Icons.timeline, 'Derivatives Trading', 5),
        _buildDrawerItem(Icons.shopping_cart, 'Right Trading', 6),
        _buildDrawerItem(Icons.person_outline, 'S-Product', 7),
        const SizedBox(height: 10),
        const Divider(height: 1, color: Colors.grey),
        _buildDrawerItem(Icons.account_balance_wallet, 'S-Cash Transaction', 8),
        _buildDrawerItem(Icons.account_balance, 'Assets Management', 9),
        _buildDrawerItem(Icons.add_box, 'Abc-Plus', 10),
        _buildDrawerItem(Icons.person_outline, 'S-Product', 11),
        const SizedBox(height: 10),
        const Divider(height: 1, color: Colors.grey),
        _buildDrawerItem(Icons.settings, 'Setting', 12),
      ],
    ));
  }

  Widget _buildDrawerItem(IconData icon, String title, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        color: index == _selectedIndex ? Colors.green[100] : null,
        child: ListTile(
          leading: Icon(icon),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
