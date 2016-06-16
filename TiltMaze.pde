boolean [][] maze;
int xInd,yInd;
int xIni,yIni;
float xpel,ypel; //pelota iniciales y finales
int xFin,yFin;// meta
int l;
float size,mSize;
float vel;
int cont;
int dir=0; //0 stop, 1 up, 2 left, 3 down, 4 right
int steps=0;
float mazeX,mazeY;
float xPro=.9;
float level;

Ball ball;
Levels lev;
void setup() {
  size(450, 750);
  //crear maze
  
  lev=new Levels();
  updateLevel();
  cont=0;
}

void draw() {
  background(176,176,204); //0xb0b0cc
  //painting the grid
  for (int y = 0; y < l; y++) {
    for (int x = 0; x < l; x++) {
      pushMatrix();
      //translate((x*size),(y*size));
      square(x,y,size, maze[y][x],mazeX,mazeY); //x horizontal, y vertical
      popMatrix();
    }
  }
  if(dir!=0){
    cont++;
    if(cont<=steps*size/vel){
      ball.isMoving=true;
      switch(dir){
        case 1:
        deslizarY(false);
        break;
        case 2:
        deslizarX(false);
        break;
        case 3:
        deslizarY(true);
        break;
        case 4:
        deslizarX(true);
        break;
        default:
        break;
      }
    }else{      //stopped moving
      dir=0;
      ball.isMoving=false;
      //System.out.println("stop");
      if(xInd==xFin&&yInd==yFin){
        lev.nextLevel();
        updateLevel();
      }
      //verify if it has won
    }
  }
  updatePelota();
  printMenu((height-mSize)*.4, (height-mSize)*.2);
}

void deslizarX(boolean t){
  xpel+=(t?vel:-vel);
}
void deslizarY(boolean t){
  ypel+=(t?vel:-vel);
}
void updatePelota(){  
  ball.setX(xpel);
  ball.setY(ypel);
  ball.paint();
}
void updateLevel(){
  maze = lev.getMaze();
  xIni=xInd=lev.getXInd();
  yIni=yInd=lev.getYInd();
  xFin=lev.getXFin();
  yFin=lev.getYFin();
  level = lev.getLevel();
   l=maze.length;
   if(width<height){
     mazeX=width*(1-xPro)/2;
     size=(width*xPro)/l;
     mSize=width*xPro;
     mazeY=(height-mSize)*.6;
   }else{
     mazeY=height*(1-xPro)/2;
     mazeX=(width-(height*xPro))/2;
     size=(height*xPro)/l;
     mSize=width*xPro;
   }
  printMenu((height-mSize)*.4, (height-mSize)*.2);
  xpel=xInd*size+size/2+mazeX;
  ypel=yInd*size+size/2+mazeY;
  vel=size/10;
  ball=new Ball(size*.8,xpel+mazeX,ypel+mazeY);
}
void printMenu(float but, float info){
  //buttons
  float p=1.0/6.0;
  float pr=.8;
  float butY=height-but;
  float rad=but*pr>width*2*p?width*2*p:but*pr;
  fill(100,230,100);
  ellipse(width*p,butY+but/2,rad*pr,rad*pr); //back level
  ellipse(width*5*p,butY+but/2,rad*pr,rad*pr); //next level
  ellipse(width*3*p,butY+but/2,rad,rad);  //retry
  //info
  float infoY=(height-mSize)*.4;
  textSize(info);
  fill(0, 102, 153);
  String s="level: "+lev.getLevel();
  text(s, width/2-2*info,infoY+info ); 
  //text("I",width/2,infoY+info);
  
}
void keyPressed(){
  if(ball.isMoving) return;
  switch(keyCode){
    case UP:
    dir=1;
    steps=moving(dir);
    yInd-=steps;
    break;
    case LEFT:
    dir=2;
    steps=moving(dir);
    xInd-=steps;
    break;
    case DOWN:
    dir=3;
    steps=moving(dir);
    yInd+=steps;
    break;
    case RIGHT:
    dir=4;
    steps=moving(dir);
    xInd+=steps;
    break;
    default:
    break;
  }
  cont=0;
}
int moving(int dir){
  int n=0,xTemp,yTemp;
  switch(dir){
    case 1:
    yTemp=yInd-1;
    while(yTemp>=0&&!maze[yTemp][xInd]){
       yTemp--;
       n++;
    }
    break;
    case 2:
    xTemp=xInd-1;
    while(xTemp>=0&&!maze[yInd][xTemp]){
       xTemp--;
       n++;
    }
    break;
    case 3:
    yTemp=yInd+1;
    while(yTemp<maze.length&&!maze[yTemp][xInd]){
       yTemp++;
       n++;
    }
    break;
    case 4:
    xTemp=xInd+1;
    while(xTemp<maze.length&&!maze[yInd][xTemp]){
       xTemp++;
       n++;
    }
    break;
    default:
    break;
  }
  System.out.println(n);
  return n;
}
void square(float x, float y, float side, boolean t,float mazeX, float mazeY) {
  float sx=side*x+mazeX;
  float sy=side*y+mazeY;
  beginShape();
  vertex(sx, sy);
  vertex(sx+side, sy);
  vertex(sx+side, sy+side);
  vertex(sx, sy+side);
  int col= t?0:230;
  stroke(col,col,col);
  fill(col,col,col);
  if(x==xIni&&y==yIni) fill(0,255,0);
  if(x==xFin&&y==yFin) fill(255,0,0);
  endShape(CLOSE);
}


