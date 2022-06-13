import '../../widgets/search_loading_widget.dart';
import '../../widgets/show_country_search.dart';
import '/utilities/constant.dart';
import '/users_list/ViewModel/world_sates_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({Key? key}) : super(key: key);

  @override
  _CountriesListScreenState createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    WorldStatesViewModel newsListViewModel = WorldStatesViewModel();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? bgColor
            : greyColor,
        iconTheme: Theme.of(context).brightness == Brightness.light
            ? const IconThemeData(color: Colors.black)
            : const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  hintText: 'Search with country name',
                  suffixIcon: searchController.text.isEmpty
                      ? const Icon(Icons.search)
                      : GestureDetector(
                          onTap: () {
                            searchController.text = "";
                            setState(() {});
                          },
                          child: const Icon(Icons.clear)),
                ),
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ),
            Expanded(
              child: FutureBuilder(
                  future: newsListViewModel.countriesListApi(),
                  builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                    if (!snapshot.hasData) {
                      // loading widget before the data showing
                      return SearchLoadingWidget();
                    } else {
                      return ShowCountrySearch(snapshot);
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}
