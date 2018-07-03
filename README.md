# AbsintheMemleakReproduction

In Absinthe, parsing deeply nested inputs results in an enormous usage of memory.

## Reproduction

```
mix test
```

This will run the tests. These tests simply try to run a mutation that doesn't exist, using an input
type that doesn't exist, along with some deeply nested variables. **On my machine, running this test
yields over 4GB of memory usage.**

This was extracted from a production system where we had to rework our mutation to no longer match
the natural structure, because it was simply unusable. The shape of this test's input mirrors the
shape we're using in production, though I've obfuscated the field names completely.

The issue appears to occur during `Absinthe.Blueprint.Transform.walk`.
