String target = "to be or not to be";
float mutationRate = 0.01;
int totalPopulation = 100;
Population population;
DNA bestDNA;

void setup() {
  size(1200, 600);
  population = new Population(totalPopulation, mutationRate);
  bestDNA = population.getBestDNA();
}

void draw() {
  background(25);

  textSize(50);
  text("Best Phrase:", 40, 100);
  textSize(70);
  text(bestDNA.getPhrase(), 40, 180);

  textSize(30);
  text("Total Generations: " + Integer.toString(population.generations), 40, 450);
  text("Average Fitness: " + String.valueOf(population.getAverageFitness()), 40, 485);
  text("Population Count: " + String.valueOf(totalPopulation), 40, 520);
  text("Mutation Rate: " + String.valueOf(mutationRate) + "%", 40, 555);

  textSize(16);
  text("All Phrases:", width - 200, 40);
  for (int i = 0; i < population.population.length; i++) {
    text(population.population[i].getPhrase(), width - 200, i * 30 + 66);
  }

  population.cyclePopulation();
  if ((frameCount % 30) == 0) {
    bestDNA = population.getBestDNA();
  }
}
