interface StreamMode {
  boolean isActive = true;
  void init(Context ctx);
  void update(Context ctx);
  void display(Context ctx);
  void reset(Context ctx);
}
