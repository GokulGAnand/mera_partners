import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sample2_clone/ui/users/views/profilescreen.dart';

class bottomscreen extends StatelessWidget {
  const bottomscreen({super.key});

  @override
  Widget build(BuildContext context) {
    int index = 3; // Set your desired index

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        height: 72,
        elevation: 0,
        selectedIndex: index,
        destinations: [
          NavigationDestination(
            icon: SvgPicture.asset('lib/Assets/explore.svg'),
            label: 'Explore',
          ),
          NavigationDestination(
            icon: SvgPicture.asset('lib/Assets/label.svg'),
            label: 'My Auctions',
          ),
          NavigationDestination(
            icon: SvgPicture.asset('lib/Assets/shopping_bag.svg'),
            label: 'Orders',
          ),
          NavigationDestination(
            icon: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  const profscreen ()));
              },
              child: SvgPicture.asset('lib/Assets/person.svg'),
            ),
            // icon: SvgPicture.asset('lib/Assets/person.svg'),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}


