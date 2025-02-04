import 'package:flutter/material.dart';

List<OverlayEntry?>? _overlayEntryDialogs = <OverlayEntry?>[];

void showInProgressDialog(BuildContext context, String message) async {
  OverlayEntry overlayEntry = OverlayEntry(builder: (BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black.withAlpha(100),
        child: Dialog(
            elevation: 48,
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  getCircularProgressView(),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(message)
                ],
              ),
            )));
  });
  _overlayEntryDialogs?.add(overlayEntry);
  Overlay.of(context).insert(overlayEntry);
}

Widget getCircularProgressView() {
  return const CircularProgressIndicator(strokeWidth: 3, color: Colors.green);
}

void closeAllInProgressDialogs() {
  _overlayEntryDialogs?.forEach((OverlayEntry? element) {
    element?.remove();
  });
  _overlayEntryDialogs = <OverlayEntry?>[];
}