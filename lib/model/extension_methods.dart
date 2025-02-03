extension StringExtension on String {
  String capitalize() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }

  String getNameOfMeasure(){
    return split("_").first;
  }

  String getMeasure(){
    return split("_").last;
  }
}
