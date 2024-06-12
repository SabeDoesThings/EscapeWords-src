//Level Two///

package levels;

import haxe.Timer;
import h2d.Text;
import hxd.res.DefaultFont;
import h2d.Font;
import ent.BlockPlace;
import hxd.Res;
import ent.Block;
import ent.Player;

class LevelTwo extends Level {
    //entities
    var player: Player;

    var block1: Block;
    var block2: Block;
    var block3: Block;
    var block4: Block;

    var blockPlace1: BlockPlace;
    var blockPlace2: BlockPlace;
    var blockPlace3: BlockPlace;

    //text
    var txt: Text;

    //checks
    var placedBlocksCounter: Int;
    var allBlocksPlaced: Bool;

    public function new() {
        super();

        var font: Font = DefaultFont.get();
        txt = new Text(font);
        txt.text = "What color is an apple?";
        txt.textAlign = Center;
        txt.y = this.height / 10;
        txt.x = this.width / 2;
        txt.scale(3);
        this.addChild(txt);

        blockPlace1 = new BlockPlace(this.width / 4 - 64 / 2, this.height / 4 - 64 / 2, Res.letter_blocks.block_place.toTile());
        this.addChild(blockPlace1);
        blockPlace2 = new BlockPlace(this.width / 2.5 - 64 / 2, this.height / 4 - 64 / 2, Res.letter_blocks.block_place.toTile());
        this.addChild(blockPlace2);
        blockPlace3 = new BlockPlace(this.width / 2 - 64 / 2, this.height / 4 - 64 / 2, Res.letter_blocks.block_place.toTile());
        this.addChild(blockPlace3);

        block1 = new Block(738, 258, Res.letter_blocks.R_block.toTile());
        this.addChild(block1);
        block2 = new Block(1101, 427, Res.letter_blocks.E_block.toTile());
        this.addChild(block2);
        block3 = new Block(416, 520, Res.letter_blocks.D_block.toTile());
        this.addChild(block3);

        player = new Player(this.width / 2, this.height / 1.5, this);
        this.addChild(player);
    }

    function playerBlockCol(block: Block, dt: Float) {
        if (this.player.bounds.intersects(block.bounds)) {
            block.x += this.player.velocity.x * dt;
            block.y += this.player.velocity.y * dt;
            block.updateBounds();
        }
    }

    public override function update(dt: Float) {
        player.update(dt);

        playerBlockCol(block1, dt);
        playerBlockCol(block2, dt);
        playerBlockCol(block3, dt);

        if (this.block1.bounds.intersects(this.blockPlace1.bounds)) {
            this.blockPlace1.blockPlaced = true;
            this.blockPlace1.correctBlockPlaced = true;
            this.placedBlocksCounter = 1;
        }
        if (this.block2.bounds.intersects(this.blockPlace2.bounds)) {
            this.blockPlace2.blockPlaced = true;
            this.blockPlace2.correctBlockPlaced = true;
            this.placedBlocksCounter = 2;
        }
        if (this.block3.bounds.intersects(this.blockPlace3.bounds)) {
            this.blockPlace3.blockPlaced = true;
            this.blockPlace3.correctBlockPlaced = true;
            this.placedBlocksCounter = 3;
        }

        if (this.placedBlocksCounter == 3) {
            this.allBlocksPlaced = true;
        }

        if (this.allBlocksPlaced == true) {
            if (
                this.blockPlace1.blockPlaced == true && this.blockPlace1.correctBlockPlaced == true &&
                this.blockPlace2.blockPlaced == true && this.blockPlace2.correctBlockPlaced == true &&
                this.blockPlace3.blockPlaced == true && this.blockPlace3.correctBlockPlaced == true
            ) {
                Timer.delay(
                    () -> {
                        Main.inst.setLevel(new LevelThree());
                        this.dispose();
                    },
                    Math.floor(1.5) * 1000
                );
            }
            else {
                Timer.delay(
                    () -> {
                        Main.inst.setLevel(new LevelOne());
                    },
                    Math.floor(1.5) * 1000
                );
            }
        }
    }
}