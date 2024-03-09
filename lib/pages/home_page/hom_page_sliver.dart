import 'package:flutter/material.dart';
import 'package:migrant/components/date_picker.dart';
import 'package:migrant/components/trip_card.dart';
// import 'package:migrant/pages/choose_country_page.dart';
import 'package:migrant/pages/home_page/choose_country_input.dart';
import 'package:migrant/skelton/index.dart';

class HomePageSliver extends StatefulWidget {
  const HomePageSliver({super.key});

  @override
  State<HomePageSliver> createState() => _HomePageSliverState();
}

class _HomePageSliverState extends State<HomePageSliver> {
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          scrolledUnderElevation: BorderSide.strokeAlignCenter,
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Image.asset(
              'assets/images/exLogo.png',
            ),
          ),
          leadingWidth: 146,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: Container(
              color: Colors.blueGrey,
              height: 1,
            ),
          ),
          actions: [
            IconButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  const EdgeInsets.all(8),
                ),
              ),
              icon: const Icon(Icons.search, color: Colors.blueGrey),
              onPressed: () {},
            ),
          ],
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              clipBehavior: Clip.hardEdge,
              expandedHeight: 222,
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              floating: true,
              elevation: 0,
              stretch: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.blueGrey,
                        width: 1,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        const Expanded(child: ChooseCountryInput()),
                        const SizedBox(
                          height: 16,
                        ),
                        const Expanded(child: ChooseCountryInput()),
                        const SizedBox(
                          height: 16,
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8 -
                                          48,
                                  height: 50,
                                  child: const DatePicker(),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.blueGrey),
                                      borderRadius: BorderRadius.circular(4)),
                                  child: const TextField(
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.blueGrey),
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons
                                            .airline_seat_recline_extra_rounded,
                                        color: Colors.blueGrey,
                                      ),
                                      contentPadding: EdgeInsets.all(9),
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      // labelText: '1',
                                      hintStyle: TextStyle(
                                          fontSize: 18, color: Colors.blueGrey),
                                      hintText: '1',
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // double app bar
            SliverList(
              delegate: _isLoading
                  ?
                  // SircularProgressIndicator
                  //     delegate: SliverChildListDelegate([
                  //   Padding(
                  //     padding: const EdgeInsets.all(16.0),
                  //     child: Center(child: TripCardSkelton()),
                  //   ),
                  // ])
                  SliverChildListDelegate(List.generate(
                      5,
                      (index) => const Padding(
                        // ignore: unnecessary_const
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                        child: TripCardSkelton(),
                      ),
                    ))
                  : SliverChildListDelegate(List.generate(
                      20,
                      (index) => Padding(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                        child: TripCard(
                            price: "149 000",
                            startDate: "21 : 30",
                            endDate: "24 : 00",
                            startLocation: "Moscow",
                            endLocation: "San Francisco",
                            user: "Alisher Haidarov",
                            countOfFreeSeats: "5"),
                      ),
                    )),
            ),
          ],
        ));
  }
}
