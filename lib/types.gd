class_name types extends Reference

enum DirectionFlags {
	Right = 1 << 0,
	Down = 1 << 1,
	Left = 1 << 2,
	Up = 1 << 3,
}

enum IO { Input, Output }

const Direction = {
	"Right": Vector2.RIGHT,
	"Down": Vector2.DOWN,
	"Left": Vector2.LEFT,
	"Up": Vector2.UP,
}
