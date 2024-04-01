import 'database_helper.dart';
import '../models/note_model.dart';
import '../interfaces/i_note_repository.dart';

class NoteRepository implements INoteRepository{
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  // すべてのメモを取得
  @override
  Future<List<Note>> getAllNotes() async {
    final List<Map<String, dynamic>> notesMapList =
        await _databaseHelper.queryAllRows();
    final List<Note> notesList =
        notesMapList.map((noteMap) => Note.fromMap(noteMap)).toList();
    return notesList;
  }

  // メモをデータベースに追加
  @override
  Future<int> insertNote(Note note) async {
    return await _databaseHelper.insert(note.toMap());
  }

  // メモの更新
  @override
  Future<int> updateNote(Note note) async {
    assert(note.id != null, 'Note ID must not be null for updating');
    return await _databaseHelper.update(note.toMap());
  }

  // メモの削除
  @override
  Future<int> deleteNoteById(int id) async {
    return await _databaseHelper.delete(id);
  }

  // IDによるメモの検索
  @override
  Future<Note?> getNoteById(int id) async {
    final noteMap = await _databaseHelper.queryRowById(id);
    if (noteMap != null) {
      return Note.fromMap(noteMap);
    }
    return null;
  }
}
