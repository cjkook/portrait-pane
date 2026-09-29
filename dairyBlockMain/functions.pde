color[] createPalette(String url) {
  // Extract the part of the URL after the last slash
  String[] pathSegments = split(url, '/');
  String hexStr = pathSegments[pathSegments.length - 1];

  // Split individual hex codes by hyphen
  String[] hexs = split(hexStr, '-');
  color[] palette = new color[hexs.length];

  for (int i = 0; i < hexs.length; i++) {
    palette[i] = unhex("FF" + hexs[i]);
  }

  return palette;
}

float[][] createContextBounds(float w, float h) {
  return new float[][] {
    {w*0.02, h*0.02, w*0.96, h*0.16}, // pattern context
    {w*0.02, h*0.20, w*0.68, h*0.76}, // main context
    {w*0.72, h*0.20, w*0.26, h*0.76}  // support context
  };
}

color[] createUrlColorArray(String[] urls) {
  color[] colors = new color[urls.length];
  for (int i = 0; i < urls.length; i++) {
    colors[i] = createPalette(urls[i])[0]; // Get the first color from each palette
  }
  return colors;
}

int getRandomColorIndex(color[] colors) {
  return int(random(colors.length));
}

int getRandomIndex(int length) {
  return int(random(length));
}


