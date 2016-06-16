public class Ball{
  private float size=0;
  float x=0;
  float y=0;
  boolean isMoving=false;
  public Ball(float size){
    this.size=size;
  }
  public Ball(float size, float x,float y){
    this.size=size;
    this.x=x;
    this.y=y;
  }
  public void paint(){
    fill(0,0,230);
    ellipse(x,y,size,size);
  }
  public void setX(float x){
    this.x=x;
  }
  public void setY(float y){
    this.y=y;
  }
}
