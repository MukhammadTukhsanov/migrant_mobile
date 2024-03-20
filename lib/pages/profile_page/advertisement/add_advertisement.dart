import 'package:flutter/material.dart';
import 'package:migrant/components/gap.dart';
import 'package:migrant/pages/profile_page/advertisement/choose_country_and_time.dart';

class AddAdvertisement extends StatefulWidget {
  const AddAdvertisement({super.key});

  @override
  State<AddAdvertisement> createState() => _AddAdvertisementState();
}

class _AddAdvertisementState extends State<AddAdvertisement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          // title: const Text('Add Advertisement'),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(children: [
                  Text(
                    'Add Advertisement',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.blueGrey.shade700,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Add your advertisement here',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blueGrey.shade500,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Gap(size: 40),
                  const ChooseCountryAndTime(),
                  Gap(size: 20),
                  const ChooseCountryAndTime(),
                  Gap(size: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Price',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.blueGrey.shade700,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.blueGrey),
                                  borderRadius: BorderRadius.circular(4)),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.only(left: 20),
                                  hintText: 'Enter price',
                                  hintStyle: TextStyle(
                                    fontSize: 16,
                                    color: Colors.blueGrey.shade600,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  // border none
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            // trip price
                          ],
                        ),
                      ),
                      Gap(size: 10),
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              '',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.blueGrey.shade700,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Container(
                            width: 100,
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: Colors.blueGrey),
                                borderRadius: BorderRadius.circular(4)),
                            child: DropdownButton<String>(
                              hint: const Text('USD'),
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.blueGrey.shade700,
                                fontWeight: FontWeight.w500,
                              ),
                              items: <String>['USD', 'EUR', 'GBP', 'RUB']
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (_) {
                                // setState(() {
                                //   _value = newValue;
                                // });
                              },
                            ),
                          ),
                          // trip price
                        ],
                      ),
                      // free seats
                    ],
                  ),

                  Gap(size: 20),
                  // free seats
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Free Seats',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blueGrey.shade700,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 90,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.blueGrey),
                          borderRadius: BorderRadius.circular(4)),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.airline_seat_recline_normal,
                              size: 20, color: Colors.blueGrey.shade700),
                          contentPadding: const EdgeInsets.only(left: 20),
                          hintText: '1',
                          // border none
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Gap(size: 20),
                  // description
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blueGrey.shade700,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.blueGrey),
                        borderRadius: BorderRadius.circular(4)),
                    child: TextFormField(
                      maxLines: 5,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.only(left: 20, top: 20),
                        hintText: 'Enter description',
                        // border none
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Gap(size: 20),
                  // add button
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(MediaQuery.of(context).size.width, 52),
                      backgroundColor: Colors.blueGrey.shade700,
                      padding: const EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Add',
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),
                ]))));
  }
}
