import h2d.Scene;
import levels.*;

class Main extends hxd.App {
    public var level: Level;

    override function init() {
        super.init();

        this.engine.backgroundColor = 0x999999;

        level = new LevelMenu();
        setLevel(level);
    }

    public function setLevel(level: Level) {
        setScene(level);
        this.level = level;
    }

    override function update(dt: Float) {
        super.update(dt);

        level.update(dt);
    }

    override function dispose() {
        super.dispose();

        level.dispose();
    }

    public static var inst(get, null): Main;
    static function get_inst(): Main {
        if (inst == null)
            inst = new Main();

        return inst;
    }
    
    static function main() {
        #if sys
        hxd.Res.initLocal(); // important! allows the app access to our game's resource files: images (sprites), audio, etc.
        #else
        hxd.Res.initEmbed(); // use hxd.Res.initEmbed(); for html5/js
        #end

        inst;
    }
}
