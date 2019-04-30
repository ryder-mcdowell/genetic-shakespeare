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

  text(bestDNA.getPhrase(), 10, 10);
  text(Integer.toString(population.generations), 10, 20);
  text(String.valueOf(population.getAverageFitness()), 10, 30);
  text(String.valueOf(totalPopulation), 10, 40);
  text(String.valueOf(mutationRate), 10, 50);

  population.cyclePopulation();
  if ((frameCount % 30) == 0) {
    bestDNA = population.getBestDNA();
  }
}
