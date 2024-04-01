import "../models/note_model.dart";

abstract class INoteRepository {
  Future<List<Note>> getAllNotes();
  Future<Note?> getNoteById(int id);
  Future<int> insertNote(Note note);
  Future<int> updateNote(Note note);
  Future<int> deleteNoteById(int id);
}