PImage bg1;
PImage bg2;
PImage enemy;
PImage fighter;
PImage hp;
PImage treasure;
PImage start1;
PImage start2;
PImage end1;
PImage end2;
boolean up;
boolean down;
boolean left;
boolean right;
final int start = 1;
final int end = 2;
final int gameRun = 3;
int gameState;


void setup () {
  size(640,480) ; 
  bg1 = loadImage("img/bg1.png");
  bg2 = loadImage("img/bg2.png");
  enemy = loadImage("img/enemy.png");
  fighter = loadImage("img/fighter.png");
  hp = loadImage("img/hp.png");
  treasure = loadImage("img/treasure.png");
  start1 = loadImage("img/start1.png");
  start2 = loadImage("img/start2.png");
  end1 = loadImage("img/end1.png");
  end2 = loadImage("img/end2.png");
  gameState = start;
}


  int bgX = 0;
  int bgY = -640;
  float enemyX = -1630;
  float enemyY = 0;
  float trX = random(560);
  float trY = random(420);
  float upDown;
  float leftRight;
  int tmp = 1;
  int speed = 5;
  int blood = 50+18*tmp;

  
void draw(){
  switch(gameState){
    case start:
      leftRight = 0;
      upDown = 0;
      tmp = 1;
      blood = 50+18*tmp;
        image(start2,0,0);
        if(mouseX>200 && mouseX<450 && mouseY>380 && mouseY<420){
          image(start1,0,0);
          if(mousePressed){
            gameState = gameRun;
          }
        }
    break;
    //game start
    case gameRun:
      //background
      image(bg1,bgX++,0);
      image(bg2,bgY++,0);
      while(bgX>640){
        bgX = -640;
      }
      while(bgY>640){
        bgY = -640;
      }    
      //fighter's place
      if(right == true){
        leftRight += speed;
      }
      if(left == true){
        leftRight -= speed;
      }
      if(up == true){
        upDown -= speed;
      }
      if(down == true){
        upDown += speed;
      }
      float meX = 580+leftRight;
      float meY = 240+upDown;
      //fighter's place
      image(fighter,meX,meY);
      //background's extreme line
      if(meX < 10){
        leftRight = -570;
      } 
      if(meX > 600){
        leftRight = 20;
      }
      if(meY < 5){
        upDown = -235;
      }
      if(meY > 420){
        upDown = 180;
      }
      //enemy's place
        enemyX += 5;
       for(int i = 0; i < 350; i += 70){
         image(enemy,1980+enemyX+i,enemyY);
         if(enemyX > 640){
           enemyX = -2270;
           enemyY = random(400);
         }
       }          
       for(int i = 0; i < 200; i += 40){
         image(enemy,990+enemyX+i,180-i);
         if(enemyX > 640){
           enemyX = -2270;
         }
       }      
      for(int i = 0; i < 150; i +=50){
        image(enemy,enemyX+i,250-i);
        image(enemy,enemyX+i+100,350-i);
        image(enemy,enemyX+150,200);
        image(enemy,enemyX+50,300);
        if(enemyX > 640){
          enemyX = -2270;
        }
      }                  
      //treasure's place     
      image(treasure,trX,trY);
      //hp
      blood = 50+18*tmp;
      strokeWeight(17);
      stroke(255,54,54);
      line(50,40,blood,40);
      image(hp,30,30);
      //replace the treasure and add hp
      while(meX > trX-30 && meX < trX+30 && meY > trY-30 && meY < trY+30){
        trX = random(560);
        trY = random(240);
        tmp ++;
      }
      //hp's maximize
      if(blood >= 230){
        tmp = 10;
      }
      //decrease hp
      //while(meX > enemyX-35 && meX < enemyX+35 && meY > enemyY-35 && meY < enemyY +35){
      //  enemyX = 0;
      //  enemyY = meY;
      //  tmp -= 2;
      //}
      //gameover
      if(blood < 50){ 
        gameState = end;
      }
      break;
     
    case end:
    image(end2,0,0);
    if(mouseX>200 && mouseX<450 && mouseY>300 && mouseY<350){
        image(end1,0,0);
        if(mousePressed){
          gameState = start;
        }
    } 
    break;
  }
}
void keyPressed(){
   switch(keyCode){
    case LEFT:
      left = true;
    break;
    case RIGHT:
      right = true;
    break;
    case UP:
      up = true;  
    break;
    case DOWN:
      down = true;
    break;
  }
}
void keyReleased(){
  switch(keyCode){
    case LEFT:
     left = false;
    break;
    case RIGHT:
     right = false;
    break;
    case UP:
     up = false;     
    break;
    case DOWN:
     down = false;     
    break;
  }
}
