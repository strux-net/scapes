// based on jstest.jsTR , version : 4.0
/**
*  When done, call this function
*/

function(fs) {
}
var AbstractEnumerableSet = AbstractSet.extend(
  {
    toArray : function() {
      var a = [];
    },
  }
);
range.methods = {
  /**
  *  Return true if x is in the range, false otherwise
  *  This method works for textual and Date ranges as well as numeric.
  */
  includes : function(x) {
    return this.from <= x && x <= this.to;
  },
};
Object.defineProperty(
  Object.prototype,
  'extend',
  {                                                // here comes an object
    writable : true,
    enumerable : false,                            // Make it nonenumerable
    configurable : true,
    value : function(a1,$o) {
      // Its value is this function
      var names = Object.getOwnPropertyNames(o);   // Get all own props, even nonenumerable ones
      // Loop through them
      for (var i = 0 ;i< names.length;i=i+1) {
        if (names[i] in this) {
          continue;                       // Skip props already in this object;
        }
        var desc = Object.getOwnPropertyDescriptor(o, names[i]); // Get property description from o
        Object.defineProperty(this, names[i], desc); // Use it to create property on this
      }
    },
  }
);
var count = 1;                                     // count the items
var args1 = [];
var myobj = {                                      // for my things
  prop1 : thing1,
  prop2 : {                                        // friends
    mikey : "good",
    devil : "bad",
    b : function(x) {
      if (x) {
        return true;
      }
    },
    rest : {
      me : "of course",                            // didn't you know?
      you : "sure thing",
      nest : {                                     // check one more nestlevel
        high : 10,
        low : -0,
        nestagain : {
          south : s,
          north : n,
          a : function(x) {
            if (y) {
              return false;
            }
          },
        },
        scale : [
          1,
          // comment possible
          2,
          3,
          {
            a : b,
            // comment possible
            c : d
          },
          
          function a(b) {
            b;
          },
          [
            3,
            4
          ]
        ]
      },
      evenmore : [
        he,
        she
      ]
    }
  },
  prop3 : [                                        // liquids
    water,
    soap
  ]
};
var sizes = [                                      // in different units
  1,
  2.54,
  foo(3),
  
  function a(b) {
    return b;
  },
  {
    a : 1,
    b : 2
  }
];
var j;                                             // uninitialized
var int i = 0;
a contiued statement
  = whatever;
  // call function                                 // b
  
switch (expr) {
  case a :
  {
    case for a;
    if (true) {
      a stmt for a;
    }
    break;
  }
  // comments survive
  case b :
  {
    case for b;
    break;
    break;
  }
}
var http = require('http');                        // Use Node's HTTP server API
var ws = require('websocket-server');              // Use an external WebSocket library
// Read the source of the chat client at startup. Used below.
var clientui = require('fs').readFileSync("wschatclient.html");
// Determine my location asynchronously and display it in the specified element.

function whereami(elt) {
  // Pass this object as the 3rd argument to getCurrentPosition()
  var options = {
    // Set to true to get a higher accuracy reading (from GPS, for example)
    // if available. Note, however that this can affect battery life.
    enableHighAccuracy : false,                    // Approximate is okay: this is the default
    // Set this property if a cached location is good enough.
    // The default is 0, which forces location to be checked anew.
    maximumAge : 300000,                           // A fix from the last 5 minutes is okay
    // How long are you willing to wait to get the location?
    // The default is Infinity and getCurrentPosition() never times out
    timeout : 15000                                // Don't take more than 15 seconds
  };
  if (navigator.geolocation) {
    // Request position, if supported
    navigator.geolocation.getCurrentPosition(success, error, options);
  } else {
    elt.innerHTMl = "Geolocation not supported in this browser";
  }
  // This function will be invoked if geolocation fails
  
  function error(e) {
    // The error object has a numeric code and a text message. Code values:
    // 1: the user did not give permission to share his or her location
    // 2: the browser was unable to determine the position
    // 3: a timeout occurred
    elt.innerHTML = "Geolocation error " + e.code + ": " + e.message;
  }
  // This function will be invoked if geolocation succeeds
  
  function success(pos) {
    // These are the fields that we always get. Note that the timestamp
    // is in the outer object, not the inner, coords object.
    var msg = "At " +
      new Date(pos.timestamp).toLocaleString() + " you were within " +
      pos.coords.accuracy + " meters of latitude " +
      pos.coords.latitude + " longitude " +
      pos.coords.longitude + ".";
      
    // If our device returns altitude, add that information.
    if (pos.coords.altitude) {
      msg += " You are " + pos.coords.altitude + " ± " +
        pos.coords.altitudeAccuracy + "meters above sea level.";
        
    }
    // if our device returns speed and heading, add that, too.
    if (pos.coords.speed) {
      msg += " You are travelling at " +
        pos.coords.speed + "m/s on heading " +
        pos.coords.heading + ".";
        
    }
    elt.innerHTML = msg;                           // Display all the position information
  }
}

function extend(o, p) {
  for (prop in p) {
    // For all props in p.
    o[prop] = p[prop]; // Add the property to o.;
  }
  return o;
}
Object.defineProperty(
  Object.prototype,
  'extend',                                        // Define Object.prototype.extend
  'jubel',
  {
    writable : true,
    o : [
      a,
      b,
      c
    ],
    value : function(o) {
      // Get all own props, even nonenumerable ones
      var names = Object.getOwnPropertyNames(o);
    }
  }
);

function foo(describes the code-block) {
  //****************************************
  // example for undesired effect
  //****************************************
  response.writeHead(
    200, {                                         // the { opens a new CODE block
      'Content-Type': 'text/html' : this looks like a one-line-statement, so append a ;
    }
  );
  //****************************************
  // workaround for undesired effect
  //****************************************
  response.writeHead(
    200, {                                         // standard head
      'Content-Type': 'text/html' : we are in no block at all, so this simply contiues the previous line
    }
  );
  // lines in a comment
    drei;
    if (b) {
      c;
    }
  // start of plan outer
  // plan "outer", strategy "s/yes/YYY/g"
    a=YYY;
    // start of plan inner
    // plan "inner", strategy "s/one/YYY/g"
      b=YYY;
      // a comment
      c=two;
    // plan "inner", strategy "s/two/YYY/g"
      b=one;
      // a comment
      c=YYY;
    b=no;
  // plan "outer", strategy "s/yes/ZZZ/g"
    a=ZZZ;
    // start of plan inner
    // plan "inner", strategy "s/one/ZZZ/g"
      b=ZZZ;
      // a comment
      c=two;
    // plan "inner", strategy "s/two/ZZZ/g"
      b=one;
      // a comment
      c=ZZZ;
    b=no;
  // start of plan 
  // plan "", strategy "s/opener/\[/;s/closer/\]/"
    tvar =0       ;if [$tvar ] ]; then echo -n ja ; else echo -n nein ; fi ; echo -e "\tnein"
    tvar =1       ;if [$tvar ] ]; then echo -n ja ; else echo -n nein ; fi ; echo -e "\tja"
    tvar =""      ;if [$tvar ] ]; then echo -n ja ; else echo -n nein ; fi ; echo -e "\tnein"
    tvar ="ja ja" ;if [$tvar ] ]; then echo -n ja ; else echo -n nein ; fi ; echo -e "\tja"
  // plan "", strategy "s/opener/(/;s/closer/)/"
    tvar =0       ;if ($tvar ) ]; then echo -n ja ; else echo -n nein ; fi ; echo -e "\tnein"
    tvar =1       ;if ($tvar ) ]; then echo -n ja ; else echo -n nein ; fi ; echo -e "\tja"
    tvar =""      ;if ($tvar ) ]; then echo -n ja ; else echo -n nein ; fi ; echo -e "\tnein"
    tvar ="ja ja" ;if ($tvar ) ]; then echo -n ja ; else echo -n nein ; fi ; echo -e "\tja"
}

function example1() {
  //****************************************
  // produce 3 repetitions of the block, each with another op
  //****************************************
  // start of plan simple example
  // plan "simple example", strategy "s/op/>/g"
  // running tests for >
  if (test1() > test2()) {
    handleTests(">");
  }
  // plan "simple example", strategy "s/op/</g"
  // running tests for <
  if (test1() < test2()) {
    handleTests("<");
  }
  // plan "simple example", strategy "s/op/==/g"
  // running tests for ==
  if (test1() == test2()) {
    handleTests("==");
  }
}

function example2() {
  //****************************************
  // produce 2 repetitions of the block, the first is unchanged
  //****************************************
  // start of plan example with untouched block
  // plan "example with untouched block", strategy ";"
    // when the lights are green
    if (light == "green") {
      greenseen++;
    }
  // plan "example with untouched block", strategy "s/green/red/g"
    // when the lights are red
    if (light == "red") {
      redseen++;
    }
}
// start of plan shifted plan
// plan "shifted plan", strategy ";"
  if (a) {
    ? b
      ? c
        ? d
          ? e
            ?                                      // f
              ?                                    // g
  }

function foo(args) {
  // code for foob
}

function bar() {
  // start of plan shifted plan
  // plan "shifted plan", strategy ";"
  testing here, if NEWFILE triggers correctly.;
  So nothing should come after this line;
}

function * generator(i) {
  yield i*i;
}
class Polygon {
  /**
  *  this is a comment for this method
  */
  constructor(height, width) {
    this.height = height;
    this.width = width;
  }
}
var Po = new Polygon(3,4);
log(Po);
var Polygon = class {
  constructor(height, width) {
    this.height = height;
    this.width = width;
  }
};
// named
var Polygon = class Polygon {
  constructor(height, width) {
    this.height = height;
    this.width = width;
  }
};
class Polygon {
  constructor(height, width) {
    this.height = height;
    this.width = width;
  }
  get area() {
    return this.calcArea();
  }
  calcArea() {
    return this.height * this.width;
  }
}
const square = new Polygon(10, 10);
console.log(square.area);
class Point {
  constructor(x,y) {
    this.x = x;
    this.y = y;
  }
  static distance(a, b) {
    const dx = a.x - b.x;
    const dy = a.y - b.y;
    return Math.sqrt(dx*dx + dy*dy);
  }
  /**
  *  this is a comment for this static method
  */
  static foo(a) {
    x=a;
  }
  static bar(b) {
    x=b;
  }
}
const p1 = new Point(5, 5);
const p2 = new Point(10, 10);
console.log(Point.distance(p1, p2));
class Animal {
  constructor(name) {
    this.name = name;
  }
  speak() {
    console.log(this.name + ' makes a noise.');
  }
}
class Dog extends Animal {
  speak() {
    console.log(this.name + ' barks.');
  }
}
class Bar extends calculatorMixin(randomizerMixin(Foo)) {
}
var eyeCatch = (function() {
  for (var d of $(".eyecatch")) {
    $(d).append(
      $(document.createElement("text"))
        .addClass("ecsupp")
        .width($(d).width())
        .height($(d).height())
        .css( "background-color",$(d).attr("eyecatchcolor") )
    );
  }
  var animation_running = false;
  
  return function() {
    if (!(animation_running)) {
      animation_running=true;
      $(".ecsupp").
        animate({opacity: '0.8'}, "slow").
        animate({opacity: '0.0'}, "slow",() => animation_running = false)
    }
  };
})();
var a=(function(a, b) {
  return foo(a+b,b);
})("hello", "world").start();
requestFileSystem(PERSISTENT,                      // Or TEMPORARY for cache files
  10 * 1024 * 1024,                                // We'd like 10 megabytes, please
  /**
  *  When done, call this function
  */
  
  function(fs) {
    filesystem = fs;                               // Just save the filesystem intoa global variable.
  },
  logerr                                           // Call this if an error occurs
);
//****************************************
// Function expressions can also be used as arguments to other functions:
//****************************************
data.sort(
  
  function(a, b) {
    return a - b;
  }
);
var AbstractEnumerableSet = AbstractSet.extend(
  
  function() {
    throw new Error("Can't instantiate abstract classes");
  },
  {
    size : abstractmethod,
    foreach : abstractmethod,
    isEmpty : function() {
      return this.size() == 0;
    },
    toString : function() {
      var s = "{";
      var i = 0;
      
      this.foreach(function(v) {
        if (i++ > 0) {
          s += ", ";
        }
        s += v;
      };
      );
      return s + "}";
    },
  }
);

function foo() {
  $scope.data = [
    [65, 59, 80, 81, 56, 55, 40],
    [28, 48, 40, 19, 86, 27, 90]
  ];
  $scope.options = {
    a : b,
    c : d
  };
}
class planet {
  constructor(color,x,y,z,r,vx,vy,vz) {
    // object vars
      this.color          = color;
  }
}
require(
  ['datehelper', 'hello'].map(
    
    function(el) {
      return './modules/' + el;
    },
    function(datehelper, hello) {,
    var content = [];,
    content.push('Heute ist der ' + datehelper.showDate());,
    content.push('Es ist ' + datehelper.showTime() + ' Uhr.');,
    content.push(hello.text);,
    setTimeout(function() {pre.innerHTML += content.join("\n");}, 500);
  ),
  }
);
pre.innerHTML += "noch länger warten ...\n";
s="(..)";                                          // ##PURE##
foo(
  a,
  // comment possible
  b
);
