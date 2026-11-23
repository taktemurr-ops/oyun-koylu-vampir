import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_koylu_vampir/oyun_koylu_vampir.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(koyluVampirConfig.title.length, 33);
    expect(koyluVampirConfig.tagline.length, 33);
    for (final s in koyluVampirConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(koyluVampirConfig.gameId, koyluVampirId);
    expect(koyluVampirRules.gameId, koyluVampirId);
  });

  test('desteler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(koyluVampirRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: koyluVampirId, optionalMechanics: koyluVampirRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(koyluVampirRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
