//Level Four//

package levels;

import haxe.Timer;
import h2d.Text;
import hxd.res.DefaultFont;
import h2d.Font;
import ent.BlockPlace;
import hxd.Res;
import ent.Block;
import ent.Player;
import h2d.Scene;

class LevelFour extends Level {
    //entities
    var player: Player;

    var block1: Block;
    var block2: Block;
    var block3: Block;
    var block4: Block;
    var block5: Block;

    var blockPlace1: BlockPlace;
    var blockPlace2: BlockPlace;
    var blockPlace3: BlockPlace;
    var blockPlace4: BlockPlace;

    //text
    var txt: Text;

    //checks
    var placedBlocksCounter: Int;
    var allBlocksPlaced: Bool;

    public function new() {
        super();

        var font: Font = DefaultFont.get();
        txt = new Text(font);
        txt.text = "Which one of these words also a number? To, Two, or Too";
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

        block1 = new Block(381, 316, Res.letter_blocks.T_block.toTile());
        this.addChild(block1);
        block2 = new Block(1118, 193, Res.letter_blocks.W_block.toTile());
        this.addChild(block2);
        block3 = new Block(415, 640, Res.letter_blocks.O_block.toTile());
        this.addChild(block3);
        block4 = new Block(658, 387, Res.letter_blocks.O_block.toTile());
        this.addChild(block4);
        block5 = new Block(778, 503, Res.letter_blocks.empty_block.toTile());
        this.addChild(block5);

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
        playerBlockCol(block4, dt);
        playerBlockCol(block5, dt);

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
        else if (this.block4.bounds.intersects(this.blockPlace3.bounds)) {
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
                        Main.inst.setLevel(new LevelFive());
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