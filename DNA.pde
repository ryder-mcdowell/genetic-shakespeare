class DNA {
  String target = "to be or not to be";
  char[] genes = new char[18];

  DNA() {
    for (int i = 0; i < genes.length; i++) {
      genes[i] = (char) random(32,128);
    }
  }

  float fitness() {
    int score = 0;
    for (int i = 0; i < genes.length; i++) {
      if (genes[i] == target.charAt(i)) {
        ++score;
      }
    }
    return float(score) / target.length();
  }