class Laberinto {
  Celda[][] _celdas;
  int _ancho;
  int _alto;
  
  Laberinto(int ancho, int alto) {
    _ancho = ancho;
    _alto = alto;    
    _celdas = new Celda[_ancho][_alto];
    
    for(int i = 0; i < _ancho; i++) 
    {
      for(int j = 0; j < _alto; j++) 
      {
          _celdas[i][j] = new Celda();
      }
    }
  }
  
  void dibuja() {
    stroke(0);
    strokeWeight(5);
    
    for(int i = 0; i < _ancho; i++) 
    {
      for(int j = 0; j < _alto; j++) 
      {
         pushMatrix();
         translate(i*15,j*15);
         _celdas[i][j].dibuja();
         popMatrix();
      }
    }
    
    line(0,0,0,15*_alto);
    line(0,15*_alto,15*_ancho,15*_alto);
  }
  
  boolean mueve(int x, int y, int prevX, int prevY) {
    if(
      x < 0 || 
      x >= _ancho || 
      y < 0 || 
      y >= _alto ||
      _celdas[x][y].visitado == true
    ) {
      return false;
    } else {
      _celdas[x][y].visitado = true;
     
     if(x > prevX) _celdas[prevX][prevY].muroDerecho = false;
     if(x < prevX) _celdas[x][y].muroDerecho = false;
     if(y < prevY) _celdas[prevX][prevY].muroArriba = false;
     if(y > prevY) _celdas[x][y].muroArriba = false;
     
     Vector[] direcciones = new Vector[4];
     direcciones[0] = new Vector(0,-1);
     direcciones[1] = new Vector(1,0);
     direcciones[2] = new Vector(0,1);
     direcciones[3] = new Vector(-1,0);
     
     int numero = floor(random(3));
     Vector temp = direcciones[numero];
     direcciones[numero] = direcciones[numero+1];
     direcciones[numero+1] = temp;
     
     if(
       mueve(x+direcciones[0]._x,y+direcciones[0]._y, x, y) == false &&
       mueve(x+direcciones[1]._x,y+direcciones[1]._y, x, y) == false &&
       mueve(x+direcciones[2]._x,y+direcciones[2]._y, x, y) == false &&
       mueve(x+direcciones[3]._x,y+direcciones[3]._y, x, y) == false     
     ) {
       return false;
     }
     
     return true; 
    }
  }
  
}
