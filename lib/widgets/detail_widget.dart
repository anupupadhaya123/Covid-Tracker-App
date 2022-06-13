import 'package:flutter/material.dart';

import '../components/reusable_row.dart';
import '../users_list/Model/world_states.dart';

 // ignore: non_constant_identifier_names
 Card DetailWidget(AsyncSnapshot<WorldStatesModel> snapshot) {
    return Card(
      child: Column(
        children: [
          ReusableRow(
              title: 'Total Cases', value: snapshot.data!.cases.toString()),
          ReusableRow(title: 'Deaths', value: snapshot.data!.deaths.toString()),
          ReusableRow(
              title: 'Recovered', value: snapshot.data!.recovered.toString()),
          ReusableRow(title: 'Active', value: snapshot.data!.active.toString()),
          ReusableRow(
              title: 'Critical', value: snapshot.data!.critical.toString()),
          ReusableRow(
              title: 'Today Deaths',
              value: snapshot.data!.todayDeaths.toString()),
          ReusableRow(
              title: 'Today Recovered',
              value: snapshot.data!.todayRecovered.toString()),
        ],
      ),
    );
  }

