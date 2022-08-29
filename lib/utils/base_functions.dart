import 'package:diyi/components/loader_dialog.dart';
import 'package:diyi/components/toast.dart';
import 'package:diyi/global/global.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// BaseFunctions baseFunctions = BaseFunctions();

// class BaseFunctions {
OverlayEntry overlayEntry;

showLoading(BuildContext context) async {
  Future.delayed(Duration.zero, () async {
    OverlayState overlayState = Overlay.of(context);
    if (overlayEntry == null) {
      overlayEntry = OverlayEntry(
          builder: (context) => Container(
              color: Colors.black12.withOpacity(0.4),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: LoaderDialog()));
      if (overlayState.mounted) WidgetsBinding.instance.addPostFrameCallback((_) => overlayState.insert(overlayEntry));
    }
  });
}

hideLoading() {
  if (overlayEntry != null) {
    overlayEntry?.remove();
    overlayEntry = null;
  }
}

FToast fToast = FToast();
initFToast(BuildContext context) {
  fToast.init(context);
}

showWarningToasts(String msg) {
  // fToast.removeCustomToast();
  Fluttertoast.showToast(msg: msg, backgroundColor: Styles.orangeColor, toastLength: Toast.LENGTH_LONG
      // positionedToastBuilder: (context, child) {
      //   return MyToast.warningToast(
      //     title: msg,
      //     body: body,
      //     callback: () => fToast.removeCustomToast(),
      //   );
      // },
      );
}

showSuccessToasts(String msg, {String body}) {
  fToast.removeCustomToast();
  fToast.showToast(positionedToastBuilder: (context, child) {
    return MyToast.successToast(
      title: msg,
      body: body,
      callback: () => fToast.removeCustomToast(),
    );
  });
}

showErrorToast(String errorText, {String body}) {
  fToast.removeCustomToast();
  fToast.showToast(positionedToastBuilder: (context, child) {
    return MyToast.errorToast(
      title: errorText,
      body: body,
      callback: () => fToast.removeCustomToast(),
    );
  });
}
// }
