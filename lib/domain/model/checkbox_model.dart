class CheckBoxModel {
  CheckBoxModel({required this.text, required this.checked, required this.order});

  late String text;
  late int order;
  late bool checked;

  CheckBoxModel.fromJson(Map<String, dynamic> parsedJson) {
    text = parsedJson['text'] as String;
    checked = parsedJson['checked'] == null ? true : parsedJson['checked'] as bool;
    order = parsedJson['order'] == null ? 1 : parsedJson['order'] as int;
  }

  Map<String, dynamic> toJson() {
    return {
      "text": this.text,
      "checked": this.checked,
      "order": this.order,
    };
  }
}
