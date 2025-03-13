import 'package:flutter/material.dart';
import 'package:splash_app/core/utils/styles_manager.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/feature/home_view/presentation/views/widgets/darwer_chane_item.dart';

class HomeEndDrawer extends StatelessWidget {
  const HomeEndDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              "Mohamed Salem",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: StylesManager.textStyle16,
            ),
            accountEmail: Text(
              "ms3195@fayoum.edu.eg",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: StylesManager.textStyle16,
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset('assets/images/user1.png'),
            ),
            decoration: const BoxDecoration(
              color: ColorsManager.mainColor,
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.person,
              color: ColorsManager.mainColor,
            ),
            title: Text(
              'Name',
              style: StylesManager.textStyleSemiBold18.copyWith(color: ColorsManager.balck),
            ),
            subtitle: const Text('mohamed salem abdel majid ' , 
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            ),
            trailing: GestureDetector(
              onTap: () {
                _showChangePasswordDialog(
                    context, 'Name', TextInputType.text);
              },
              child: const Icon(
                Icons.edit,
              
              ),
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.phone , 
             color: ColorsManager.mainColor,
            ),
            title:  Text('Phone', 
              style: StylesManager.textStyleSemiBold18.copyWith(color: ColorsManager.balck),
            ),
            subtitle: const Text('01027816397'),
            trailing: GestureDetector(
              onTap: () {
                _showChangePasswordDialog(
                    context, 'Phone', TextInputType.number);
              },
              child: const Icon(Icons.edit),
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.email , 
             color: ColorsManager.mainColor,
            ),
            title:  Text('Email' , 
              style: StylesManager.textStyleSemiBold18.copyWith(color: ColorsManager.balck),
            ),
            subtitle: const Text('ms3195@fayoum.edu.eg' , 
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            ),
            trailing: GestureDetector(
              onTap: () {
                _showChangePasswordDialog(
                    context, 'Email', TextInputType.number);
              },
              child: const Icon(Icons.edit),
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }

  void _showChangePasswordDialog(
      BuildContext context, String title, TextInputType keyboardType) {
    showDialog(
      context: context,
      builder: (context) {
        return DrawerChangeItem(
          title: title,
          keyboardType: keyboardType,
        );
      },
    );
  }
}
