
import java.util.Scanner;

public class Levels{
  private boolean[][] maze;
  private int level;
  private int xInd,yInd;
  private int xFin,yFin;
  private int min;
  
  public Levels(){
    level=0;
    updateAll(level);
  }
  private void updateAll(int level){
    updateMaze(level);
    updateInds(level);
  }
  public void nextLevel(){
    level++;
    updateAll(level);
  }
  public void backLevel(){
    if(level<=0)level=0;
    updateAll(level);
  }
  public boolean[][] getMaze(){
    return maze;
  }
  public int getXInd(){
    return xInd;
  }
  public int getYInd(){
    return yInd;
  }
  public int getXFin(){
    return xFin;
  }
  public int getYFin(){
    return yFin;
  }
  public int getLevel(){
    return level;
  }
  public int getLMin(){
    return min;
  }
  
  private void updateMaze(int level){
    switch(level){
      case 0:
        maze = new boolean[][]{
        {false,false,true},
        {true,false,false},
        {true,false,false}};
        xInd=0;
        yInd=0;
        xFin=1;
        yFin=1;
      break;
      case 1:
        //maze= new boolean[6][6];
        //maze[0][3]=maze[1][2]=maze[1][3]=maze[2][3]=maze[3][0]=maze[4][1]=maze[4][3]=maze[4][4]=maze[4][5]=true; //true es hay cosa
        maze = new boolean[][] {
        {false,false,false,true,false,false},
        {false,false,true,true,false,false},
        {false,false,false,true,false,true},
        {true,false,false,false,false,false},
        {false,true,false,false,true,true},
        {false,false,false,false,false,false}};
        xInd=1;
        yInd=0;
        xFin=5;
        yFin=5;
        
      break;
      case 2:
        //maze= new boolean[6][6];
        //maze[0][1]=maze[1][4]=maze[3][5]=maze[4][2]=maze[5][5]=true;
        maze=new boolean[][]{
        {false,true,false,false,false,false},
        {false,false,false,false,true,false},
        {false,false,false,false,false,false},
        {false,false,false,false,false,true},
        {false,false,true,false,false,false},
        {false,false,false,false,false,true}};
        xInd=0;
        yInd=0;
        xFin=4;
        yFin=3;
      break;
      case 3:
        //maze= new boolean[6][6];
        //maze[0][1]=maze[1][4]=maze[3][5]=maze[4][2]=maze[5][5]=true;
        maze=new boolean[][]{
        {false,true,false,false,false,false},
        {false,false,false,false,true,false},
        {false,false,false,false,false,false},
        {false,false,false,false,false,true},
        {false,false,true,false,false,false},
        {false,false,false,false,false,true}};
        xInd=0;
        yInd=0;
        xFin=0;
        yFin=2;
      break;
      case 4:
        maze=new boolean[][]{
        {false,false,false,false},
        {false,true,false,false},
        {false,false,false,true},
        {true,false,false,false}};
        xInd=0;
        yInd=0;
        xFin=1;
        yFin=2;
      break;
      case 5:
        maze=new boolean[][]{
        {false,false,true,false},
        {false,false,false,false},
        {false,true,false,false},
        {false,false,false,true}};
        xInd=0;
        yInd=0;
        xFin=2;
        yFin=2;
      break;
      case 6:
        maze=new boolean[][]{
        {false,false,false,false,true},
        {false,false,false,true,false},
        {false,true,false,false,true},
        {false,true,true,false,false},
        {false,false,false,false,true}};
        xInd=0;
        yInd=0;
        xFin=2;
        yFin=0;
      break;
      case 7:
        maze=new boolean[][]{
        {true,false,true,false,true},
        {false,false,false,false,false},
        {false,false,false,true,false},
        {true,false,false,false,false},
        {false,false,false,true,true}};
        xInd=0;
        yInd=2;
        xFin=1;
        yFin=0;
      break;
      case 8:
        maze =new boolean[20][20];
        xInd=0;
        yInd=0;
        xFin=1;
        yFin=0;
        break;
      default:
        maze= new boolean[2][2];
        xInd=0;
        yInd=0;
        xFin=1;
        yFin=1;
    }
  }
  private void updateInds(int level){
    switch(level){
       case 0:
       
        break;
      case 1:
        
      break;
      case 2:
        
      break;
      case 3:
       
      break;
      default:
     
    }
  }
}
