import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:migrant/components/date_picker.dart';
import 'package:migrant/components/trip_card.dart';
import 'package:migrant/components/trip_tools.dart';
import 'package:migrant/pages/home_page.dart';
import 'package:migrant/pages/home_page/choose_country_input.dart';
import 'package:migrant/pages/home_page/hom_page_sliver.dart';
// import 'package:migrant/pages/home_page/search_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const HomePageSliver();
    // return const SafeArea(
    //   child: AnnotatedRegion(
    //     value: SystemUiOverlayStyle(
    //       statusBarColor: Colors.white,
    //       statusBarIconBrightness: Brightness.dark,
    //     ),
    //     child: Scaffold(
    //       backgroundColor: Colors.white,
    //       body: Column(
    //         children: [
    //           SizedBox(
    //               height: 50,
    //               child: Padding(
    //                 padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
    //                 child: Align(
    //                   alignment: Alignment.centerLeft,
    //                   child: Image(
    //                     image: AssetImage("assets/images/exLogo.png"),
    //                     width: 126,
    //                   ),
    //                 ),
    //               )),
    //           HomePageSliver()

    // flexibleSpace: FlexibleSpaceBar(
    //   background: Image.asset(
    //     "assets/images/exLogo.png",
    //     fit: BoxFit.contain,
    //   ),
    // ),

    // Container(
    //     decoration: const BoxDecoration(
    //       color: Colors.white,
    //       boxShadow: [
    //         BoxShadow(
    //           color: Color(0xff90a4ae),
    //           blurRadius: 1,
    //         ),
    //       ],
    //       border: Border(
    //           bottom: BorderSide(color: Color(0xff90a4ae), width: .5)),
    //     ),
    //     child: Padding(
    //       padding: const EdgeInsets.all(16),
    //       child: Column(
    //         children: [
    //           Row(
    //             children: [
    //               Expanded(
    //                 child: SizedBox(
    //                   width:
    //                       MediaQuery.of(context).size.width * 0.8 - 48,
    //                   height: 50,
    //                   child: const ChooseCountryInput(),
    //                 ),
    //               ),
    //               const SizedBox(
    //                 width: 8,
    //               ),
    //               Expanded(
    //                 child: SizedBox(
    //                   width:
    //                       MediaQuery.of(context).size.width * 0.8 - 48,
    //                   height: 50,
    //                   child: const ChooseCountryInput(),
    //                 ),
    //               ),
    //             ],
    //           ),
    //           const SizedBox(
    //             height: 8,
    //           ),
    //           Row(
    //             children: [
    //               Expanded(
    //                 child: SizedBox(
    //                   width:
    //                       MediaQuery.of(context).size.width * 0.8 - 48,
    //                   height: 50,
    //                   child: const DatePicker(),
    //                 ),
    //               ),
    //               const SizedBox(
    //                 width: 8,
    //               ),
    //               Container(
    //                   width: MediaQuery.of(context).size.width * 0.2,
    //                   decoration: BoxDecoration(
    //                       border: Border.all(
    //                           width: 1, color: Colors.blueGrey),
    //                       borderRadius: BorderRadius.circular(4)),
    //                   child: const TextField(
    //                     keyboardType: TextInputType.number,
    //                     textAlign: TextAlign.center,
    //                     style: TextStyle(
    //                         fontSize: 16, color: Colors.blueGrey),
    //                     decoration: InputDecoration(
    //                       prefixIcon: Icon(
    //                         Icons.airline_seat_recline_extra_rounded,
    //                         color: Colors.blueGrey,
    //                       ),
    //                       contentPadding: EdgeInsets.all(9),
    //                       border: InputBorder.none,
    //                       enabledBorder: InputBorder.none,
    //                       // labelText: '1',
    //                       hintStyle: TextStyle(
    //                           fontSize: 18, color: Colors.blueGrey),
    //                       hintText: '2',
    //                     ),
    //                   )),
    //             ],
    //           ),
    //           // TripTools(
    //           //     startingPoint: "Saint Petersburg",
    //           //     endingPoint: "Moscow",
    //           //     date: "Today",
    //           //     passengerCount: "1"),
    //         ],
    //       ),
    //     )),
    // const SizedBox(
    //   height: 16,
    // ),
    // Padding(
    //   padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
    //   child: TripCard(
    //       price: "149 000",
    //       startDate: "22 : 30",
    //       endDate: "23 : 30",
    //       startLocation: "Saint Petersburg",
    //       endLocation: "Moscow",
    //       user: "Alisher Haidarov",
    //       countOfFreeSeats: "5"),
    // ),
    // const SizedBox(
    //   height: 16,
    // ),
    // Padding(
    //   padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
    //   child: TripCard(
    //       price: "149 000",
    //       startDate: "22 : 30",
    //       endDate: "23 : 30",
    //       startLocation: "Saint Petersburg",
    //       endLocation: "Moscow",
    //       user: "Alisher Haidarov",
    //       countOfFreeSeats: "5"),
    // ),

    // Expanded(
    // child: Center(
    // child: Padding(
    // padding: const EdgeInsets.all(16.0),
    // child: SingleChildScrollView(
    //   child: Column(
    //     children: [
    //       Container(
    //         decoration: BoxDecoration(
    //             border: Border.all(width: 1, color: Colors.blueGrey),
    //             borderRadius: BorderRadius.circular(4)),
    //         padding: const EdgeInsets.all(16),
    //         child: Column(
    //           children: [
    //             const ChooseCountryInput(),
    //             const SizedBox(
    //               height: 16,
    //             ),
    //             const ChooseCountryInput(),
    //             const SizedBox(
    //               height: 16,
    //             ),
    //             Row(
    //               children: [
    //                 Expanded(
    //                   child: SizedBox(
    //                     width:
    //                         MediaQuery.of(context).size.width * 0.8 -
    //                             48,
    //                     height: 50,
    //                     child: const DatePicker(),
    //                   ),
    //                 ),
    //                 const SizedBox(
    //                   width: 8,
    //                 ),
    //                 Container(
    //                     width:
    //                         MediaQuery.of(context).size.width * 0.2,
    //                     decoration: BoxDecoration(
    //                         border: Border.all(
    //                             width: 1, color: Colors.blueGrey),
    //                         borderRadius: BorderRadius.circular(4)),
    //                     child: const TextField(
    //                       keyboardType: TextInputType.number,
    //                       textAlign: TextAlign.center,
    //                       style: TextStyle(
    //                           fontSize: 16, color: Colors.blueGrey),
    //                       decoration: InputDecoration(
    //                         prefixIcon: Icon(
    //                           Icons
    //                               .airline_seat_recline_extra_rounded,
    //                           color: Colors.blueGrey,
    //                         ),
    //                         contentPadding: EdgeInsets.all(9),
    //                         border: InputBorder.none,
    //                         enabledBorder: InputBorder.none,
    //                         // labelText: '1',
    //                         hintStyle: TextStyle(
    //                             fontSize: 18, color: Colors.blueGrey),
    //                         hintText: '2',
    //                       ),
    //                     )),
    //               ],
    //             ),
    //             const SizedBox(
    //               height: 16,
    //             ),
    //             GestureDetector(
    //               onTap: () {},
    //               // onTap: () {
    //               child: Container(
    //                 width: MediaQuery.of(context).size.width,
    //                 padding: const EdgeInsets.all(16),
    //                 decoration: BoxDecoration(
    //                   color: Colors.blueGrey,
    //                   borderRadius: BorderRadius.circular(6),
    //                 ),
    //                 child: const Text(
    //                   "Search",
    //                   textAlign: TextAlign.center,
    //                   style: TextStyle(
    //                       color: Colors.white,
    //                       fontSize: 16,
    //                       fontWeight: FontWeight.w500),
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // ),
    // ),
    // )),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
