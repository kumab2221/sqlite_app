import '../models/note_model.dart';
import '../interfaces/i_note_repository.dart';

class NoteService {
  final INoteRepository _noteRepository;
  NoteService(this._noteRepository);

  // メモの一覧を取得
  Future<List<Note>> fetchNotes() async {
    return await _noteRepository.getAllNotes();
  }

  // 新しいメモを追加
  Future<int> addNote(Note note) async {
    return await _noteRepository.insertNote(note);
  }

  // メモを更新
  Future<int> updateNote(Note note) async {
    return await _noteRepository.updateNote(note);
  }

  // メモを削除
  Future<int> deleteNoteById(int id) async {
    return await _noteRepository.deleteNoteById(id);
  }

  // メモの詳細を取得
  Future<Note?> getNoteById(int id) async {
    return await _noteRepository.getNoteById(id);
  }
}
