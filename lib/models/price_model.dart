import 'package:flutter/foundation.dart';

class PriceModel {
  final String unit;
  final num value;

  const PriceModel({ @required this.unit, @required this.value });

  factory PriceModel.fromJson(Map<String, Object> priceJson) {
    return new PriceModel(
      unit: priceJson['unit'],
      value: priceJson['value'],
    );
  }
}
