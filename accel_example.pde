// Add your code below. If you're running this in Mobile
// Safari, click Save & Run, then add this app to your home
// screen (click +) to save it as an app.
var w = 1024;
var h = 600;
var b;
var orientation = [0,0,0];

void setup() {
  size(w, h);
  fill(0);
  frameRate(60);
  b = new ball(w/2, h/2);
}



void draw() {
  background(255);
  var x = orientation[0];
  var y = orientation[1];
  text("x="+x, 10, 10);
  text("y="+y, 10, 30);
  text("z="+orientation[2], 10, 50);
  text("t="+(new Date().getTime()), 10, 70);
  text("FPS: "+frameRate, 10, 90);
  b.move(x, y);
  b.draw();

  if (b.x < 0 || b.x > w || b.y < 0 || b.y > h) {
     alert("you lose!");
     noLoop();
  } 
}

window.ondevicemotion=function(event) {
  var aig = event.accelerationIncludingGravity;
  
  orientation[0] = aig.x;
  orientation[1] = aig.y;
  orientation[2] = aig.z;
}

ball = function(x, y){
   this.x = x;
   this.y = y;

   this.lastUpd = new Date().getTime();
 
   this.draw = function() {
       text("x:"+this.x+"; y:"+this.y, 20, 110);
       ellipse(this.x, this.y, 20, 20);
   }

   this.move = function(ax, ay){
       var now = new Date().getTime();
       var td = (now-this.lastUpd)/1000;

       this.y -= ax * td * 30;
       this.x -= ay * td * 30;

       this.lastUpd = now;
   }
}


