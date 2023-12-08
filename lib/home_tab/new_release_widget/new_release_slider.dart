
import 'package:flutter/material.dart';
import '../../model/NewReleaseResponse.dart';
import '../../my_theme.dart';
import 'new_release_item.dart';

class NewReleaseSlider extends StatelessWidget {
  List<NewReleaseResult> newReleaseResult;

  NewReleaseSlider({required this.newReleaseResult});

  @override
  Widget build(BuildContext context) {
    print(newReleaseResult.length);
    return Container(
      height: MediaQuery.of(context).size.height * 0.26,
      color: MyTheme.grey,
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('New Releases',
              style: TextStyle(color: Colors.white, fontSize: 18)),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.22,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(
                vertical: 10.0,
              ),
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  width: 15,
                );
              },
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return NewReleaseItem(results: newReleaseResult[index]);
              },
              itemCount: newReleaseResult.length,
            ),
          )
        ],
      ),
    );
  }
}
