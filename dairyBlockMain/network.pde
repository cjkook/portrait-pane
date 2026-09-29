Spout spout;
OscP5 oscP5;

int oscPort = 7474;

// Incoming event function catches incoming OSC messages
void oscEvent(OscMessage theOscMessage) {
  for (int i = 1; i <= 24; i++) {
    String OscMessage = String.format("/bark%d", i);

    // Get the first value as a float
    if (theOscMessage.checkAddrPattern(OscMessage) == true) {
      double oscValue = theOscMessage.get(0).floatValue();
      oscValue = Math.floor(oscValue * 100) / 100;

      // print raw
      // println(OscMessage + " value: " + oscValue);

      // apply easing to the bark value
      double target = oscValue;
      double dx = target - bark24[i-1];
      bark24[i-1] += dx * barkEasing[i-1]; 
      // println(OscMessage + " value: " + oscValue + " eased: " + bark24[i-1]);
    }
  }
}