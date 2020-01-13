# meta_types_generator

* Add meta_types_generator and build_runner to your dev_dependencies
* generate code by running `pub run build_runner run`

See meta_types/example for examples on how to write model definitions.

## rules

* Always use generated classes in code.
* Always use definition classes when referencing other metatypes in your definitions.
* Sealed classes should never extend, only implement others.
* Interfaces cannot have computed accessors.
* Additional functionality can be added to any meta type by generating additional mixins.


supports:

dataclass
* default values
* interfaces
* clone
* generated constructors

sealed
* exhaustive when
* inexhaustive when
* option getters
* throwable getters
* bool checks
* when property handlers
* interfaces
* require type variance
* generated constructors

enum
* associated values TODO
* exhaustive when TODO
* inexhaustive when TODO
* valueOf TODO
* cordinal TODO
* value TODO
* require type variance TODO

all
* custom factory constructors - TODO
* load / dump TODO
* meta information (matches gen models) TODO
* computed values
* methods
* operators
* hashCode
* equality
* toString
