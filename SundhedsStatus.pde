class SundhedsStatus {
  private final float MIN_VAEGT = 4;
  private final float MAX_VAEGT = 40;
  private float vaegt;
  private int kalorier;

  SundhedsStatus(float startVaegt) {
    vaegt = constrain(startVaegt, MIN_VAEGT, MAX_VAEGT);
    kalorier = 0;
  }

  void aendreVaegt(float aendring) {
    vaegt = constrain(vaegt + aendring, MIN_VAEGT, MAX_VAEGT);
  }

  void aendreKalorier(int aendring) {
    kalorier = max(0, kalorier + aendring);
  }

  float getVaegt() {
    return vaegt;
  }

  int getKalorier() {
    return kalorier;
  }
}
