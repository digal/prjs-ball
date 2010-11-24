// Add your code below. If you're running this in Mobile
// Safari, click Save & Run, then add this app to your home
// screen (click +) to save it as an app.
var w = 1024
var h = 600
var sp

void setup() {
  size(w, h);
  fill(0);
//  sp = new sphere(w/2, h/2)
}

var orientation = [0,0,0];

void draw() {
  background(255);
  var x = orientation[0];
  var y = orientation[1];
  text("x="+x, 10, 10);
  text("y="+y, 10, 30);
  text("z="+orientation[2], 10, 50);
/*  text("t="+(new Date().getTime()), 10, 70);
  //line(w/2, h/2, w/2-(y*20), h/2-(x*20));
  text("sp="+sp+"("+sp.x+","+sp.y+")", 10, 90);
  sp.move(x, y);
  sp.draw();

  if (sp.x < 0 || sp.x > w || sp.y < 0 || sp.y > h) {
     alert("you lose!");
     noLoop();
  } */
}

window.ondevicemotion=function(event) {
  var aig = event.accelerationIncludingGravity 
  
  orientation[0] = aig.x;
  orientation[1] = aig.y;
  orientation[2] = aig.z;
}

/*function sphere(x, y){
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
}*/


