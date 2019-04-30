String target = "to be or not to be";
float mutationRate = 0.01;
int totalPopulation = 100;

DNA[] population;
ArrayList<DNA> matingPool = new ArrayList<DNA>();

void setup() {
  size(800, 800);

  population = new DNA[totalPopulation];
  for (int i = 0; i < population.length; i++) {
    population[i] = new DNA();
  }

  for (DNA dna : population) {
    int n = int(dna.fitness() * 100);
    for (int j = 0; j < n; j++) {
      matingPool.add(dna);
    }
  }

  int parentAIndex = int(random(matingPool.size()));

  ArrayList<Integer> parentBPossibleIndices = new ArrayList<Integer>(); 
  parentBPossibleIndices.add(int(random(parentAIndex)));
  parentBPossibleIndices.add(int(random(parentAIndex + 1, matingPool.size())));
  int parentBIndex = parentBPossibleIndices.get(int(random(0, parentBPossibleIndices.size())));

  DNA parentA = matingPool.get(parentAIndex);
  DNA parentB = matingPool.get(parentBIndex);

  println(parentA.fitness());
  println(parentB.fitness());

  println("------");
  for (char gene : parentA.genes) {
    print(gene);
  }
  println("");
  for (char gene : parentB.genes) {
    print(gene);
  }
  println("");
  DNA child = parentA.crossover(parentB);
  for (char gene : child.genes) {
    print(gene);
  }
  println("");
  child.mutate();
  for (char gene : child.genes) {
    print(gene);
  }
  println("");
}

void draw() {
  background(25);
  if ((frameCount % 1000) == 0) {
    //do work
  }
}
