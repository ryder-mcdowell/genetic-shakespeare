DNA[] population = new DNA[100];

void setup() {
  size(800, 800);
  for (int i = 0; i < population.length; i++) {
    population[i] = new DNA();
  }
  // for (DNA d : population) {
  //   for (char c : d.genes) {
  //     print(c);
  //   }
  // }
  for (DNA dna : population) {
    dna.fitness();
    print(dna.fitness);
  }
}

void draw() {
  background(25);
  if ((frameCount % 1000) == 0) {
    //do work
  }
}
