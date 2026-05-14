import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'candidates_table.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Candidates])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // Candidate Queries
  Future<List<Candidate>> getAllCandidates() => select(candidates).get();
  
  Stream<List<Candidate>> watchAllCandidates() => select(candidates).watch();
  
  Future<int> insertCandidate(CandidatesCompanion candidate) => into(candidates).insert(candidate);
  
  Future<bool> updateCandidate(Candidate candidate) => update(candidates).replace(candidate);
  
  Future<int> deleteCandidate(Candidate candidate) => delete(candidates).delete(candidate);
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'candidates_db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
