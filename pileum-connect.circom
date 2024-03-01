pragma circom 2.1.6;

include "helpers/sha256.circom";// from https://github.com/kr1983/zklogin-circuit/blob/main/circuits/helpers/sha256.circom

/** PileumConnect Circom circuit
Prover knows a preimage for sha256 hash.

Params:
- maxInCount: max size (bytes) for `padded_payload`
- pubpartCount: size (bytes) of public part in `padded_payload`. 12 bytes (dest(7) + date(4) + motif (1))

Private inputs:
- padded_payload
Public inputs:
- payload_len
- num_sha2_blocks
Public outputs:
- jwt_sha2_hash: sha256(payload)
- pubpart: padded_payload[:pubpartCount] // the first `pubpartCount` bytes of payload

**/

template Main(maxInCount, pubpartCount) {
    signal input padded_payload[maxInCount];
    signal input payload_len;
    signal input num_sha2_blocks;

    var inWidth = 8;
    // Check the validity of the SHA2 padding
    var padded_unsigned_jwt_len = 64 * num_sha2_blocks; // 64 bytes per SHA2 block
    SHA2PadVerifier(maxInCount)(padded_payload, padded_unsigned_jwt_len, payload_len);

    var hashCount = 4;
    var hashWidth = 256 / hashCount;
    signal output jwt_sha2_hash[hashCount];
    jwt_sha2_hash <== Sha2_wrapper(inWidth, maxInCount, hashWidth, hashCount)(
        padded_payload, num_sha2_blocks
    );

    signal output pubpart[pubpartCount];
    for (var i = 0; i < pubpartCount; i++) {
        pubpart[i] <== padded_payload[i];
    }
}

component main { public [ payload_len, num_sha2_blocks ] } = Main(320, 12);