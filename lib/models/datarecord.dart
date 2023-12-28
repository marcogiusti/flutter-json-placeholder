int sequence = 0;

class DataRecord<T> {
  final id = sequence++;
  final T original;
  final T current;

  DataRecord(this.original, this.current);

  factory DataRecord.make(T value) {
    return DataRecord(value, value);
  }

  @override
  bool operator ==(Object other) {
    return other is DataRecord<T> &&
        (other.original == original && other.current == current);
  }

  @override
  int get hashCode {
    return [original, current].hashCode;
  }

  bool isModified() {
    return original != current;
  }

  setValue(T value) {
    return DataRecord(original, value);
  }
}
