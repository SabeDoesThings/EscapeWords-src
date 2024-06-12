package ent;

import h2d.Tile;
import h2d.col.Bounds;
import h2d.Bitmap;

class BlockPlace extends Bitmap {
    public var bounds: Bounds;
    public var blockPlaced: Bool;
    public var correctBlockPlaced: Bool;

    public function new(x: Float, y: Float, tile: Tile) {
        super();

        this.x = x;
        this.y = y;
        this.width = 64;
        this.height = 64;
        this.bounds = Bounds.fromValues(this.x, this.y, this.width, this.height);
        this.tile = tile;
    }
}