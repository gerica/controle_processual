class CheckBoxModel {
  CheckBoxModel({required this.text, required this.checked});

  late String text;
  late bool checked;

  CheckBoxModel.fromJson(Map<String, dynamic> parsedJson) {
    text = parsedJson['text'] as String;
    checked = parsedJson['checked'] == null ? true : parsedJson['checked'] as bool;
  }

  Map<String, dynamic> toJson() {
    return {
      "text": this.text,
      "checked": this.checked,
    };
  }
}
