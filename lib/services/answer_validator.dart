// lib/services/answer_validator.dart

bool isCorrectAnswer(String input, List<String> validAnswers) {
  final normalizedInput = input.trim().toLowerCase();
  print('Player input: "$normalizedInput"');

  for (final answer in validAnswers) {
    final normalizedAnswer = answer.trim().toLowerCase();
    print('Comparing to: "$normalizedAnswer"');
    if (normalizedInput == normalizedAnswer) return true;
  }

  return false;
}