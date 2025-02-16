import 'package:flutter/material.dart';
import 'package:splash_app/core/functions/navigation.dart';
import 'package:splash_app/core/utils/app_size.dart';
import 'package:splash_app/core/utils/assets_manager.dart';
import 'package:splash_app/core/utils/color_manager.dart';
import 'package:splash_app/core/utils/font_manager.dart';
import 'package:splash_app/core/utils/styles_manager.dart';

class RatingView extends StatefulWidget {
  const RatingView({super.key});

  @override
  State<RatingView> createState() => _RatingViewState();
}

class _RatingViewState extends State<RatingView> {
  int _rating = 0;

  void _setRating(int rating) {
    setState(() {
      _rating = rating;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  AssetsManager.rating,
                  fit: BoxFit.fill,
                  width: double.infinity,
                ),
                IconButton(
                    onPressed: () {
                      NavigatorManager.pop(context: context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: ColorsManager.black,
                      size: AppSize.s30,
                    )),
              ],
            ),
            Container(
              padding: EdgeInsets.only(
                  left: Appwidth.w16, top: AppHeight.h8, bottom: AppHeight.h8),
              height: AppHeight.h74,
              width: Appwidth.w230,
              decoration: BoxDecoration(
                  color: ColorsManager.black,
                  borderRadius: BorderRadius.circular(AppHeight.h16)),
              child: Row(
                children: [
                  Image.asset(AssetsManager.googlePlay),
                  SizedBox(
                    width: Appwidth.w6,
                  ),
                  Column(
                    children: [
                      Text(
                        'REVIEW US ON',
                        style: StylesManager.textStyleBold16,
                      ),
                      Text(
                        'Google play',
                        style: StylesManager.textStyleBold24,
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: AppHeight.h10,
            ),
            Text(
              'Your opinion matters to us!',
              style: StylesManager.textStyleBold24
                  .copyWith(color: ColorsManager.mainColor),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppHeight.h20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Appwidth.w4),
              child: Text(
                'We work super hard to serve you better '
                'and\nwould love to know how you would\n rate our app?',
                style: TextStyle(fontSize: FontSize.s16),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: AppHeight.h40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return GestureDetector(
                  onTap: () => _setRating(index + 1),
                  child: Icon(
                    index < _rating ? Icons.star : Icons.star_border,
                    size: 40,
                    color:
                        index < _rating ? ColorsManager.mainColor : Colors.grey,
                  ),
                );
              }),
            ),
            SizedBox(height: AppHeight.h40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Background color
                foregroundColor: Colors.white, // Text color
                minimumSize: const Size(300, 60), // Width and height
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(AppSize.s12), // Border radius
                ),
              ),
              onPressed: () {
                // Handle the submit action
                print('Rating: $_rating');
              },
              child: Text(
                'Submit',
                style: StylesManager.textStyleBold24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
