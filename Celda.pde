class Celda {
  boolean muroArriba;
  boolean muroDerecho;
  boolean visitado;
  
  Celda(){
    muroArriba = true;
    muroDerecho = true;
    visitado = false;
  }
  
  void dibuja() {
    if(muroArriba) {
      line(0,0,15,0);
    }
    
    if(muroDerecho) {
      line(15,0,15,15);
    }
  }
}
