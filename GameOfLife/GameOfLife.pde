int[][] time = init();
float rate = 5;

void setup() {
  size(1000,700);
}

void draw() {
  smooth();
  frameRate(rate);
  background(0);
  draw_square(time);
  time = dead_or_alive(neighbours(time),time);
}

// Funcion que da condiciones iniciales
int[][] init() {
  return random_init();
}

int[][] random_init() {
  int[][] init = new int [100][70];
  for(int i=0; i<100; i++) {
    for(int j=0; j<70; j++) {
      init[i][j] = (int) Math.round(Math.random());
    }
  }
  return init;
}

void manual_init() {

}

void standard_init() {
  
}

//Funcion que dibuja el cuadrado de 10 pixeles
void draw_square(int[][] x) {
  for(int i=0; i<100; i++) {
    for(int j=0; j<70; j++) {
      if(x[i][j]==1) {
        square(i*10,j*10,10);
      }
    }
  }
}

void keyPressed() {
  if (key == ' ') {
    noLoop();
  } else if (key == ENTER) {
    loop();
  } else if (key == CODED) {
    if (keyCode == UP) {
      if (rate >= 10.0) {
        rate = 10;
      } 
      else {
        rate += 0.5;
        println(rate);
      }
    } 
    else if (keyCode == DOWN) {
      if (rate <= 0.5) {
        rate = 0.5;
      } 
      else {
        rate -= 0.5;
        println(rate);
      }
    }
  }
  
}

void frame_speed(int x) {
  frameRate(x);
}

//Funcion que determina si vive o muere (x = Estadp)
int[][] dead_or_alive(int[][] count, int[][] x) {
  int[][] doa = new int [100][70];
  for(int i=0; i<100; i++){
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
  int[][] count = new int [100][70];
  for(int i=0; i<100; i++){
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
      if(i==99) {
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
      if(j==0 && i!=0 && i!=99) {
        if(x[i-1][j]==1) count[i][j] +=1;
        if(x[i-1][j+1]==1) count[i][j] +=1;
        if(x[i][j+1]==1) count[i][j] +=1;
        if(x[i+1][j+1]==1) count[i][j] +=1;
        if(x[i+1][j]==1) count[i][j] +=1;
      }
      if(j==69 && i!=0 && i!=99) {
        if(x[i-1][j]==1) count[i][j] +=1;
        if(x[i-1][j-1]==1) count[i][j] +=1;
        if(x[i][j-1]==1) count[i][j] +=1;
        if(x[i+1][j-1]==1) count[i][j] +=1;
        if(x[i+1][j]==1) count[i][j] +=1;
      }
      if(i!=0 && i!=99 && j!=0 && j!=69) {
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
