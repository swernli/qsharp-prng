namespace Pseudorandom {
    operation ExtractInteger() : Int {
        mutable rand = 0;
        for _ in 1..64 {
            if (Microsoft.Quantum.Llvm.ReadCycleCounter() &&& 1) == 1 {
                set rand += 1;
            }
            set rand = rand <<< 1;
        }

        // Based on the Mersenne-Twister Engine bit scrambling matrix.
        // https://en.cppreference.com/w/cpp/numeric/random/mersenne_twister_engine
        set rand = rand ^^^ ((rand >>> 29) &&& 6148914691236517205);
        set rand = rand ^^^ ((rand <<< 17) &&& 8202884508482404352);
        set rand = rand ^^^ ((rand <<< 37) &&& -2270628950310912);
        set rand = rand ^^^ (rand >>> 43);

        return rand;
    }

    operation DrawRandomInt(min : Int, max : Int) : Int {
        return (ExtractInteger() % (max - min + 1)) + min;
    }
}

namespace Microsoft.Quantum.Llvm {
    operation ReadCycleCounter() : Int {
        body intrinsic;
    }
}