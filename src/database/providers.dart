import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'database.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(() => db.close());
  return db;
});

final candidatesStreamProvider = StreamProvider<List<Candidate>>((ref) {
  final db = ref.watch(databaseProvider);
  return db.watchAllCandidates();
});
