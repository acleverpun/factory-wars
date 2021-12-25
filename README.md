# Factory Wars

Turn based strategy game with emphasis on resource management, logistics, and automation.

## Terminology

- stage: named playable level with a map game state
- map: the actual topography data defining a level
- entities / state: initial state of entities, that will also be modified in-place as a game is played out
- components:
- entity: properties and set of components
	- building
		- generator
		- factory
	- unit

## hierarchy

- main menu
	- `stage`[]
		- `name: String`
		- `description: String`
		- `map`: the actual topography data defining a level
		- `entities` / `state`: initial state of entities, that will also be modified in-place as a game is played out
	- `entity`: properties and set of components
		- `name: String`
		- `description: String`
		- `components`[]
		- types
			- building
				- generator
				- factory
			- unit

## filesystem

- `lib` - node-agnostic reusable classes, meant to be instantiated from code
- `src` - files directly tied to nodes
