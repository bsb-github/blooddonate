import 'package:flutter/material.dart';

class RequestCard extends StatefulWidget {
  const RequestCard({super.key});

  @override
  State<RequestCard> createState() => _RequestCardState();
}

class _RequestCardState extends State<RequestCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(flex: 2, child: Container()),
          Expanded(
              flex: 8,
              child: Column(
                children: [
                  Expanded(flex: 2, child: Text("Bismillah Sharif")),
                  Expanded(flex: 2, child: Text("Bismillah Sharif")),
                  Expanded(flex: 2, child: Text("Bismillah Sharif")),
                  Expanded(flex: 2, child: Text("Bismillah Sharif")),
                ],
              )),
        ],
      ),
    );
  }
}
