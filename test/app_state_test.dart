import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:notes_app/database_helper/database_helper.dart';
import 'package:notes_app/models/note.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:notes_app/constants.dart';

import '../lib/app_state/app_state.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockFirebaseFirestore extends Mock implements FirebaseFirestore {}

class MockCollectionReference extends Mock implements CollectionReference {}

class MockDatabaseHelper extends Mock implements DatabaseHelper {}

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  group('AppState Tests', () {
    late AppState appState;
    late MockFirebaseAuth mockFirebaseAuth;
    late MockFirebaseFirestore mockFirebaseFirestore;
    late MockDatabaseHelper mockDatabaseHelper;
    late MockSharedPreferences mockSharedPreferences;

    setUp(() {
      mockFirebaseAuth = MockFirebaseAuth();
      mockFirebaseFirestore = MockFirebaseFirestore();
      mockDatabaseHelper = MockDatabaseHelper();
      mockSharedPreferences = MockSharedPreferences();

      appState = AppState();
      appState.notesCollection = MockCollectionReference();
    });

    test('Initialization sets theme correctly', () async {
      when(mockSharedPreferences.getBool(kThemeKeySharedPreferences))
          .thenReturn(true);

      await appState.initialization();

      expect(appState.isDarkTheme, true);
    });

    test('Save note to Firestore', () async {
      final note = NoteModel(
        id: '1',
        noteTitle: 'Title',
        noteContent: 'Content',
        noteLabel: 0,
      );

      appState.saveNote(note);

      verify(appState.notesCollection.doc('${note.id}').set({
        'title': note.noteTitle,
        'content': note.noteContent,
        'label': note.noteLabel
      })).called(1);
    });

    test('Delete note from Firestore', () async {
      final note = NoteModel(
        id: '1',
        noteTitle: 'Title',
        noteContent: 'Content',
        noteLabel: 0,
      );

      appState.deleteNote(note);

      verify(appState.notesCollection.doc('${note.id}').delete()).called(1);
    });
  });
}
