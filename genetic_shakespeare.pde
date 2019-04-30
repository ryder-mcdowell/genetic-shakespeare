DNA[] population = new DNA[100];
ArrayList<DNA> matingPool = new ArrayList<DNA>();

void setup() {
  size(800, 800);
  for (int i = 0; i < population.length; i++) {
    population[i] = new DNA();
  }

  for (DNA dna : population) {
    int n = int(dna.fitness() * 100);
    println(dna.fitness());
    println(n);
    for (int j = 0; j < n; j++) {
      matingPool.add(dna);
    }
  }

  int parentAIndex = int(random(matingPool.size()));

  ArrayList<Integer> parentBPossibleIndices = new ArrayList<Integer>(); 
  parentBPossibleIndices.add(int(random(parentAIndex)));
  parentBPossibleIndices.add(int(random(parentAIndex, matingPool.size())));
  int parentBIndex = parentBPossibleIndices.get(int(random(0, parentBPossibleIndices.size())));

  DNA parentA = matingPool.get(parentAIndex);
  DNA parentB = matingPool.get(parentBIndex);

  println("-------");
  println(parentA.fitness());
  println(parentB.fitness());
}

void draw() {
  background(25);
  if ((frameCount % 1000) == 0) {
    //do work
  }
}