import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newest/controllers/MedicalStaffController/reprotmedicalstaffController.dart';

class ReportMedicalStaff extends StatelessWidget {
  final String id;
  var index;
  final String text;
  ReportMedicalStaff({
    super.key,
    required this.index,
    required this.id,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: GetBuilder<ReporrtMedicalControllerImp>(
        builder: (controller) => Dismissible(
          key: GlobalKey(debugLabel: 'MyWidget_$index'),
          direction: DismissDirection.endToStart,
          background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              child: const Icon(Icons.delete_forever,
                  color: Colors.white, size: 40.0)),
          onDismissed: (direction) {
            controller.deleteReport(id);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                duration: Duration(milliseconds: 1000),
                content: Text('dismissed')));
          },
          child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(15)),
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodyLarge,
              )),
        ),
      ),
    );
  }
}
