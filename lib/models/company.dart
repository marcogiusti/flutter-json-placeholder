typedef CompanyRecord = ({String name, String catchPhrase, String bs});

class Company {
  final String name;
  final String catchPhrase;
  final String bs;

  Company({required this.name, required this.catchPhrase, required this.bs});

  factory Company.fromJson(CompanyRecord record) {
    return Company(
        name: record.name, catchPhrase: record.catchPhrase, bs: record.bs);
  }
}
