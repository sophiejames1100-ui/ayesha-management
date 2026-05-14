import 'package:drift/drift.dart';

class Candidates extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get createdDate => dateTime()();
  TextColumn get candidateName => text()();
  TextColumn get currentCompany => text()();
  TextColumn get contactNumber => text()();
  TextColumn get email => text()();
  TextColumn get currentCtc => text()();
  TextColumn get ctcType => text()();
  TextColumn get expectedCtc => text()();
  TextColumn get noticePeriod => text()();
  DateTimeColumn get availableJoinDate => dateTime()();
  TextColumn get jobType => text()();
  TextColumn get remarks => text()();
}
