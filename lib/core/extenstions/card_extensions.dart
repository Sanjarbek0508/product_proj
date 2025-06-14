extension CardMasking on String {
  String get maskedCard {
    if (length < 4) return this;
    return replaceRange(0, length - 4, '*' * (length - 4));
  }
}



// USAGE 
// "1234567812345678".maskedCard // ************5678