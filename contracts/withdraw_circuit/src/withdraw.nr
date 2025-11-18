use dep::merkle_trees::compute_merkle_root;
use dep::std::hash::pedersen_hash;

fn main(
    root: pub Field,            
    id: pub Field,              
    r: Field,                   
    index: Field,               
    hashpath: [Field; 8]        
) {
    // 1. Reconstruct the Commitment
    let commitment = pedersen_hash([id, r]);

    // 2. Verify Merkle Membership
    let computed_root = compute_merkle_root(commitment, index, hashpath);

    // 3. The Check
    // Does the root we calculated match the public root on the blockchain?
    assert(computed_root == root);
}