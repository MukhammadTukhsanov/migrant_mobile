import 'package:flutter/material.dart';
import 'package:migrant/components/gap.dart';

class Skelton extends StatelessWidget {
  // Skelton width
  final double width;
  // Skelton height
  final double height;
  // Skelton color
  final Color color;
  // Skelton radius
  final double radius;
  // Skelton margin
  final EdgeInsets margin;
  // Skelton padding
  final EdgeInsets padding;

  const Skelton({
    super.key,
    this.width = 100,
    this.height = 100,
    this.color = const Color(0xffe0e0e0),
    this.radius = 0,
    this.margin = const EdgeInsets.all(0),
    this.padding = const EdgeInsets.all(0),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}

// Skelton class for trip card skelton
class TripCardSkelton extends StatelessWidget {
  const TripCardSkelton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.04),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Skelton(
                          width: 50,
                          height: 10,
                          radius: 4,
                        ),
                        Gap(size: 20),
                        const Skelton(
                          width: 130,
                          height: 10,
                          radius: 4,
                        ),
                      ],
                    ),
                    Gap(size: 20),
                    Row(
                      children: [
                        const Skelton(
                          width: 50,
                          height: 10,
                          radius: 4,
                        ),
                        Gap(size: 20),
                        const Skelton(
                          width: 100,
                          height: 10,
                          radius: 4,
                        ),
                      ],
                    )
                  ],
                ),
                const Spacer(),
                const Skelton(
                  width: 110,
                  height: 15,
                  radius: 6,
                )
              ],
            ),
            Gap(size: 20),
            Row(
              children: [
                Row(
                  children: [
                    const Skelton(
                      width: 50,
                      height: 50,
                      radius: 25,
                    ),
                    Gap(size: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Skelton(
                          width: 150,
                          height: 10,
                          radius: 4,
                        ),
                        Gap(size: 10),
                        const Skelton(
                          width: 50,
                          height: 10,
                          radius: 4,
                        ),
                      ],
                    )
                  ],
                ),
                const Spacer(),
                const Skelton(
                  width: 50,
                  height: 40,
                  radius: 6,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
