class Population {
  DNA[] population;
  int generations;

  Population(int totalPopulation, float mutationRate) {
    population = new DNA[totalPopulation];

    for (int i = 0; i < population.length; i++) {
      population[i] = new DNA(mutationRate);
    }
  }

  void cyclePopulation() {
    ArrayList<DNA> matingPool = new ArrayList<DNA>();

    for (DNA dna : population) {
      int n = int(dna.fitness() * 100);
      for (int j = 0; j < n; j++) {
        matingPool.add(dna);
      }
    }

    for (int i = 0; i < population.length; i++) {
      int parentAIndex = int(random(matingPool.size() - 1));

      ArrayList<Integer> parentBPossibleIndices = new ArrayList<Integer>(); 
      parentBPossibleIndices.add(int(random(parentAIndex)));
      parentBPossibleIndices.add(int(random(parentAIndex + 1, matingPool.size())));
      int parentBIndex = parentBPossibleIndices.get(int(random(0, parentBPossibleIndices.size())));

      DNA parentA = matingPool.get(parentAIndex);
      DNA parentB = matingPool.get(parentBIndex);

      DNA child = parentA.crossover(parentB);
      child.mutate();

      population[i] = child;
    }
    ++generations;
  }

  DNA getBestDNA() {
    DNA bestDNA = population[0];
    for (DNA dna : population) {
      if (dna.fitness() > bestDNA.fitness()) {
        bestDNA = dna;
      }
    }
    return bestDNA;
  }
}