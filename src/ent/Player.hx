package ent;

import h2d.Scene;
import h2d.Object;
import hxd.Res;
import h2d.Anim;
import hxd.Key;
import math.Vector2;
import h2d.col.Bounds;

class Player extends Object {
    public var spd: Int;
    public var velocity: Vector2 = new Vector2();
    public var bounds: Bounds;

    var width: Int;
    var height: Int;

    var anim: Anim;
    var idleAnim = Res.player.player_idle.toTile().split(2);
    var walkAnimH = Res.player.player_walk_h.toTile().split(2);
    var walkAnimH_left = Res.player.player_walk_h_left.toTile().split(2);
    var walkAnimV = Res.player.player_walk_v.toTile().split(3);

    public function new(x: Float, y: Float, scene: Scene) {
        super(scene);

        this.x = x;
        this.y = y;
        this.width = 8 * 5;
        this.height = 8 * 5;
        this.spd = 300;
        this.bounds = Bounds.fromValues(this.x, this.y, this.width, this.height);

        anim = new Anim(idleAnim, 5, scene);
        anim.x = this.x - this.width / 2;
        anim.y = this.y - this.height / 2;
        anim.scale(5);
    }

    function updateAnim() {
        //W
        if (Key.isPressed(Key.W))
            anim.play(walkAnimV);
        else if (Key.isReleased(Key.W))
            anim.play(idleAnim);

        //S
        if (Key.isPressed(Key.S))
            anim.play(walkAnimV);
        else if (Key.isReleased(Key.S))
            anim.play(idleAnim);

        //A
        if (Key.isPressed(Key.A))
            anim.play(walkAnimH_left);
        else if (Key.isReleased(Key.A))
            anim.play(idleAnim);

        //D
        if (Key.isPressed(Key.D))
            anim.play(walkAnimH);
        else if (Key.isReleased(Key.D))
            anim.play(idleAnim);
    }

    public function update(dt: Float) {
        if (Key.isDown(Key.W)) {
            this.velocity.y = -this.spd;
        }
        else if (Key.isDown(Key.S)) {
            this.velocity.y = this.spd;
        }
        else {
            this.velocity.y = 0;
        }

        if (Key.isDown(Key.A)) {
            this.velocity.x = -this.spd;
        }
        else if (Key.isDown(Key.D)) {
            this.velocity.x = this.spd;
        }
        else {
            this.velocity.x = 0;
        }

        this.x += this.velocity.x * dt;
        this.y += this.velocity.y * dt;

        this.bounds.x = this.x;
        this.bounds.y = this.y;

        anim.x = this.x;
        anim.y = this.y;

        updateAnim();
    }
}