//Level Eight//

package levels;

import ent.Knife;
import haxe.Timer;
import h2d.Text;
import hxd.res.DefaultFont;
import h2d.Font;
import ent.BlockPlace;
import hxd.Res;
import ent.Block;
import ent.Player;
import h2d.Scene;
import levels.LevelSix;

class LevelEight extends Level {
    //entities
    var player: Player;

    var knife: Knife;

    //text
    var txt: Text;

    //checks
    var placedBlocksCounter: Int;
    var allBlocksPlaced: Bool;

    public function new() {
        super();

        var font: Font = DefaultFont.get();
        txt = new Text(font);
        txt.text = "";
        txt.textAlign = Center;
        txt.y = this.height / 10;
        txt.x = this.width / 2;
        txt.scale(3);
        
        this.addChild(txt);

        knife = new Knife(32, 32, Res.knife.toTile());
        this.addChild(this.knife);

        player = new Player(this.width / 2, this.height / 1.5, this);
        this.addChild(this.player);
    }

    function playerKnifeCol(knife: Knife) {
        if (this.player.bounds.intersects(knife.bounds)) {
            Main.inst.setLevel(new LevelBlack());
            this.dispose();
        }
    }

    public override function update(dt: Float) {
        player.update(dt);

        playerKnifeCol(this.knife);
    }
}