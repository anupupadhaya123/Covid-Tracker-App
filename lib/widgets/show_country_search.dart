import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../users_list/View/detail_screen.dart';

// ignore: non_constant_identifier_names
ListView ShowCountrySearch(AsyncSnapshot<List<dynamic>> snapshot) {
  TextEditingController searchController = TextEditingController();

  return ListView.builder(
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        String name = snapshot.data![index]['country'];
        if (searchController.text.isEmpty) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailScreen(
                                image: snapshot.data![index]['countryInfo']
                                    ['flag'],
                                name: snapshot.data![index]['country'],
                                totalCases: snapshot.data![index]['cases'],
                                totalRecovered: snapshot.data![index]
                                    ['recovered'],
                                totalDeaths: snapshot.data![index]['deaths'],
                                active: snapshot.data![index]['active'],
                                test: snapshot.data![index]['tests'],
                                todayRecovered: snapshot.data![index]
                                    ['todayRecovered'],
                                critical: snapshot.data![index]['critical'],
                              )));
                },
                child: ListTile(
                  leading: Image(
                    height: 50.h,
                    width: 50.w,
                    image: NetworkImage(
                        snapshot.data![index]['countryInfo']['flag']),
                  ),
                  title: Text(snapshot.data![index]['country']),
                  subtitle: Text(
                      "Effected: " + snapshot.data![index]['cases'].toString()),
                ),
              ),
              const Divider()
            ],
          );
        } else if (name
            .toLowerCase()
            .contains(searchController.text.toLowerCase())) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailScreen(
                            image: snapshot.data![index]['countryInfo']['flag'],
                            name: snapshot.data![index]['country'],
                            totalCases: snapshot.data![index]['cases'],
                            totalRecovered: snapshot.data![index]['recovered'],
                            totalDeaths: snapshot.data![index]['deaths'],
                            active: snapshot.data![index]['active'],
                            test: snapshot.data![index]['tests'],
                            todayRecovered: snapshot.data![index]
                                ['todayRecovered'],
                            critical: snapshot.data![index]['critical'],
                          )));
            },
            child: Column(
              children: [
                ListTile(
                  leading: Image(
                    height: 50.h,
                    width: 50.w,
                    image: NetworkImage(
                        snapshot.data![index]['countryInfo']['flag']),
                  ),
                  title: Text(snapshot.data![index]['country']),
                  subtitle: Text(
                      "Effected: " + snapshot.data![index]['cases'].toString()),
                ),
                const Divider()
              ],
            ),
          );
        } else {
          return Container();
        }
      });
}
