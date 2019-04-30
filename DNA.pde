class DNA {
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

  DNA crossover(DNA partner) {
    DNA child = new DNA();
    
    int coinFace;
    for (int i = 0; i < genes.length; i++) {
      coinFace = int(random(2));
      if (coinFace == 0) child.genes[i] = genes[i];
      else child.genes[i] = partner.genes[i];
    }

    return child;
  }

  void mutate() {
    for (int i = 0; i < genes.length; i++) {
      if (random(1) < mutationRate) {
        genes[i] = (char)random(32,128);
      }
    }
  }
}