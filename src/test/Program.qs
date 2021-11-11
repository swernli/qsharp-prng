namespace Test {
    open Pseudorandom;
    open Microsoft.Quantum.Intrinsic;

    @EntryPoint()
    operation Run() : Int {
        return DrawRandomInt(1, 25);
    }
}

