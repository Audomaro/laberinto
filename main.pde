// https://www.youtube.com/watch?v=RhZ8f0cZRbk

Laberinto maze;

void setup()
{
  maze = new Laberinto(30,30);
  
  size(600,600);
    translate(50,50);
  background(255);
  
  maze.mueve(0,0,0,0);
  
  maze.dibuja();
}
