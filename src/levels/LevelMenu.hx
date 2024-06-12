package levels;

import hxd.Key;
import hxd.res.DefaultFont;
import h2d.Font;
import h2d.Text;
import h2d.Tile;
import h2d.Bitmap;
import hxd.Res;

class LevelMenu extends Level {
    var tile: Tile;
    var bmp: Bitmap;

    //text
    var txt: Text;

    public function new() {
        super();

        tile = Res.EscWordsBanner.toTile();
        bmp = new Bitmap(tile, this);

        var font: Font = DefaultFont.get();
        txt = new Text(font);
        txt.text = "Press Space to start";
        txt.textAlign = Center;
        txt.y = this.height / 2;
        txt.x = this.width / 2;
        txt.textColor = 0x363636;
        txt.scale(3);

        this.addChild(txt);
    }

    override function update(dt: Float) {
        if (Key.isPressed(Key.SPACE)) {
            Main.inst.setLevel(new LevelOne());
            this.dispose();
        }
    }
}