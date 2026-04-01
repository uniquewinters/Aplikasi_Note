import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const PersonaNoteApp());
}

class PersonaNoteApp extends StatelessWidget {
  const PersonaNoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PERSONA NOTES',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        primaryColor: const Color(0xFFD80000),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontStyle: FontStyle.italic,
            fontSize: 28,
          ),
          bodyMedium: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
        ),
      ),
      home: const NoteScreen(),
    );
  }
}

class Note {
  final String title;
  final String body;
  Note(this.title, this.body);
}

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final List<Note> _notes = [];
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  void _saveNote() {
    if (_titleController.text.isNotEmpty && _bodyController.text.isNotEmpty) {
      setState(() {
        _notes.add(Note(_titleController.text, _bodyController.text));
        _titleController.clear();
        _bodyController.clear();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('TAKE YOUR TIME... Saved!'),
          backgroundColor: Color(0xFFD80000),
          duration: Duration(seconds: 1),
        ),
      );
    }
  }

  void _showNoteDetails(Note note) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Close',
      pageBuilder: (context, anim1, anim2) => Center(
        child: Transform.rotate(
          angle: -0.05,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.85,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 4),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFD80000).withOpacity(0.5),
                  offset: const Offset(10, 10),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Transform.rotate(
                    angle: 0.05,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      color: Colors.black,
                      child: const Text(
                        'DATA REPORT',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    note.title.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    note.body,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                        color: const Color(0xFFD80000),
                        child: const Text(
                          'CONFIRM',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Red Stripe
          Positioned(
            top: -50,
            right: -80,
            child: Transform.rotate(
              angle: 1.2,
              child: Container(
                width: 200,
                height: 1000,
                color: const Color(0xFFD80000).withOpacity(0.6),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  // P5 Header Style
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        color: const Color(0xFFD80000),
                        child: const Text(
                          'APLIKASI',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 18),
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        'NOTE',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900, fontSize: 32, fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                  const Text(
                    'Simpan idemu disini',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  const SizedBox(height: 25),
                  
                  // P5 Input Decoration
                  Transform.rotate(
                    angle: -0.015,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(color: Colors.white, width: 3),
                        boxShadow: const [
                          BoxShadow(color: Color(0xFFD80000), offset: Offset(8, 8)),
                        ],
                      ),
                      child: Column(
                        children: [
                          _p5TextField(_titleController, 'Masukan title', isBold: true),
                          const SizedBox(height: 12),
                          _p5TextField(_bodyController, 'Masukan content', maxLines: 2),
                          const SizedBox(height: 20),
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: _saveNote,
                              child: Transform.rotate(
                                angle: 0.05,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(color: Color(0xFFD80000), offset: Offset(5, 5)),
                                    ],
                                  ),
                                  child: const Text(
                                    'SAVE IT!',
                                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900, letterSpacing: 2),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  
                  const Text(
                    'Data yang tersimpan sementara',
                    style: TextStyle(color: Colors.white54, fontWeight: FontWeight.bold, fontSize: 10, letterSpacing: 1),
                  ),
                  const SizedBox(height: 15),
                  
                  // Slanted Note List
                  Expanded(
                    child: _notes.isEmpty
                        ? const Center(
                            child: Text(
                              'BELUM ADA DATA...',
                              style: TextStyle(color: Colors.white24, fontWeight: FontWeight.w900, fontSize: 20, fontStyle: FontStyle.italic),
                            ),
                          )
                        : ListView.builder(
                            itemCount: _notes.length,
                            itemBuilder: (context, index) {
                              final note = _notes[index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: GestureDetector(
                                  onTap: () => _showNoteDetails(note),
                                  child: Transform.rotate(
                                    angle: index % 2 == 0 ? -0.02 : 0.015,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(color: Color(0xFFD80000), offset: Offset(8, 0)),
                                        ],
                                      ),
                                      child: ListTile(
                                        title: Text(
                                          note.title.toUpperCase(),
                                          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w900, fontSize: 18),
                                        ),
                                        subtitle: Text(
                                          note.body,
                                          style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        trailing: const Icon(Icons.arrow_right_alt, color: Colors.black, size: 30),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _p5TextField(TextEditingController controller, String hint, {int maxLines = 1, bool isBold = false}) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: TextStyle(color: Colors.white, fontWeight: isBold ? FontWeight.w900 : FontWeight.bold),
      decoration: InputDecoration(
        hintText: hint.toUpperCase(),
        hintStyle: const TextStyle(color: Colors.white30, fontWeight: FontWeight.w900),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white24)),
        focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFD80000), width: 2)),
      ),
    );
  }
}
