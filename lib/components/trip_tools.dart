import 'package:flutter/material.dart';
import 'package:migrant/components/search_top_modal.dart';
import 'package:top_modal_sheet/top_modal_sheet.dart';

// ignore: must_be_immutable
class TripTools extends StatelessWidget {
  String startingPoint;
  String endingPoint;
  String date;
  String passengerCount;

  TripTools(
      {super.key,
      required this.startingPoint,
      required this.endingPoint,
      required this.date,
      required this.passengerCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        // borderRadius: BorderRadius.circular(6),
        border: Border(bottom: BorderSide(color: Color(0xff90a4ae), width: 2)),
      ),
      padding: const EdgeInsets.all(16),
      // color: Colors.white,
      // width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xff90a4ae)),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // trip info
            GestureDetector(
              // onTap: () => Navigator.pushNamed(context, "/search-top-modal"),
              onTap: () {
                showTopModalSheet(context, SearchTopModal(onConfirm: () {
                  Navigator.pushNamed(context, "/home-page");
                }));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(startingPoint),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(Icons.arrow_forward,
                          color: Color(0xff90a4ae), size: 18),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(endingPoint),
                    ],
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  // count of passengers
                  Row(
                    children: [
                      const Icon(Icons.airline_seat_recline_extra_rounded,
                          color: Color(0xff90a4ae)),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(passengerCount),
                      const Text(","),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(date),
                    ],
                  ),
                ],
              ),
            ),
            // filter button with shape 6
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xff90a4ae),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Icon(
                Icons.filter_alt,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
