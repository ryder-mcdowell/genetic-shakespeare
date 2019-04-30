String target = "to be or not to be";
float mutationRate = 0.01;
int totalPopulation = 100;
Population population;
DNA bestDNA;

void setup() {
  size(800, 800);
  population = new Population(totalPopulation, mutationRate);
  bestDNA = population.getBestDNA();
}

void draw() {
  background(25);
  population.cyclePopulation();
  if ((frameCount % 30) == 0) {
    bestDNA = population.getBestDNA();
  }
  text(bestDNA.getPhrase(), 10, 10);
  text(Integer.toString(population.generations), 10, 20);
  text(String.valueOf(population.getAverageFitness()), 10, 30);
}
