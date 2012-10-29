float fstmin=13.0; //the essential minutes
float lstmin=2.0; // the last minutes before regular end
float fadeout=2.0; // critical minutes lasting too long
float curtime=0.0;
int count=0;
int minut, sec;
PFont font;
boolean msclick=false;

void setup()
{
  size(400,400);
  background(0,255,0);
  font=createFont("Arial-Bold",20);
}

void draw()
{
  delay(1000);
  if(msclick) curtime=curtime+1.0/60.0;
  minut=round(curtime);
  sec=round((curtime-minut)*60);
  if(curtime<=fstmin/2) background(round(255-255*(1-curtime/(fstmin/2))),round(255),0);//-255*curtime/fstmin),0);
  if((curtime>fstmin/2) && (curtime<fstmin)) background(round(255),round(255-255*((curtime-fstmin/2)/(fstmin/2))),0);
  if((curtime>fstmin) && (curtime<=lstmin+fstmin)) background(0,0,255-round((curtime-fstmin)/lstmin*255));//round(255-(curtime-fstmin)/lstmin*255),255-round((curtime-fstmin)/lstmin*255),255);
  if((curtime>fstmin+lstmin) && (curtime<=fstmin+lstmin+fadeout)) {background(round(255*(curtime-fstmin-lstmin)/fadeout));}
  if(curtime>fstmin+lstmin+fadeout) {background(255*(count%2)); count++ ;}
  textFont(font);
  fill(255,0,255);
  text(minut,300,40);
  text(":",340,40);
  text(sec,360,40);
}

void mouseClicked()
{
  msclick=true;
}
