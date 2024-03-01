# pileum-connect-circuit

Circom circuit for [PileumConnect](https://connect.pileum.eu)

## Setup ceremony

### Phase 1
- [powersOfTau28_hez_final_18.ptau](https://storage.googleapis.com/zkevm/ptau/powersOfTau28_hez_final_18.ptau) from https://github.com/iden3/snarkjs (SHA256:e970efa7774da80101e0ac336d083ef3339855c98112539338d706b2b89ac694)

### Phase 2
```shell
$ circom --O2 --r1cs --wasm -o build/ -- ./pileum-connect.circom
template instances: 174
non-linear constraints: 157916
linear constraints: 0
public inputs: 2
public outputs: 16
private inputs: 320
private outputs: 0
wires: 155988
labels: 1036414
```
```shell
$ snarkjs groth16 setup build/pileum-connect.r1cs ./powersOfTau28_hez_final_18.ptau build/pileum-connect_0.zkey
[INFO]  snarkJS: Reading r1cs
[INFO]  snarkJS: Reading tauG1
[INFO]  snarkJS: Reading tauG2
[INFO]  snarkJS: Reading alphatauG1
[INFO]  snarkJS: Reading betatauG1
[INFO]  snarkJS: Circuit hash: 
                ecd02c16 be048beb d90dccb1 dbd4c1f8
                768f90e6 57e5ad04 fd69c30e 5f6e6944
                b425b779 81ef3efa e0820ec6 db97943f
                547a9c70 e2953a3c 4a9bb71c 474d2035
```
```shell
$ snarkjs zkey contribute build/pileum-connect_0.zkey build/pileum-connect_1.zkey --name='F' -v
Enter a random text. (Entropy):
[DEBUG] snarkJS: Applying key: L Section: 0/155969
[DEBUG] snarkJS: Applying key: L Section: 65536/155969
[DEBUG] snarkJS: Applying key: L Section: 131072/155969
[DEBUG] snarkJS: Applying key: H Section: 0/262144
[DEBUG] snarkJS: Applying key: H Section: 65536/262144
[DEBUG] snarkJS: Applying key: H Section: 131072/262144
[DEBUG] snarkJS: Applying key: H Section: 196608/262144
[INFO]  snarkJS: Circuit Hash: 
                ecd02c16 be048beb d90dccb1 dbd4c1f8
                768f90e6 57e5ad04 fd69c30e 5f6e6944
                b425b779 81ef3efa e0820ec6 db97943f
                547a9c70 e2953a3c 4a9bb71c 474d2035
[INFO]  snarkJS: Contribution Hash: 
                e7fb4dc3 a0f846ef 19711787 8d48df1a
                1e3ae496 46c5ea27 1e0dd9fb 372951f7
                8b80d79c a2cbe985 5d6c285b a3af723e
                659b10e9 976ab482 bd3fc7dc 9d98fb6e
```
```shell
$ snarkjs zkey contribute build/pileum-connect_1.zkey build/pileum-connect_2.zkey --name='K' -v
Enter a random text. (Entropy): 
[DEBUG] snarkJS: Applying key: L Section: 0/155969
[DEBUG] snarkJS: Applying key: L Section: 65536/155969
[DEBUG] snarkJS: Applying key: L Section: 131072/155969
[DEBUG] snarkJS: Applying key: H Section: 0/262144
[DEBUG] snarkJS: Applying key: H Section: 65536/262144
[DEBUG] snarkJS: Applying key: H Section: 131072/262144
[DEBUG] snarkJS: Applying key: H Section: 196608/262144
[INFO]  snarkJS: Circuit Hash: 
                ecd02c16 be048beb d90dccb1 dbd4c1f8
                768f90e6 57e5ad04 fd69c30e 5f6e6944
                b425b779 81ef3efa e0820ec6 db97943f
                547a9c70 e2953a3c 4a9bb71c 474d2035
[INFO]  snarkJS: Contribution Hash: 
                4949dd07 d157d0b4 249dfffd 82a91676
                be45ad5a e85ce825 6ae851c3 ec223ebb
                425a2ec3 163e040e 027437ed b430b342
                20ac2769 a34d1c60 ea852112 267f09c7
```
```shell
$ snarkjs zkey contribute build/pileum-connect_2.zkey build/pileum-connect_3.zkey --name='ChatGPT' -v
Enter a random text. (Entropy):
[DEBUG] snarkJS: Applying key: L Section: 0/155969
[DEBUG] snarkJS: Applying key: L Section: 65536/155969
[DEBUG] snarkJS: Applying key: L Section: 131072/155969
[DEBUG] snarkJS: Applying key: H Section: 0/262144
[DEBUG] snarkJS: Applying key: H Section: 65536/262144
[DEBUG] snarkJS: Applying key: H Section: 131072/262144
[DEBUG] snarkJS: Applying key: H Section: 196608/262144
[INFO]  snarkJS: Circuit Hash: 
                ecd02c16 be048beb d90dccb1 dbd4c1f8
                768f90e6 57e5ad04 fd69c30e 5f6e6944
                b425b779 81ef3efa e0820ec6 db97943f
                547a9c70 e2953a3c 4a9bb71c 474d2035
[INFO]  snarkJS: Contribution Hash: 
                1d42431f a5915cdd 5904a1d9 3a785c75
                3d15103e 51a09cd0 32073dc7 92cad047
                f4f3b7de a4fd0623 92090a6f c58bf574
                71c21e49 64847ff3 42fc29b7 4f025282
```
```shell
$ snarkjs zkey verify build/pileum-connect.r1cs ./powersOfTau28_hez_final_18.ptau build/pileum-connect_3.zkey
[INFO]  snarkJS: Reading r1cs
[INFO]  snarkJS: Reading tauG1
[INFO]  snarkJS: Reading tauG2
[INFO]  snarkJS: Reading alphatauG1
[INFO]  snarkJS: Reading betatauG1
[INFO]  snarkJS: Circuit hash: 
                ecd02c16 be048beb d90dccb1 dbd4c1f8
                768f90e6 57e5ad04 fd69c30e 5f6e6944
                b425b779 81ef3efa e0820ec6 db97943f
                547a9c70 e2953a3c 4a9bb71c 474d2035
[INFO]  snarkJS: Circuit Hash: 
                ecd02c16 be048beb d90dccb1 dbd4c1f8
                768f90e6 57e5ad04 fd69c30e 5f6e6944
                b425b779 81ef3efa e0820ec6 db97943f
                547a9c70 e2953a3c 4a9bb71c 474d2035
[INFO]  snarkJS: -------------------------
[INFO]  snarkJS: contribution #3 ChatGPT:
                1d42431f a5915cdd 5904a1d9 3a785c75
                3d15103e 51a09cd0 32073dc7 92cad047
                f4f3b7de a4fd0623 92090a6f c58bf574
                71c21e49 64847ff3 42fc29b7 4f025282
[INFO]  snarkJS: -------------------------
[INFO]  snarkJS: contribution #2 K:
                4949dd07 d157d0b4 249dfffd 82a91676
                be45ad5a e85ce825 6ae851c3 ec223ebb
                425a2ec3 163e040e 027437ed b430b342
                20ac2769 a34d1c60 ea852112 267f09c7
[INFO]  snarkJS: -------------------------
[INFO]  snarkJS: contribution #1 F:
                e7fb4dc3 a0f846ef 19711787 8d48df1a
                1e3ae496 46c5ea27 1e0dd9fb 372951f7
                8b80d79c a2cbe985 5d6c285b a3af723e
                659b10e9 976ab482 bd3fc7dc 9d98fb6e
[INFO]  snarkJS: -------------------------
[INFO]  snarkJS: ZKey Ok!
```
```shell
$ snarkjs zkey beacon build/pileum-connect_3.zkey build/pileum-connect_final.zkey a350ae134e7df8fd1bbd60d9aba947b8ecc2741a66c79720667c4a3d8447c4ef 10 -n="Final Beacon phase2"
[INFO]  snarkJS: Contribution Hash: 
                e3eb6fea 91e53612 85788889 00cd363a
                0333957b 844c6861 65d24d58 04005508
                fbd2d253 3894647a f16770e6 15daa943
                2076fcf7 d5532df1 ed849431 42f910e7
```
```shell
$ snarkjs zkey verify build/pileum-connect.r1cs ./powersOfTau28_hez_final_18.ptau build/pileum-connect_final.zkey
[INFO]  snarkJS: Reading r1cs
[INFO]  snarkJS: Reading tauG1
[INFO]  snarkJS: Reading tauG2
[INFO]  snarkJS: Reading alphatauG1
[INFO]  snarkJS: Reading betatauG1
[INFO]  snarkJS: Circuit hash: 
                ecd02c16 be048beb d90dccb1 dbd4c1f8
                768f90e6 57e5ad04 fd69c30e 5f6e6944
                b425b779 81ef3efa e0820ec6 db97943f
                547a9c70 e2953a3c 4a9bb71c 474d2035
[INFO]  snarkJS: Circuit Hash: 
                ecd02c16 be048beb d90dccb1 dbd4c1f8
                768f90e6 57e5ad04 fd69c30e 5f6e6944
                b425b779 81ef3efa e0820ec6 db97943f
                547a9c70 e2953a3c 4a9bb71c 474d2035
[INFO]  snarkJS: -------------------------
[INFO]  snarkJS: contribution #4 Final Beacon phase2:
                e3eb6fea 91e53612 85788889 00cd363a
                0333957b 844c6861 65d24d58 04005508
                fbd2d253 3894647a f16770e6 15daa943
                2076fcf7 d5532df1 ed849431 42f910e7
[INFO]  snarkJS: Beacon generator: a350ae134e7df8fd1bbd60d9aba947b8ecc2741a66c79720667c4a3d8447c4ef
[INFO]  snarkJS: Beacon iterations Exp: 10
[INFO]  snarkJS: -------------------------
[INFO]  snarkJS: contribution #3 ChatGPT:
                1d42431f a5915cdd 5904a1d9 3a785c75
                3d15103e 51a09cd0 32073dc7 92cad047
                f4f3b7de a4fd0623 92090a6f c58bf574
                71c21e49 64847ff3 42fc29b7 4f025282
[INFO]  snarkJS: -------------------------
[INFO]  snarkJS: contribution #2 K:
                4949dd07 d157d0b4 249dfffd 82a91676
                be45ad5a e85ce825 6ae851c3 ec223ebb
                425a2ec3 163e040e 027437ed b430b342
                20ac2769 a34d1c60 ea852112 267f09c7
[INFO]  snarkJS: -------------------------
[INFO]  snarkJS: contribution #1 F:
                e7fb4dc3 a0f846ef 19711787 8d48df1a
                1e3ae496 46c5ea27 1e0dd9fb 372951f7
                8b80d79c a2cbe985 5d6c285b a3af723e
                659b10e9 976ab482 bd3fc7dc 9d98fb6e
[INFO]  snarkJS: -------------------------
[INFO]  snarkJS: ZKey Ok!
```
```shell
$ snarkjs zkey export verificationkey build/pileum-connect_final.zkey build/pileum-connect_vkey.json
[INFO]  snarkJS: EXPORT VERIFICATION KEY STARTED
[INFO]  snarkJS: > Detected protocol: groth16
[INFO]  snarkJS: EXPORT VERIFICATION KEY FINISHED
```