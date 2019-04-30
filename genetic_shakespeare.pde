String target = "to be or not to be";
float mutationRate = 0.01;
int totalPopulation = 100;
Population population;

void setup() {
  size(800, 800);
  population = new Population(totalPopulation, mutationRate);
}

void draw() {
  background(25);
  if ((frameCount % 1000) == 0) {
    population.cyclePopulation();
  }
}
