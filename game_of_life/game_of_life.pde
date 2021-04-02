int[][] time = init();

void setup() {
  size(1400,700);
  smooth();
  frameRate(1);
}

void draw() {
  background(0);
  draw_square(time);
  time = dead_or_alive(neighbours(time),time);
}

// Funcion que da condiciones iniciales
int[][] init() {
  int[][] init = new int [140][70];
  for(int i=0; i<140; i++) {
    for(int j=0; j<70; j++) {
      init[i][j] = (int) Math.round(Math.random());
    }
  }
  return init;
}

//Funcion que dibuja el cuadrado de 10 pixeles
void draw_square(int[][] x) {
  for(int i=0; i<140; i++) {
    for(int j=0; j<70; j++) {
      if(x[i][j]==1) {
        square(i*10,j*10,10);
      }
    }
  }
}

//Funcion que determina si vive o muere (x = Estadp)
int[][] dead_or_alive(int[][] count, int[][] x) {
  int[][] doa = new int [140][70];
  for(int i=0; i<140; i++){
    for(int j=0; j<70; j++) {
      if(x[i][j]==0) {
        if(count[i][j]==3) doa[i][j] = 1;
        else doa[i][j] = 0;
      }
      if(x[i][j]==1) {
        if(count[i][j]==2 || count[i][j]==3) doa[i][j] = 1;
        else doa[i][j] = 0;
      }
    }
  }
  return doa;
}

//Funcion que cuenta el numero de vecinos vivos (x = Estado)
int[][] neighbours(int[][] x) {
  int[][] count = new int [140][70];
  for(int i=0; i<140; i++){
    for(int j=0; j<70; j++) {
      if(i==0) {
        if(j==0) {
          if(x[i][j+1]==1) count[i][j] +=1;
          if(x[i+1][j]==1) count[i][j] +=1;
          if(x[i+1][j+1]==1) count[i][j] +=1;
        }
        else if(j==69) {
          if(x[i][j-1]==1) count[i][j] +=1;
          if(x[i+1][j-1]==1) count[i][j] +=1;
          if(x[i+1][j]==1) count[i][j] +=1;
        }
        else {
          if(x[i][j-1]==1) count[i][j] +=1;
          if(x[i+1][j-1]==1) count[i][j] +=1;
          if(x[i+1][j]==1) count[i][j] +=1;
          if(x[i+1][j+1]==1) count[i][j] +=1;
          if(x[i][j+1]==1) count[i][j] +=1;
        }
      }
      if(i==139) {
        if(j==0) {
          if(x[i-1][j]==1) count[i][j] +=1;
          if(x[i-1][j+1]==1) count[i][j] +=1;
          if(x[i][j+1]==1) count[i][j] +=1;
        }
        else if(j==69) {
          if(x[i][j-1]==1) count[i][j] +=1;
          if(x[i-1][j]==1) count[i][j] +=1;
          if(x[i-1][j-1]==1) count[i][j] +=1;
        }
        else {
          if(x[i][j-1]==1) count[i][j] +=1;
          if(x[i-1][j-1]==1) count[i][j] +=1;
          if(x[i-1][j]==1) count[i][j] +=1;
          if(x[i-1][j+1]==1) count[i][j] +=1;
          if(x[i][j+1]==1) count[i][j] +=1;
        }
      }
      if(j==0 && i!=0 && i!=139) {
        if(x[i-1][j]==1) count[i][j] +=1;
        if(x[i-1][j+1]==1) count[i][j] +=1;
        if(x[i][j+1]==1) count[i][j] +=1;
        if(x[i+1][j+1]==1) count[i][j] +=1;
        if(x[i+1][j]==1) count[i][j] +=1;
      }
      if(j==69 && i!=0 && i!=139) {
        if(x[i-1][j]==1) count[i][j] +=1;
        if(x[i-1][j-1]==1) count[i][j] +=1;
        if(x[i][j-1]==1) count[i][j] +=1;
        if(x[i+1][j-1]==1) count[i][j] +=1;
        if(x[i+1][j]==1) count[i][j] +=1;
      }
      if(i!=0 && i!=139 && j!=0 && j!=69) {
        if(x[i-1][j-1]==1) count[i][j] +=1;
        if(x[i][j-1]==1) count[i][j] +=1;
        if(x[i+1][j-1]==1) count[i][j] +=1;
        if(x[i+1][j]==1) count[i][j] +=1;
        if(x[i+1][j+1]==1) count[i][j] +=1;
        if(x[i][j+1]==1) count[i][j] +=1;
        if(x[i-1][j+1]==1) count[i][j] +=1;
        if(x[i-1][j]==1) count[i][j] +=1;
      }
    }
  }
  return count;
}
