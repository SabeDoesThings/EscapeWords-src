package ent;

import h2d.Tile;
import h2d.col.Bounds;
import h2d.Bitmap;

class Knife extends Bitmap {
    public var bounds: Bounds;

    public function new(?x: Float, ?y: Float, tile: Tile) {
        super();

        this.x = x;
        this.y = y;
        this.width = 32;
        this.height = 32;
        this.bounds = Bounds.fromValues(this.x, this.y, this.width, this.height);
        this.tile = tile;
    }
}