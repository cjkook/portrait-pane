class BoomBoxStream implements StreamMode {
  BoomBox[] boomBoxes;
  PVector originPos = new PVector(0, 0);

  void init(Context ctx) {

    switch (ctx.name) {
      case "Pattern":
        boomBoxes = new BoomBox[6];
        originPos = new PVector(ctx.size.x/2, ctx.size.y/2);
        break;
      case "Main":
        boomBoxes = new BoomBox[3];
        originPos = new PVector(ctx.size.x/2, ctx.size.y/2);
        break;
      case "Support":
        boomBoxes = new BoomBox[1];
        originPos = new PVector(ctx.size.x/2, ctx.size.y/2);
        break;
      default:
        // boomBoxes = new BoomBox[0];
    }
    boomBoxes = new BoomBox[12];
    for (int i = 0; i < boomBoxes.length; i++) {
      boomBoxes[i] = new BoomBox(originPos, ctx);
    }
  }
  void reset(Context ctx) {
    init(ctx);
  }

  void update(Context ctx) {
    for (BoomBox box : boomBoxes) {
      box.update();
    }
  }

  void display(Context ctx) {
    for (BoomBox box : boomBoxes) {
      box.display();
    }
  }
}
