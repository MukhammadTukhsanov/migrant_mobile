import 'package:flutter/material.dart';

class ResentlySearchedCard extends StatelessWidget {
  const ResentlySearchedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xff90a4ae)),
        borderRadius: BorderRadius.circular(6),
      ),
      child: const Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // trip info
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Saint Petersburg",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.w500)),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.arrow_forward,
                          color: Color(0xff90a4ae), size: 18),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Moscow",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      Text("12/12/2021",
                          style: TextStyle(fontSize: 14, color: Colors.grey)),
                      SizedBox(
                        width: 6,
                      ),
                      Icon(Icons.circle, color: Colors.grey, size: 8),
                      SizedBox(
                        width: 6,
                      ),
                      Text("1 Passenger",
                          style: TextStyle(fontSize: 14, color: Colors.grey)),
                    ],
                  )
                ],
              ),
              // price
              Text(
                "149 000",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
