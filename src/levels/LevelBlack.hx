package levels;

import hxd.Res;
import hxd.res.DefaultFont;
import h2d.Font;
import h2d.Text;
import haxe.Timer;

class LevelBlack extends Level {
    //text
    var txt: Text;

    public function new() {
        Timer.delay(
            () -> {
                Res.audio.bell.play(false, 1);
            },
            Math.floor(2) * 1000
        );

        super();

        Main.inst.engine.backgroundColor = 0x0A0A0A;

        var font: Font = DefaultFont.get();
        txt = new Text(font);
        txt.text = "";
        txt.textAlign = Center;
        txt.y = this.height / 2;
        txt.x = this.width / 2;
        txt.textColor = 0x962929;
        txt.scale(3);

        this.addChild(txt);
    }

    override function update(dt: Float) {
        Timer.delay(
            () -> {
                txt.text = "END";
            },
            Math.floor(2) * 1000
        );
    }
}