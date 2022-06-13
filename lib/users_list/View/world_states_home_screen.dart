// ignore_for_file: non_constant_identifier_names

import '../../widgets/detail_widget.dart';
import '../../widgets/pie_chart_widget.dart';
import '../../widgets/spin_kit_widget.dart';
import '../../widgets/track_country_button_widget.dart';
import '/users_list/Model/world_states.dart';
import '/users_list/ViewModel/world_sates_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorldStates extends StatefulWidget {
  const WorldStates({Key? key}) : super(key: key);

  @override
  _WorldStatesState createState() => _WorldStatesState();
}

class _WorldStatesState extends State<WorldStates>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 1000),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  WorldStatesViewModel newsListViewModel = WorldStatesViewModel();

  @override
  Widget build(BuildContext context) {
    /* Whenever the back button is pressed, you will get a callback at onWillPop, 
    which returns a Future. If the Future returns true, the screen is popped. */

    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false, // set it to false

        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                SizedBox(height: 10.h),
                FutureBuilder(
                    future: newsListViewModel.fetchWorldRecords(),
                    builder:
                        (context, AsyncSnapshot<WorldStatesModel> snapshot) {
                      if (!snapshot.hasData) {
                        return SpinKitWidget(controller: _controller);
                      } else {
                        return ListView(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: [
                            Column(
                              children: [
                                // Pie chart widget
                                PieChartWidget(snapshot),

                                Column(
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 30.h),

                                      // Detail_widget
                                      child: DetailWidget(snapshot),
                                    ),
                                    // Button Widgets
                                    const TrackCountryButton()
                                  ],
                                )
                              ],
                            ),
                          ],
                        );
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
