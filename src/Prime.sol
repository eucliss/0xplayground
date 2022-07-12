pragma solidity ^0.8.14;

// Shoutout https://gist.github.com/lhartikk/09e3a1ef1d8701e258fc91c19bc9e02f

contract Prime {

    function primeAddress(address addr) public returns (bool) {
        uint256 addrValue = uint256(uint160(addr));
        return isPrime(addrValue);
    }
    
    function isPrime(uint256 n) public view returns (bool){
        // 0 is prime ?? idk
        if (n <= 2) {
            return true;
        }
        // 2^(n-1) % n
        return expmod(2, n - 1, n) == 1;
    }

    function expmod(uint256 base, uint256 e, uint256 m) internal view returns (uint o) {

        assembly {
        // load FMP
            let p := mload(0x40)
            // store data in memory for staticcall arg locations
            mstore(p, 0x20)             // Store 32 for Base size
            mstore(add(p, 0x20), 0x20)  // Store 32 for exponent size
            mstore(add(p, 0x40), 0x20)  // Store 32 for modulus size
            
            mstore(add(p, 0x60), base)  // Store base at FMP + 0x60
            mstore(add(p, 0x80), e)     // Store Exponent at FMP + base(0x60) + 0x20
            mstore(add(p, 0xa0), m)     // Store Modulus at FMP + 0xa0, same logic as above

            // If its zero, we cant factor anymore, revert up
            if iszero(staticcall(
                sub(gas(), 2000), 
                0x05, // Address of execution
                p,    // args offset, end of FMP (0x80)
                0xc0, // Size of args, base + e + m == 96
                p,    // Return offset 
                0x20)) // Return size, uint => 32
            {
                // Revert (3,3) ohm
                revert(3, 3)
            }
            // Return data, load up what was in FMP 0x80
            o := mload(p)
        }}

}