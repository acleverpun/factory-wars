class_name types extends Reference

const Direction = {
	"East": Vector2.RIGHT,
	"South": Vector2.DOWN,
	"West": Vector2.LEFT,
	"North": Vector2.UP,
}

enum DirectionFlags {
	East = 1 << 0,
	South = 1 << 1,
	West = 1 << 2,
	North = 1 << 3,
}

enum IO { Input, Output }
