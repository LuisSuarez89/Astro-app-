import 'package:flutter/material.dart';

import '../data/horoscope_repository.dart';
import '../models/horoscope_result.dart';
import '../widgets/cosmic_background.dart';
import '../utils/zodiac_utils.dart';
import 'horoscope_result_screen.dart';

class HoroscopeFormScreen extends StatefulWidget {
  const HoroscopeFormScreen({super.key});

  @override
  State<HoroscopeFormScreen> createState() => _HoroscopeFormScreenState();
}

class _HoroscopeFormScreenState extends State<HoroscopeFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _cityController = TextEditingController();
  final _focusController = TextEditingController();
  final HoroscopeRepository _repository = HoroscopeRepository();

  DateTime? _selectedDate;
  bool _loading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _cityController.dispose();
    _focusController.dispose();
    super.dispose();
  }

  Future<void> _pickBirthDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(now.year - 25),
      firstDate: DateTime(1900),
      lastDate: now,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  surface: const Color(0xFF16082C),
                ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate() || _selectedDate == null) {
      if (_selectedDate == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Selecciona tu fecha de nacimiento.')),
        );
      }
      return;
    }

    setState(() => _loading = true);
    final entry = await _repository.pickEntry();
    final result = HoroscopeResult(
      name: _nameController.text.trim(),
      sign: getZodiacSign(_selectedDate!),
      birthDate: _selectedDate!,
      focus: _focusController.text.trim(),
      prediction: entry.quatrain,
    );

    if (!mounted) return;

    setState(() => _loading = false);
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => HoroscopeResultScreen(result: result),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CosmicBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.06),
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.08),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Astro App',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          'Descubre el signo que rige tu día y recibe una cuarteta inspirada por los astros.',
                          style: TextStyle(fontSize: 16, color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 28),
                  const Text('Nombre'),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _nameController,
                    validator: (value) => value == null || value.trim().isEmpty
                        ? 'Ingresa tu nombre.'
                        : null,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 18),
                  const Text('Ciudad o lugar de energía'),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _cityController,
                    validator: (value) => value == null || value.trim().isEmpty
                        ? 'Ingresa tu ciudad.'
                        : null,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 18),
                  const Text('Fecha de nacimiento'),
                  const SizedBox(height: 8),
                  InkWell(
                    onTap: _pickBirthDate,
                    borderRadius: BorderRadius.circular(18),
                    child: Ink(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 18,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.06),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.08),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.auto_awesome_outlined),
                          const SizedBox(width: 12),
                          Text(
                            _selectedDate == null
                                ? 'Seleccionar fecha'
                                : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  const Text('Intención para hoy'),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _focusController,
                    validator: (value) => value == null || value.trim().isEmpty
                        ? 'Cuéntanos en qué deseas enfocarte.'
                        : null,
                    maxLines: 3,
                  ),
                  const SizedBox(height: 28),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: _loading ? null : _submit,
                      icon: _loading
                          ? const SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Icon(Icons.travel_explore),
                      label: Text(_loading ? 'Consultando...' : 'Consultar horóscopo'),
                      style: FilledButton.styleFrom(
                        backgroundColor: const Color(0xFF9C6BFF),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    'Espacio reservado para banner publicitario futuro.',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.5),
                      fontSize: 12,
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
}
