# c0-in-c0

A C0 compiler to x86 ASM, written in C0.

This compiler consists of a regular expression based tokenizer, a recursive-descent parser, a SSA-based intermediate representation, and a greedy graph-coloring register allocator (maximal munch on simplicial elimination ordering).

Support for contract and garbage collection is planned.

To build the compiler executable, run `make` (make sure you have a working installation of `cc0`). This will generate an executable `ccc0`. Run
```sh
./ccc0 --help
```
for further instructions. For example, to

## Development

A `README.txt` containing the instructions for building the executable is needed for the [VS Code C0 Extension](https://marketplace.visualstudio.com/items?itemName=15122staff.c0-lsp) to work properly. To generate the file, run:
```sh
make init
```

## Dependencies

This project used to also contain a regular expression engine and an ordered map + priority queue (implemented with red-black tree) but I decided to move them into another [repo](https://github.com/davidmaamoaix/c0-utils) and just mirror `libs/` to that.

## Testing

All test files are located under `tests/`. Run `make test` to test.
