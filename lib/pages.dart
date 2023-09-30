import 'package:flutter/material.dart';
import 'package:page_trasitions/custom_transitions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xfff4d35e),
              Color(0xffe26d5c),
              Color(0xff00509d),
              Color(0xff00296b),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(ScalePageTransition(child: const ChildPage()));
              },
              child: const Text("Scale"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(SlidePageTransition(
                    child: const ChildPage(), direction: AxisDirection.left));
              },
              child: const Text("Slide Left"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(SlidePageTransition(
                    child: const ChildPage(), direction: AxisDirection.right));
              },
              child: const Text("Slide Right"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(SlidePageTransition(
                    child: const ChildPage(), direction: AxisDirection.up));
              },
              child: const Text("Slide up"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(SlidePageTransition(
                    child: const ChildPage(), direction: AxisDirection.down));
              },
              child: const Text("Slide down"),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class ChildPage extends StatelessWidget {
  const ChildPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.9),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.navigate_before),
          label: const Text("Back"),
        ),
      ),
    );
  }
}
