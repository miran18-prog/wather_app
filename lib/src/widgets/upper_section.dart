import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:wather_app/api/api_services.dart';
import 'package:weather/weather.dart';

class UpperSecrion extends StatelessWidget {
  final Weather weather;
  const UpperSecrion({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                weather.areaName.toString(),
                style: GoogleFonts.dmSans(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade200),
              ),
              Text(
                DateFormat('d MMMM, EEEE').format(DateTime.now()),
                style: GoogleFonts.dmSans(
                    letterSpacing: 1.0,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade700),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 10),
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.grey.shade800,
            borderRadius: BorderRadius.circular(15),
          ),
          child: IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.grey.shade400,
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: Colors.grey.shade900,
                      content: SizedBox(
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextField(
                              style: const TextStyle(color: Colors.white),
                              controller: controller,
                              decoration: InputDecoration(
                                hoverColor: Colors.white,
                                focusColor: Colors.white,
                                hintText: "city name",
                                hintStyle:
                                    TextStyle(color: Colors.grey.shade500),
                              ),
                            ),
                            const SizedBox(height: 50),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.amberAccent,
                                    ),
                                    child: const Text("cancel"),
                                  ),
                                ),
                                Consumer(
                                  builder: (context, ref, child) {
                                    return ElevatedButton(
                                      onPressed: () {
                                        ref
                                            .read(cityNameProvider.notifier)
                                            .state = controller.text;
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.amberAccent,
                                      ),
                                      child: const Text("search"),
                                    );
                                  },
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  });
            },
          ),
        )
      ],
    );
  }
}
