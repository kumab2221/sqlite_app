import 'database_helper.dart';
import '../models/note_model.dart';

class NoteRepository {
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  // すべてのメモを取得
  Future<List<Note>> getAllNotes() async {
    final List<Map<String, dynamic>> notesMapList =
        await _databaseHelper.queryAllRows();
    final List<Note> notesList =
        notesMapList.map((noteMap) => Note.fromMap(noteMap)).toList();
    return notesList;
  }

  // メモをデータベースに追加
  Future<int> insertNote(Note note) async {
    return await _databaseHelper.insert(note.toMap());
  }

  // メモの更新
  Future<int> updateNote(Note note) async {
    assert(note.id != null, 'Note ID must not be null for updating');
    return await _databaseHelper.update(note.toMap());
  }

  // メモの削除
  Future<int> deleteNoteById(int id) async {
    return await _databaseHelper.delete(id);
  }

  // IDによるメモの検索
  Future<Note?> getNoteById(int id) async {
    final noteMap = await _databaseHelper.queryRowById(id);
    if (noteMap != null) {
      return Note.fromMap(noteMap);
    }
    return null;
  }
}
