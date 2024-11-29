import 'package:flutter/material.dart';
import 'package:usb_debug_checker/usb_debug_checker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('USB Debugging Checker Example'),
          bottom: const PreferredSize(
            preferredSize: Size(double.infinity, 1),
            child: Divider(
              height: 1,
              thickness: 1,
            ),
          ),
        ),
        body: Center(
          child: FutureBuilder<bool>(
            future: UsbDebugChecker.isUsbDebuggingEnabled(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'USB Debugging is ',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                          color: Colors.black, // Set the text color
                        ),
                      ),
                      TextSpan(
                        text: snapshot.data == true ? 'Enabled' : 'Disabled',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                          color: Colors.red, // Set the text color
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
