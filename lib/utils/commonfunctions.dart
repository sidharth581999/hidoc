String formatLabelledMultilineText(String label, String? value) {
  if (value == null || value.trim().isEmpty) return '';

  final items = value.split(',').map((e) => e.trim()).toList();

  return items.asMap().entries.map((entry) {
    final index = entry.key;
    final name = entry.value;
    return index == 0 ? '$label: $name' : '        $name';
  }).join('\n');
}
