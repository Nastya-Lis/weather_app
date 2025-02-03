import 'package:flutter/material.dart';

import '../../../model/converter/precipitation_converter.dart';
import '../../../model/current/current.dart';

class WidgetConditionParam extends StatelessWidget {
  final ConditionParam? conditionParam;

  const WidgetConditionParam({
    super.key,
    required this.conditionParam,
  });

  @override
  Widget build(BuildContext context) {
    return conditionParam == null
        ? const SizedBox()
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 1),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.1,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Image.asset(
                    precipitationToAssetIcon(conditionParam!.icon),
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  conditionParam!.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const Text(
                "|",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Expanded(
                child: Text(
                    "${conditionParam!.value} ${conditionParam!.unitOfMeasure}",
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                    textAlign: TextAlign.center),
              ),
            ],
          );
  }
}
