
import 'package:covid_tracker/Utilities/constant.dart';
import 'package:covid_tracker/components/reusable_row.dart';
import 'package:covid_tracker/users_list/Model/world_states.dart';
import 'package:covid_tracker/users_list/View/countries_list_screen.dart';
import 'package:covid_tracker/users_list/ViewModel/world_sates_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStates extends StatefulWidget {
  const WorldStates({Key? key}) : super(key: key);

  @override
  _WorldStatesState createState() => _WorldStatesState();
}

class _WorldStatesState extends State<WorldStates> with TickerProviderStateMixin {


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
      onWillPop: ()async{
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                SizedBox(height:  10.h),
                FutureBuilder(
                    future: newsListViewModel.fetchWorldRecords(),
                    builder: (context,AsyncSnapshot<WorldStatesModel> snapshot){
                  if(!snapshot.hasData){

                    return Expanded(
                      flex: 1,
                      child: SpinKitFadingCircle(
                        color: Colors.black,
                        size: 50.h,
                        controller: _controller,
                      ),
                    );
                  }else {
                    return Column(
                      children: [
                        PieChart(
                          dataMap: {
                            "Total": double.parse(snapshot.data!.cases!.toString()),
                            "Recovered": double.parse(snapshot.data!.recovered.toString()),
                            "Deaths": double.parse(snapshot.data!.deaths.toString()),
                          },
                          animationDuration: Duration(milliseconds: 1200),
                          chartLegendSpacing: 32,
                          chartRadius: 100.w,
                          colorList: colorList,
                          initialAngleInDegree: 0,
                          chartType: ChartType.ring,
                          ringStrokeWidth: 25.w,
                          legendOptions: const LegendOptions(
                            showLegendsInRow: false,
                            legendPosition: LegendPosition.left,
                            showLegends: true,
                            legendTextStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          chartValuesOptions: const ChartValuesOptions(
                            showChartValueBackground: true,
                            showChartValues: true,
                            showChartValuesInPercentage: true,
                            showChartValuesOutside: true,
                            decimalPlaces: 1,
                          ),

                        ),
                        Padding(
                          padding:  EdgeInsets.symmetric(vertical:30.h),
                          child: Card(
                            child: Column(
                              children: [
                                ReusableRow(title: 'Total Cases', value: snapshot.data!.cases.toString()),
                                ReusableRow(title: 'Deaths', value: snapshot.data!.deaths.toString()),
                                ReusableRow(title: 'Recovered', value: snapshot.data!.recovered.toString()),
                                ReusableRow(title: 'Active', value: snapshot.data!.active.toString()),
                                ReusableRow(title: 'Critical', value: snapshot.data!.critical.toString()),
                                ReusableRow(title: 'Today Deaths', value: snapshot.data!.todayDeaths.toString()),
                                ReusableRow(title: 'Today Recovered', value: snapshot.data!.todayRecovered.toString()),

                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const CountriesListScreen()));
                          },
                          child: Container(
                            height: 50.h,
                            decoration: BoxDecoration(
                              color: Color(0xff1aa260),
                              borderRadius:BorderRadius.circular(10)
                            ),
                            child:  Center(
                              child: Text('Track Countries', style: headingStyle.copyWith(
                                fontSize: 18.r
                              ),),
                            ),
                          ),
                        )
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

