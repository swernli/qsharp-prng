namespace Test {
    open Pseudorandom;
    open Microsoft.Quantum.Intrinsic;

    @EntryPoint()
    operation Run() : Unit {
        Message($"{ExtractInteger()}");
    }
}

