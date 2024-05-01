import 'package:flutter/material.dart';

class BottomCheckOutButton extends StatelessWidget {
  const BottomCheckOutButton({
    super.key,
    required this.total,
  });

  final int total;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      width: double.infinity,
      color: const Color(0xffe6dede),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total Price:'),
                Text('$total \$',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor:
                    MaterialStatePropertyAll(
                        Colors
                            .red),
                    foregroundColor: MaterialStatePropertyAll(Colors.white)),
                onPressed: () {
                },
                child: const Text(
                    'CHECK OUT'),
              ),
            )
          ],
        ),
      ),
    );
  }
}