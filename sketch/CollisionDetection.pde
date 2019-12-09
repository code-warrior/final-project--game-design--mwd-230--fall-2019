/**
COLLISION DETECTION LIBRARY FROM JEFF THOMPSON
Located here: https://github.com/jeffThompson/CollisionDetection
LICENSE:
This book's entire contents, including the code examples and this text, 
    is released under a Creative Commons Attribution, Non-Commercial, Share-Alike license. This means:

You're welcome to use this book and the examples to make great stuff, but please cite this book 
    somewhere in your project or its documentation. 
    (The book is found here: http://www.jeffreythompson.org/collision-detection/)

You can only use the book's text and/or code vertbatim for non-commercial projects. That means 
    you can remix or make your own version of the book, and you can fork and create 
    new libraries based on the code here, so long as they are not commercial projects 
    (ie publishing a book with a publisher). I'm very happy to talk options if you have a paid 
    gig and you'd like to use some of the materials.

If you do make a project that forks or remixes this book or code-base, it must 
    be released under this same license or a looser one. Pay it forward!

But you're free to use the ideas and code from this book inside your projects, 
    so long as this is just a part of what you're working on. In other words: 
    you're welcome to build a super cool game that relies on the code you've seen here, 
    even if you're going to sell it!

THESE METHODS HAVE NOT BEEN MODIFIED. MODIFIED COMMENTS HAVE MY NAME
*/

//James - Takes in a line's x1, y1, x2, y2 a cricles x,y and radius
boolean lineCircle(float x1, float y1, float x2, float y2, float cx, float cy, float r) {

  // is either end INSIDE the circle?
  // if so, return true immediately
  boolean inside1 = pointCircle(x1,y1, cx,cy,r);
  boolean inside2 = pointCircle(x2,y2, cx,cy,r);
  if (inside1 || inside2) return true;
  
  // get length of the line
  float distX = x1 - x2;
  float distY = y1 - y2;
  float len = sqrt( (distX*distX) + (distY*distY) );

  // get dot product of the line and circle
  float dot = ( ((cx-x1)*(x2-x1)) + ((cy-y1)*(y2-y1)) ) / pow(len,2);

  // find the closest point on the line
  float closestX = x1 + (dot * (x2-x1));
  float closestY = y1 + (dot * (y2-y1));
  
  // is this point actually on the line segment?
  // if so keep going, but if not, return false
  boolean onSegment = linePoint(x1,y1,x2,y2, closestX,closestY);
  if (!onSegment) return false;

  // optionally, draw a circle at the closest point on the line
  //fill(255,0,0);
  //noStroke();
  //ellipse(closestX, closestY, 20, 20);

  // get distance to closest point
  distX = closestX - cx;
  distY = closestY - cy;
  float distance = sqrt( (distX*distX) + (distY*distY) );

  if (distance <= r) {
    return true;
  }
  return false;
}


// LINE/POINT
boolean linePoint(float x1, float y1, float x2, float y2, float px, float py) {
  
  // get distance from the point to the two ends of the line
  float d1 = dist(px,py, x1,y1);
  float d2 = dist(px,py, x2,y2);
  
  // get the length of the line
  float lineLen = dist(x1,y1, x2,y2);
  
  // since floats are so minutely accurate, add
  // a little buffer zone that will give collision
  float buffer = 0.1;    // higher # = less accurate
  
  // if the two distances are equal to the line's length, the
  // point is on the line!
  // note we use the buffer here to give a range, rather than one #
  if (d1+d2 >= lineLen-buffer && d1+d2 <= lineLen+buffer) {
    return true;
  }
  return false;
}


// POINT/CIRCLE
boolean pointCircle(float px, float py, float cx, float cy, float r) {
  
  // get distance between the point and circle's center
  // using the Pythagorean Theorem
  float distX = px - cx;
  float distY = py - cy;
  float distance = sqrt( (distX*distX) + (distY*distY) );

  // if the distance is less than the circle's 
  // radius the point is inside!
  if (distance <= r) {
    return true;
  }
  return false;
}

