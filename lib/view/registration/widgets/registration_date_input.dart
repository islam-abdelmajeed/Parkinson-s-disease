import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../logic/registration/registration_provider.dart';
import '../../../widgets/app_text_field.dart';

class RegistrationDateInput extends StatelessWidget {
  const RegistrationDateInput({super.key});

  @override
  Widget build(BuildContext context) {
    final readCubit = context.read<RegistrationProvider>();
    final watchCubit = context.watch<RegistrationProvider>();
    return AppTextField(
      controller: watchCubit.dateController,
      readOnly: true,
      keyboardType: TextInputType.datetime,
      label: 'Birth date',
      suffixIcon: GestureDetector(
        onTap: () async {
          final selectedDate = await _showDateDialog(context);
          if (selectedDate != null) {
            var formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
            readCubit.dateController.text = formattedDate;
          }
        },
        child: SvgPicture.asset(
          'assets/icons/calendar_ic.svg',
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Birth date is required';
        }
        return null;
      },
    );
  }

  Future<DateTime?> _showDateDialog(BuildContext context) async =>
      await showDatePicker(
        context: context,
        firstDate: DateTime(1890, 1, 1),
        lastDate: DateTime.now(),
        initialDate: DateTime.fromMillisecondsSinceEpoch(0),
      );
}
