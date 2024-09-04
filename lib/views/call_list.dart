import 'package:action_engine/constants/app_fonts.dart';
import 'package:flutter/material.dart';

class CallListPage extends StatelessWidget {
  const CallListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
      child: Column(
        children: [
          SizedBox(
            height: 70,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  color: Colors.transparent,
                )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 16, 8, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Good morning,',
                        style: AppFonts.montserratBoldHeader,
                      ),
                      Text(
                        'David Robert',
                        style: AppFonts.montserratRegular,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 100.0,
            child: Expanded(
              child: ClipRRect(
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.all(Radius.circular(2.0)),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.blue,
            ),
          )
        ],
      ),
    ));
  }
}
