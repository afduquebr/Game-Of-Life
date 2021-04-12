int[][] time = new int [100][70];
float rate = 5;

void setup() {
  size(1000,700);
}

void draw() {
  smooth();
  frameRate(rate);
  background(0);
  //grid();
  keyPressed();
  mousePressed();
}

//Funcion que inicializa de forma aleatoria el juego
int[][] random_init() {
  int[][] init = new int [100][70];
  for(int i=0; i<100; i++) {
    for(int j=0; j<70; j++) {
      init[i][j] = (int) Math.round(Math.random());
    }
  }
  return init;
}

//Funcion que recibe la informacion del mouse
void mousePressed() {
  key = ' ';
  if(mousePressed == true) {
    if(time[mouseX/10][mouseY/10]==0) {
      time[mouseX/10][mouseY/10] = 1;
    } 
    else if(time[mouseX/10][mouseY/10]==1) {
      time[mouseX/10][mouseY/10] = 0;
    } 
  }
}

//Funcion que recibe la informacion del teclado
void keyPressed() {
  if (key == ' ') {
    draw_square(time);
  } 
  else {
    
    draw_square(time);
    time = dead_or_alive(neighbours(time),time);
  }
  if (key == '1') {
     time = random_init();
   }
   else if (key == '2') {
     time = standard_init();
   }
   else if (key == 8) {
     time = new int [100][70];
  } 
  else if (key == CODED) {
    if (keyCode == UP) {
      if (rate >= 10.0) {
        rate = 10;
      } 
      else {
        rate += 0.5;
      }
    } 
    else if (keyCode == DOWN) {
      if (rate <= 0.5) {
        rate = 0.5;
      } 
      else {
        rate -= 0.5;
      }
    }
  }
}

//Funcion que asigna un valor a la velocidad del Loop
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
      else if(x[i][j]==1) {
        if(count[i][j]==2 || count[i][j]==3) doa[i][j] = 1;
        else doa[i][j] = 0;
      }
    }
  }
  return doa;
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

//Funcion que dibuja la cuadricula
void grid() {
  for (int i=1; i<100; i++) {
    stroke(245,255,250);
    line(i*10,0,i*10,700);
  }
  for (int j=1; j<70; j++) {
    stroke(245,255,250);
    line(0,j*10,1000,j*10);
  }
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
      else if (i==99) {
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
      else {
        if(j==0) {
          if(x[i-1][j]==1) count[i][j] +=1;
          if(x[i-1][j+1]==1) count[i][j] +=1;
          if(x[i][j+1]==1) count[i][j] +=1;
          if(x[i+1][j+1]==1) count[i][j] +=1;
          if(x[i+1][j]==1) count[i][j] +=1;
        }
        else if(j==69) {
          if(x[i-1][j]==1) count[i][j] +=1;
          if(x[i-1][j-1]==1) count[i][j] +=1;
          if(x[i][j-1]==1) count[i][j] +=1;
          if(x[i+1][j-1]==1) count[i][j] +=1;
          if(x[i+1][j]==1) count[i][j] +=1;
        }
        else  {
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
  }
  return count;
}

// Funcion que origina los patrones predeterminados
int[][] standard_init() {
  int[][] init = new int [100][70];
  
  // Planeador de Gosper
  init[10][18] = 1;
  init[10][19] = 1;
  init[11][18] = 1;
  init[11][19] = 1;
  init[20][18] = 1;
  init[20][19] = 1;
  init[20][20] = 1;
  init[21][17] = 1;
  init[21][21] = 1;
  init[22][16] = 1;
  init[22][22] = 1;
  init[23][16] = 1;
  init[23][22] = 1;
  init[24][19] = 1;
  init[25][17] = 1;
  init[25][21] = 1;
  init[26][18] = 1;
  init[26][19] = 1;
  init[26][20] = 1;
  init[27][19] = 1;
  init[30][16] = 1;
  init[30][17] = 1;
  init[30][18] = 1;
  init[31][16] = 1;
  init[31][17] = 1;
  init[31][18] = 1;
  init[32][15] = 1;
  init[32][19] = 1;
  init[34][14] = 1;
  init[34][15] = 1;
  init[34][19] = 1;
  init[34][20] = 1;
  init[44][16] = 1;
  init[44][17] = 1;
  init[45][16] = 1;
  init[45][17] = 1;
  
  //Naves Espaciales
  init[10][6] = 1;
  init[10][8] = 1;
  init[11][9] = 1;
  init[12][5] = 1;
  init[12][9] = 1;
  init[13][5] = 1;
  init[13][9] = 1;
  init[14][9] = 1;
  init[15][6] = 1;
  init[15][9] = 1;
  init[16][7] = 1;
  init[16][8] = 1;
  init[16][9] = 1;
  
  //Osciladores
  init[10][42] = 1;
  init[10][43] = 1;
  init[10][44] = 1;
  init[10][48] = 1;
  init[10][49] = 1;
  init[10][50] = 1;
  init[12][40] = 1;
  init[12][45] = 1;
  init[12][47] = 1;
  init[12][52] = 1;
  init[13][40] = 1;
  init[13][45] = 1;
  init[13][47] = 1;
  init[13][52] = 1;
  init[14][40] = 1;
  init[14][45] = 1;
  init[14][47] = 1;
  init[14][52] = 1;
  init[15][42] = 1;
  init[15][43] = 1;
  init[15][44] = 1;
  init[15][48] = 1;
  init[15][49] = 1;
  init[15][50] = 1;
  init[17][42] = 1;
  init[17][43] = 1;
  init[17][44] = 1;
  init[17][48] = 1;
  init[17][49] = 1;
  init[17][50] = 1;
  init[18][40] = 1;
  init[18][45] = 1;
  init[18][47] = 1;
  init[18][52] = 1;
  init[19][40] = 1;
  init[19][45] = 1;
  init[19][47] = 1;
  init[19][52] = 1;
  init[20][40] = 1;
  init[20][45] = 1;
  init[20][47] = 1;
  init[20][52] = 1;
  init[22][42] = 1;
  init[22][43] = 1;
  init[22][44] = 1;
  init[22][48] = 1;
  init[22][49] = 1;
  init[22][50] = 1;
  
  init[30][52] = 1;
  init[30][55] = 1;
  init[31][52] = 1;
  init[31][55] = 1;
  init[32][50] = 1;
  init[32][51] = 1;
  init[32][53] = 1;
  init[32][54] = 1;
  init[32][56] = 1;
  init[32][57] = 1;
  init[33][52] = 1;
  init[33][55] = 1;
  init[34][52] = 1;
  init[34][55] = 1;
  init[35][50] = 1;
  init[35][51] = 1;
  init[35][53] = 1;
  init[35][54] = 1;
  init[35][56] = 1;
  init[35][57] = 1;
  init[36][52] = 1;
  init[36][55] = 1;
  init[37][52] = 1;
  init[37][55] = 1;
  
  init[70][31] = 1;
  init[70][33] = 1;
  init[70][34] = 1;
  init[70][36] = 1;
  init[70][37] = 1;
  init[71][30] = 1;
  init[71][31] = 1;
  init[71][33] = 1;
  init[71][34] = 1;
  init[71][37] = 1;
  init[71][38] = 1;
  init[72][30] = 1;
  init[73][37] = 1;
  init[73][38] = 1;
  init[74][30] = 1;
  init[74][31] = 1;
  init[74][37] = 1;
  init[74][38] = 1;
  init[75][30] = 1;
  init[75][31] = 1;
  init[76][38] = 1;
  init[77][30] = 1;
  init[77][31] = 1;
  init[77][34] = 1;
  init[77][35] = 1;
  init[77][37] = 1;
  init[77][38] = 1;
  init[78][31] = 1;
  init[78][32] = 1;
  init[78][34] = 1;
  init[78][35] = 1;
  init[78][37] = 1;
  
  init[60][17] = 1;
  init[61][16] = 1;
  init[61][18] = 1;
  init[64][16] = 1;
  init[64][17] = 1;
  init[64][18] = 1;
  init[65][16] = 1;
  init[65][17] = 1;
  init[65][18] = 1;
  init[66][17] = 1;
  init[69][17] = 1;
  init[70][16] = 1;
  init[70][17] = 1;
  init[70][18] = 1;
  init[71][16] = 1;
  init[71][17] = 1;
  init[71][18] = 1;
  init[74][16] = 1;
  init[74][18] = 1;
  init[75][17] = 1;
  
  init[80][52] = 1;
  init[80][55] = 1;
  init[81][52] = 1;
  init[81][55] = 1;
  init[82][50] = 1;
  init[82][51] = 1;
  init[82][53] = 1;
  init[82][54] = 1;
  init[82][56] = 1;
  init[82][57] = 1;
  init[83][52] = 1;
  init[83][55] = 1;
  init[84][52] = 1;
  init[84][55] = 1;
  init[85][50] = 1;
  init[85][51] = 1;
  init[85][53] = 1;
  init[85][54] = 1;
  init[85][56] = 1;
  init[85][57] = 1;
  init[86][52] = 1;
  init[86][55] = 1;
  init[87][52] = 1;
  init[87][55] = 1;
  
  return init;
}
