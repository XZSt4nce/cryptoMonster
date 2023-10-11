{

    function array_length_t_string_memory_ptr(value) -> length {

        length := mload(value)

    }

    function array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, length) -> updated_pos {
        mstore(pos, length)
        updated_pos := add(pos, 0x20)
    }

    function copy_memory_to_memory_with_cleanup(src, dst, length) {
        let i := 0
        for { } lt(i, length) { i := add(i, 32) }
        {
            mstore(add(dst, i), mload(add(src, i)))
        }
        mstore(add(dst, length), 0)
    }

    function round_up_to_mul_of_32(value) -> result {
        result := and(add(value, 31), not(31))
    }

    function abi_encode_t_string_memory_ptr_to_t_string_memory_ptr_fromStack(value, pos) -> end {
        let length := array_length_t_string_memory_ptr(value)
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, length)
        copy_memory_to_memory_with_cleanup(add(value, 0x20), pos, length)
        end := add(pos, round_up_to_mul_of_32(length))
    }

    function abi_encode_tuple_t_string_memory_ptr__to_t_string_memory_ptr__fromStack_reversed(headStart , value0) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_string_memory_ptr_to_t_string_memory_ptr_fromStack(value0,  tail)

    }

    function allocate_unbounded() -> memPtr {
        memPtr := mload(64)
    }

    function revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() {
        revert(0, 0)
    }

    function revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() {
        revert(0, 0)
    }

    function cleanup_t_uint160(value) -> cleaned {
        cleaned := and(value, 0xffffffffffffffffffffffffffffffffffffffff)
    }

    function cleanup_t_address(value) -> cleaned {
        cleaned := cleanup_t_uint160(value)
    }

    function validator_revert_t_address(value) {
        if iszero(eq(value, cleanup_t_address(value))) { revert(0, 0) }
    }

    function abi_decode_t_address(offset, end) -> value {
        value := calldataload(offset)
        validator_revert_t_address(value)
    }

    function cleanup_t_uint256(value) -> cleaned {
        cleaned := value
    }

    function validator_revert_t_uint256(value) {
        if iszero(eq(value, cleanup_t_uint256(value))) { revert(0, 0) }
    }

    function abi_decode_t_uint256(offset, end) -> value {
        value := calldataload(offset)
        validator_revert_t_uint256(value)
    }

    function abi_decode_tuple_t_addresst_uint256(headStart, dataEnd) -> value0, value1 {
        if slt(sub(dataEnd, headStart), 64) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := 0

            value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
        }

        {

            let offset := 32

            value1 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
        }

    }

    function cleanup_t_bool(value) -> cleaned {
        cleaned := iszero(iszero(value))
    }

    function abi_encode_t_bool_to_t_bool_fromStack(value, pos) {
        mstore(pos, cleanup_t_bool(value))
    }

    function abi_encode_tuple_t_bool__to_t_bool__fromStack_reversed(headStart , value0) -> tail {
        tail := add(headStart, 32)

        abi_encode_t_bool_to_t_bool_fromStack(value0,  add(headStart, 0))

    }

    function validator_revert_t_enum$_phase_$722(value) {
        if iszero(lt(value, 3)) { revert(0, 0) }
    }

    function abi_decode_t_enum$_phase_$722(offset, end) -> value {
        value := calldataload(offset)
        validator_revert_t_enum$_phase_$722(value)
    }

    function abi_decode_tuple_t_addresst_uint256t_enum$_phase_$722(headStart, dataEnd) -> value0, value1, value2 {
        if slt(sub(dataEnd, headStart), 96) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := 0

            value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
        }

        {

            let offset := 32

            value1 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
        }

        {

            let offset := 64

            value2 := abi_decode_t_enum$_phase_$722(add(headStart, offset), dataEnd)
        }

    }

    function abi_encode_t_uint256_to_t_uint256_fromStack(value, pos) {
        mstore(pos, cleanup_t_uint256(value))
    }

    function abi_encode_tuple_t_uint256__to_t_uint256__fromStack_reversed(headStart , value0) -> tail {
        tail := add(headStart, 32)

        abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

    }

    function abi_decode_tuple_t_addresst_addresst_uint256(headStart, dataEnd) -> value0, value1, value2 {
        if slt(sub(dataEnd, headStart), 96) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := 0

            value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
        }

        {

            let offset := 32

            value1 := abi_decode_t_address(add(headStart, offset), dataEnd)
        }

        {

            let offset := 64

            value2 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
        }

    }

    function revert_error_1b9f4a0a5773e33b91aa01db23bf8c55fce1411167c872835e7fa00a4f17d46d() {
        revert(0, 0)
    }

    function revert_error_15abf5612cd996bc235ba1e55a4a30ac60e6bb601ff7ba4ad3f179b6be8d0490() {
        revert(0, 0)
    }

    function revert_error_81385d8c0b31fffe14be1da910c8bd3a80be4cfa248e04f42ec0faea3132a8ef() {
        revert(0, 0)
    }

    // string
    function abi_decode_t_string_calldata_ptr(offset, end) -> arrayPos, length {
        if iszero(slt(add(offset, 0x1f), end)) { revert_error_1b9f4a0a5773e33b91aa01db23bf8c55fce1411167c872835e7fa00a4f17d46d() }
        length := calldataload(offset)
        if gt(length, 0xffffffffffffffff) { revert_error_15abf5612cd996bc235ba1e55a4a30ac60e6bb601ff7ba4ad3f179b6be8d0490() }
        arrayPos := add(offset, 0x20)
        if gt(add(arrayPos, mul(length, 0x01)), end) { revert_error_81385d8c0b31fffe14be1da910c8bd3a80be4cfa248e04f42ec0faea3132a8ef() }
    }

    function abi_decode_tuple_t_string_calldata_ptrt_string_calldata_ptr(headStart, dataEnd) -> value0, value1, value2, value3 {
        if slt(sub(dataEnd, headStart), 64) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := calldataload(add(headStart, 0))
            if gt(offset, 0xffffffffffffffff) { revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() }

            value0, value1 := abi_decode_t_string_calldata_ptr(add(headStart, offset), dataEnd)
        }

        {

            let offset := calldataload(add(headStart, 32))
            if gt(offset, 0xffffffffffffffff) { revert_error_c1322bf8034eace5e0b5c7295db60986aa89aae5e0ea0873e4689e076861a5db() }

            value2, value3 := abi_decode_t_string_calldata_ptr(add(headStart, offset), dataEnd)
        }

    }

    function abi_encode_t_address_to_t_address(value, pos) {
        mstore(pos, cleanup_t_address(value))
    }

    function array_storeLengthForEncoding_t_string_memory_ptr(pos, length) -> updated_pos {
        mstore(pos, length)
        updated_pos := add(pos, 0x20)
    }

    function abi_encode_t_string_memory_ptr_to_t_string_memory_ptr(value, pos) -> end {
        let length := array_length_t_string_memory_ptr(value)
        pos := array_storeLengthForEncoding_t_string_memory_ptr(pos, length)
        copy_memory_to_memory_with_cleanup(add(value, 0x20), pos, length)
        end := add(pos, round_up_to_mul_of_32(length))
    }

    function panic_error_0x21() {
        mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
        mstore(4, 0x21)
        revert(0, 0x24)
    }

    function validator_assert_t_enum$_roles_$727(value) {
        if iszero(lt(value, 4)) { panic_error_0x21() }
    }

    function cleanup_t_enum$_roles_$727(value) -> cleaned {
        cleaned := value validator_assert_t_enum$_roles_$727(value)
    }

    function convert_t_enum$_roles_$727_to_t_uint8(value) -> converted {
        converted := cleanup_t_enum$_roles_$727(value)
    }

    function abi_encode_t_enum$_roles_$727_to_t_uint8(value, pos) {
        mstore(pos, convert_t_enum$_roles_$727_to_t_uint8(value))
    }

    function abi_encode_t_uint256_to_t_uint256(value, pos) {
        mstore(pos, cleanup_t_uint256(value))
    }

    function abi_encode_t_bool_to_t_bool(value, pos) {
        mstore(pos, cleanup_t_bool(value))
    }

    // struct cryptoMonster.User -> struct cryptoMonster.User
    function abi_encode_t_struct$_User_$743_memory_ptr_to_t_struct$_User_$743_memory_ptr_fromStack(value, pos)  -> end  {
        let tail := add(pos, 0xe0)

        {
            // wallet

            let memberValue0 := mload(add(value, 0x00))
            abi_encode_t_address_to_t_address(memberValue0, add(pos, 0x00))
        }

        {
            // login

            let memberValue0 := mload(add(value, 0x20))

            mstore(add(pos, 0x20), sub(tail, pos))
            tail := abi_encode_t_string_memory_ptr_to_t_string_memory_ptr(memberValue0, tail)

        }

        {
            // role

            let memberValue0 := mload(add(value, 0x40))
            abi_encode_t_enum$_roles_$727_to_t_uint8(memberValue0, add(pos, 0x40))
        }

        {
            // balanceSeed

            let memberValue0 := mload(add(value, 0x60))
            abi_encode_t_uint256_to_t_uint256(memberValue0, add(pos, 0x60))
        }

        {
            // balancePrivate

            let memberValue0 := mload(add(value, 0x80))
            abi_encode_t_uint256_to_t_uint256(memberValue0, add(pos, 0x80))
        }

        {
            // balancePublic

            let memberValue0 := mload(add(value, 0xa0))
            abi_encode_t_uint256_to_t_uint256(memberValue0, add(pos, 0xa0))
        }

        {
            // isInWhitelist

            let memberValue0 := mload(add(value, 0xc0))
            abi_encode_t_bool_to_t_bool(memberValue0, add(pos, 0xc0))
        }

        end := tail
    }

    function abi_encode_tuple_t_struct$_User_$743_memory_ptr__to_t_struct$_User_$743_memory_ptr__fromStack_reversed(headStart , value0) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_struct$_User_$743_memory_ptr_to_t_struct$_User_$743_memory_ptr_fromStack(value0,  tail)

    }

    function abi_decode_tuple_t_uint256(headStart, dataEnd) -> value0 {
        if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := 0

            value0 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
        }

    }

    function cleanup_t_uint8(value) -> cleaned {
        cleaned := and(value, 0xff)
    }

    function abi_encode_t_uint8_to_t_uint8_fromStack(value, pos) {
        mstore(pos, cleanup_t_uint8(value))
    }

    function abi_encode_tuple_t_uint8__to_t_uint8__fromStack_reversed(headStart , value0) -> tail {
        tail := add(headStart, 32)

        abi_encode_t_uint8_to_t_uint8_fromStack(value0,  add(headStart, 0))

    }

    function validator_revert_t_bool(value) {
        if iszero(eq(value, cleanup_t_bool(value))) { revert(0, 0) }
    }

    function abi_decode_t_bool(offset, end) -> value {
        value := calldataload(offset)
        validator_revert_t_bool(value)
    }

    function abi_decode_tuple_t_uint256t_bool(headStart, dataEnd) -> value0, value1 {
        if slt(sub(dataEnd, headStart), 64) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := 0

            value0 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
        }

        {

            let offset := 32

            value1 := abi_decode_t_bool(add(headStart, offset), dataEnd)
        }

    }

    function abi_decode_tuple_t_address(headStart, dataEnd) -> value0 {
        if slt(sub(dataEnd, headStart), 32) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := 0

            value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
        }

    }

    function abi_decode_tuple_t_addresst_address(headStart, dataEnd) -> value0, value1 {
        if slt(sub(dataEnd, headStart), 64) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := 0

            value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
        }

        {

            let offset := 32

            value1 := abi_decode_t_address(add(headStart, offset), dataEnd)
        }

    }

    function array_length_t_array$_t_struct$_Request_$750_memory_ptr_$dyn_memory_ptr(value) -> length {

        length := mload(value)

    }

    function array_storeLengthForEncoding_t_array$_t_struct$_Request_$750_memory_ptr_$dyn_memory_ptr_fromStack(pos, length) -> updated_pos {
        mstore(pos, length)
        updated_pos := add(pos, 0x20)
    }

    function array_dataslot_t_array$_t_struct$_Request_$750_memory_ptr_$dyn_memory_ptr(ptr) -> data {
        data := ptr

        data := add(ptr, 0x20)

    }

    // struct cryptoMonster.Request -> struct cryptoMonster.Request
    function abi_encode_t_struct$_Request_$750_memory_ptr_to_t_struct$_Request_$750_memory_ptr(value, pos)  -> end  {
        let tail := add(pos, 0x60)

        {
            // login

            let memberValue0 := mload(add(value, 0x00))

            mstore(add(pos, 0x00), sub(tail, pos))
            tail := abi_encode_t_string_memory_ptr_to_t_string_memory_ptr(memberValue0, tail)

        }

        {
            // wallet

            let memberValue0 := mload(add(value, 0x20))
            abi_encode_t_address_to_t_address(memberValue0, add(pos, 0x20))
        }

        {
            // isConfirmed

            let memberValue0 := mload(add(value, 0x40))
            abi_encode_t_bool_to_t_bool(memberValue0, add(pos, 0x40))
        }

        end := tail
    }

    function abi_encodeUpdatedPos_t_struct$_Request_$750_memory_ptr_to_t_struct$_Request_$750_memory_ptr(value0, pos) -> updatedPos {
        updatedPos := abi_encode_t_struct$_Request_$750_memory_ptr_to_t_struct$_Request_$750_memory_ptr(value0, pos)
    }

    function array_nextElement_t_array$_t_struct$_Request_$750_memory_ptr_$dyn_memory_ptr(ptr) -> next {
        next := add(ptr, 0x20)
    }

    // struct cryptoMonster.Request[] -> struct cryptoMonster.Request[]
    function abi_encode_t_array$_t_struct$_Request_$750_memory_ptr_$dyn_memory_ptr_to_t_array$_t_struct$_Request_$750_memory_ptr_$dyn_memory_ptr_fromStack(value, pos)  -> end  {
        let length := array_length_t_array$_t_struct$_Request_$750_memory_ptr_$dyn_memory_ptr(value)
        pos := array_storeLengthForEncoding_t_array$_t_struct$_Request_$750_memory_ptr_$dyn_memory_ptr_fromStack(pos, length)
        let headStart := pos
        let tail := add(pos, mul(length, 0x20))
        let baseRef := array_dataslot_t_array$_t_struct$_Request_$750_memory_ptr_$dyn_memory_ptr(value)
        let srcPtr := baseRef
        for { let i := 0 } lt(i, length) { i := add(i, 1) }
        {
            mstore(pos, sub(tail, headStart))
            let elementValue0 := mload(srcPtr)
            tail := abi_encodeUpdatedPos_t_struct$_Request_$750_memory_ptr_to_t_struct$_Request_$750_memory_ptr(elementValue0, tail)
            srcPtr := array_nextElement_t_array$_t_struct$_Request_$750_memory_ptr_$dyn_memory_ptr(srcPtr)
            pos := add(pos, 0x20)
        }
        pos := tail
        end := pos
    }

    function abi_encode_tuple_t_array$_t_struct$_Request_$750_memory_ptr_$dyn_memory_ptr__to_t_array$_t_struct$_Request_$750_memory_ptr_$dyn_memory_ptr__fromStack_reversed(headStart , value0) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_array$_t_struct$_Request_$750_memory_ptr_$dyn_memory_ptr_to_t_array$_t_struct$_Request_$750_memory_ptr_$dyn_memory_ptr_fromStack(value0,  tail)

    }

    function abi_decode_tuple_t_addresst_addresst_uint256t_enum$_phase_$722(headStart, dataEnd) -> value0, value1, value2, value3 {
        if slt(sub(dataEnd, headStart), 128) { revert_error_dbdddcbe895c83990c08b3492a0e83918d802a52331272ac6fdb6a7c4aea3b1b() }

        {

            let offset := 0

            value0 := abi_decode_t_address(add(headStart, offset), dataEnd)
        }

        {

            let offset := 32

            value1 := abi_decode_t_address(add(headStart, offset), dataEnd)
        }

        {

            let offset := 64

            value2 := abi_decode_t_uint256(add(headStart, offset), dataEnd)
        }

        {

            let offset := 96

            value3 := abi_decode_t_enum$_phase_$722(add(headStart, offset), dataEnd)
        }

    }

    function abi_encode_tuple_t_uint256_t_uint256_t_uint256_t_uint256__to_t_uint256_t_uint256_t_uint256_t_uint256__fromStack_reversed(headStart , value3, value2, value1, value0) -> tail {
        tail := add(headStart, 128)

        abi_encode_t_uint256_to_t_uint256_fromStack(value0,  add(headStart, 0))

        abi_encode_t_uint256_to_t_uint256_fromStack(value1,  add(headStart, 32))

        abi_encode_t_uint256_to_t_uint256_fromStack(value2,  add(headStart, 64))

        abi_encode_t_uint256_to_t_uint256_fromStack(value3,  add(headStart, 96))

    }

    function panic_error_0x22() {
        mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
        mstore(4, 0x22)
        revert(0, 0x24)
    }

    function extract_byte_array_length(data) -> length {
        length := div(data, 2)
        let outOfPlaceEncoding := and(data, 1)
        if iszero(outOfPlaceEncoding) {
            length := and(length, 0x7f)
        }

        if eq(outOfPlaceEncoding, lt(length, 32)) {
            panic_error_0x22()
        }
    }

    function store_literal_in_memory_0f09a80689d13c70d259c408aafafe540ff924ace90d10c0c97d9a71d58c5ad9(memPtr) {

        mstore(add(memPtr, 0), 0xd09dd0b5d0b4d0bed181d182d0b0d182d0bed187d0bdd0be20d182d0bed0bad0)

        mstore(add(memPtr, 32), 0xb5d0bdd0bed0b200000000000000000000000000000000000000000000000000)

    }

    function abi_encode_t_stringliteral_0f09a80689d13c70d259c408aafafe540ff924ace90d10c0c97d9a71d58c5ad9_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 39)
        store_literal_in_memory_0f09a80689d13c70d259c408aafafe540ff924ace90d10c0c97d9a71d58c5ad9(pos)
        end := add(pos, 64)
    }

    function abi_encode_tuple_t_stringliteral_0f09a80689d13c70d259c408aafafe540ff924ace90d10c0c97d9a71d58c5ad9__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_0f09a80689d13c70d259c408aafafe540ff924ace90d10c0c97d9a71d58c5ad9_to_t_string_memory_ptr_fromStack( tail)

    }

    function store_literal_in_memory_16059188434c9a45bc546baee319ea7aafd84314c05f7308f45fa78720ad61d1(memPtr) {

        mstore(add(memPtr, 0), 0xd09dd0b5d0b4d0bed181d182d0b0d182d0bed187d0bdd0be20d182d0bed0bad0)

        mstore(add(memPtr, 32), 0xb5d0bdd0be000000000000000000000000000000000000000000000000000000)

    }

    function abi_encode_t_stringliteral_16059188434c9a45bc546baee319ea7aafd84314c05f7308f45fa78720ad61d1_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 37)
        store_literal_in_memory_16059188434c9a45bc546baee319ea7aafd84314c05f7308f45fa78720ad61d1(pos)
        end := add(pos, 64)
    }

    function abi_encode_tuple_t_stringliteral_16059188434c9a45bc546baee319ea7aafd84314c05f7308f45fa78720ad61d1__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_16059188434c9a45bc546baee319ea7aafd84314c05f7308f45fa78720ad61d1_to_t_string_memory_ptr_fromStack( tail)

    }

    function panic_error_0x11() {
        mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
        mstore(4, 0x11)
        revert(0, 0x24)
    }

    function checked_sub_t_uint256(x, y) -> diff {
        x := cleanup_t_uint256(x)
        y := cleanup_t_uint256(y)
        diff := sub(x, y)

        if gt(diff, x) { panic_error_0x11() }

    }

    function checked_add_t_uint256(x, y) -> sum {
        x := cleanup_t_uint256(x)
        y := cleanup_t_uint256(y)
        sum := add(x, y)

        if gt(x, sum) { panic_error_0x11() }

    }

    function store_literal_in_memory_5a1283f53c0e7cf1fbb2fbcc2eff83e0bbd36063b97216c48c728a55a9e0d2ba(memPtr) {

        mstore(add(memPtr, 0), 0xd094d0bed181d182d183d0bf20d0b7d0b0d0bfd180d0b5d189d191d0bd000000)

    }

    function abi_encode_t_stringliteral_5a1283f53c0e7cf1fbb2fbcc2eff83e0bbd36063b97216c48c728a55a9e0d2ba_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 29)
        store_literal_in_memory_5a1283f53c0e7cf1fbb2fbcc2eff83e0bbd36063b97216c48c728a55a9e0d2ba(pos)
        end := add(pos, 32)
    }

    function abi_encode_tuple_t_stringliteral_5a1283f53c0e7cf1fbb2fbcc2eff83e0bbd36063b97216c48c728a55a9e0d2ba__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_5a1283f53c0e7cf1fbb2fbcc2eff83e0bbd36063b97216c48c728a55a9e0d2ba_to_t_string_memory_ptr_fromStack( tail)

    }

    function panic_error_0x32() {
        mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
        mstore(4, 0x32)
        revert(0, 0x24)
    }

    function increment_t_uint256(value) -> ret {
        value := cleanup_t_uint256(value)
        if eq(value, 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) { panic_error_0x11() }
        ret := add(value, 1)
    }

    function store_literal_in_memory_b267820f9e15029be77f5010fe52e2699a3e369558232a8c4be0e614af21ddc3(memPtr) {

        mstore(add(memPtr, 0), 0xd092d18b20d183d0b6d0b520d0bed182d0bfd180d0b0d0b2d0b8d0bbd0b820d0)

        mstore(add(memPtr, 32), 0xb7d0b0d18fd0b2d0bad183000000000000000000000000000000000000000000)

    }

    function abi_encode_t_stringliteral_b267820f9e15029be77f5010fe52e2699a3e369558232a8c4be0e614af21ddc3_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 43)
        store_literal_in_memory_b267820f9e15029be77f5010fe52e2699a3e369558232a8c4be0e614af21ddc3(pos)
        end := add(pos, 64)
    }

    function abi_encode_tuple_t_stringliteral_b267820f9e15029be77f5010fe52e2699a3e369558232a8c4be0e614af21ddc3__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_b267820f9e15029be77f5010fe52e2699a3e369558232a8c4be0e614af21ddc3_to_t_string_memory_ptr_fromStack( tail)

    }

    function panic_error_0x41() {
        mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
        mstore(4, 0x41)
        revert(0, 0x24)
    }

    function array_dataslot_t_string_storage(ptr) -> data {
        data := ptr

        mstore(0, ptr)
        data := keccak256(0, 0x20)

    }

    function divide_by_32_ceil(value) -> result {
        result := div(add(value, 31), 32)
    }

    function shift_left_dynamic(bits, value) -> newValue {
        newValue :=

        shl(bits, value)

    }

    function update_byte_slice_dynamic32(value, shiftBytes, toInsert) -> result {
        let shiftBits := mul(shiftBytes, 8)
        let mask := shift_left_dynamic(shiftBits, 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff)
        toInsert := shift_left_dynamic(shiftBits, toInsert)
        value := and(value, not(mask))
        result := or(value, and(toInsert, mask))
    }

    function identity(value) -> ret {
        ret := value
    }

    function convert_t_uint256_to_t_uint256(value) -> converted {
        converted := cleanup_t_uint256(identity(cleanup_t_uint256(value)))
    }

    function prepare_store_t_uint256(value) -> ret {
        ret := value
    }

    function update_storage_value_t_uint256_to_t_uint256(slot, offset, value_0) {
        let convertedValue_0 := convert_t_uint256_to_t_uint256(value_0)
        sstore(slot, update_byte_slice_dynamic32(sload(slot), offset, prepare_store_t_uint256(convertedValue_0)))
    }

    function zero_value_for_split_t_uint256() -> ret {
        ret := 0
    }

    function storage_set_to_zero_t_uint256(slot, offset) {
        let zero_0 := zero_value_for_split_t_uint256()
        update_storage_value_t_uint256_to_t_uint256(slot, offset, zero_0)
    }

    function clear_storage_range_t_bytes1(start, end) {
        for {} lt(start, end) { start := add(start, 1) }
        {
            storage_set_to_zero_t_uint256(start, 0)
        }
    }

    function clean_up_bytearray_end_slots_t_string_storage(array, len, startIndex) {

        if gt(len, 31) {
            let dataArea := array_dataslot_t_string_storage(array)
            let deleteStart := add(dataArea, divide_by_32_ceil(startIndex))
            // If we are clearing array to be short byte array, we want to clear only data starting from array data area.
            if lt(startIndex, 32) { deleteStart := dataArea }
            clear_storage_range_t_bytes1(deleteStart, add(dataArea, divide_by_32_ceil(len)))
        }

    }

    function shift_right_unsigned_dynamic(bits, value) -> newValue {
        newValue :=

        shr(bits, value)

    }

    function mask_bytes_dynamic(data, bytes) -> result {
        let mask := not(shift_right_unsigned_dynamic(mul(8, bytes), not(0)))
        result := and(data, mask)
    }
    function extract_used_part_and_set_length_of_short_byte_array(data, len) -> used {
        // we want to save only elements that are part of the array after resizing
        // others should be set to zero
        data := mask_bytes_dynamic(data, len)
        used := or(data, mul(2, len))
    }
    function copy_byte_array_to_storage_from_t_string_memory_ptr_to_t_string_storage(slot, src) {

        let newLen := array_length_t_string_memory_ptr(src)
        // Make sure array length is sane
        if gt(newLen, 0xffffffffffffffff) { panic_error_0x41() }

        let oldLen := extract_byte_array_length(sload(slot))

        // potentially truncate data
        clean_up_bytearray_end_slots_t_string_storage(slot, oldLen, newLen)

        let srcOffset := 0

        srcOffset := 0x20

        switch gt(newLen, 31)
        case 1 {
            let loopEnd := and(newLen, not(0x1f))

            let dstPtr := array_dataslot_t_string_storage(slot)
            let i := 0
            for { } lt(i, loopEnd) { i := add(i, 0x20) } {
                sstore(dstPtr, mload(add(src, srcOffset)))
                dstPtr := add(dstPtr, 1)
                srcOffset := add(srcOffset, 32)
            }
            if lt(loopEnd, newLen) {
                let lastValue := mload(add(src, srcOffset))
                sstore(dstPtr, mask_bytes_dynamic(lastValue, and(newLen, 0x1f)))
            }
            sstore(slot, add(mul(newLen, 2), 1))
        }
        default {
            let value := 0
            if newLen {
                value := mload(add(src, srcOffset))
            }
            sstore(slot, extract_used_part_and_set_length_of_short_byte_array(value, newLen))
        }
    }

    function array_storeLengthForEncoding_t_string_memory_ptr_nonPadded_inplace_fromStack(pos, length) -> updated_pos {
        updated_pos := pos
    }

    function copy_calldata_to_memory_with_cleanup(src, dst, length) {
        calldatacopy(dst, src, length)
        mstore(add(dst, length), 0)
    }

    // string -> string
    function abi_encode_t_string_calldata_ptr_to_t_string_memory_ptr_nonPadded_inplace_fromStack(start, length, pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_nonPadded_inplace_fromStack(pos, length)

        copy_calldata_to_memory_with_cleanup(start, pos, length)
        end := add(pos, length)
    }

    function abi_encode_tuple_packed_t_string_calldata_ptr__to_t_string_memory_ptr__nonPadded_inplace_fromStack_reversed(pos , value1, value0) -> end {

        pos := abi_encode_t_string_calldata_ptr_to_t_string_memory_ptr_nonPadded_inplace_fromStack(value0, value1,  pos)

        end := pos
    }

    function store_literal_in_memory_1dfd0f6c1c45c98b439ba42de1f172f13bdcb4e52fa0aab0eb24f700130907bd(memPtr) {

        mstore(add(memPtr, 0), 0xd09fd0b0d180d0bed0bbd18c20d0bdd0b520d0b2d0b5d180d0bdd18bd0b90000)

    }

    function abi_encode_t_stringliteral_1dfd0f6c1c45c98b439ba42de1f172f13bdcb4e52fa0aab0eb24f700130907bd_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 30)
        store_literal_in_memory_1dfd0f6c1c45c98b439ba42de1f172f13bdcb4e52fa0aab0eb24f700130907bd(pos)
        end := add(pos, 32)
    }

    function abi_encode_tuple_t_stringliteral_1dfd0f6c1c45c98b439ba42de1f172f13bdcb4e52fa0aab0eb24f700130907bd__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_1dfd0f6c1c45c98b439ba42de1f172f13bdcb4e52fa0aab0eb24f700130907bd_to_t_string_memory_ptr_fromStack( tail)

    }

    function panic_error_0x12() {
        mstore(0, 35408467139433450592217433187231851964531694900788300625387963629091585785856)
        mstore(4, 0x12)
        revert(0, 0x24)
    }

    function checked_div_t_uint256(x, y) -> r {
        x := cleanup_t_uint256(x)
        y := cleanup_t_uint256(y)
        if iszero(y) { panic_error_0x12() }

        r := div(x, y)
    }

    function checked_mul_t_uint256(x, y) -> product {
        x := cleanup_t_uint256(x)
        y := cleanup_t_uint256(y)
        let product_raw := mul(x, y)
        product := cleanup_t_uint256(product_raw)

        // overflow, if x != 0 and y != product/x
        if iszero(
            or(
                iszero(x),
                eq(y, div(product, x))
            )
        ) { panic_error_0x11() }

    }

    function store_literal_in_memory_8eeba9103ff1a65f51784253ced14ade10b287487acbb374d1acefa7b461176e(memPtr) {

        mstore(add(memPtr, 0), 0xd09dd0b5d0b4d0bed181d182d0b0d182d0bed187d0bdd0be20d181d180d0b5d0)

        mstore(add(memPtr, 32), 0xb4d181d182d0b200000000000000000000000000000000000000000000000000)

    }

    function abi_encode_t_stringliteral_8eeba9103ff1a65f51784253ced14ade10b287487acbb374d1acefa7b461176e_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 39)
        store_literal_in_memory_8eeba9103ff1a65f51784253ced14ade10b287487acbb374d1acefa7b461176e(pos)
        end := add(pos, 64)
    }

    function abi_encode_tuple_t_stringliteral_8eeba9103ff1a65f51784253ced14ade10b287487acbb374d1acefa7b461176e__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_8eeba9103ff1a65f51784253ced14ade10b287487acbb374d1acefa7b461176e_to_t_string_memory_ptr_fromStack( tail)

    }

    function store_literal_in_memory_0e1106fa672b26470167fa2fc4ddb985c7d4f7998b524286fe6daef1cef9524c(memPtr) {

        mstore(add(memPtr, 0), 0xd09fd180d0bed0b4d0b0d0b6d0b020d0bdd0b520d0bdd0b0d187d0b0d0bbd0b0)

        mstore(add(memPtr, 32), 0xd181d18c00000000000000000000000000000000000000000000000000000000)

    }

    function abi_encode_t_stringliteral_0e1106fa672b26470167fa2fc4ddb985c7d4f7998b524286fe6daef1cef9524c_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 36)
        store_literal_in_memory_0e1106fa672b26470167fa2fc4ddb985c7d4f7998b524286fe6daef1cef9524c(pos)
        end := add(pos, 64)
    }

    function abi_encode_tuple_t_stringliteral_0e1106fa672b26470167fa2fc4ddb985c7d4f7998b524286fe6daef1cef9524c__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_0e1106fa672b26470167fa2fc4ddb985c7d4f7998b524286fe6daef1cef9524c_to_t_string_memory_ptr_fromStack( tail)

    }

    function store_literal_in_memory_53716443b7bd7507b39f06ccc77b750f3de24611478eb44557967ec0ab8cc998(memPtr) {

        mstore(add(memPtr, 0), 0xd092d18b20d0b2d18bd188d0bbd0b820d0b7d0b020d0bbd0b8d0bcd0b8d18220)

        mstore(add(memPtr, 32), 0xd0bfd0bed0bad183d0bfd0bad0b820d182d0bed0bad0b5d0bdd0bed0b220d0b7)

        mstore(add(memPtr, 64), 0xd0b020d182d180d0b0d0bdd0b7d0b0d0bad186d0b8d18e000000000000000000)

    }

    function abi_encode_t_stringliteral_53716443b7bd7507b39f06ccc77b750f3de24611478eb44557967ec0ab8cc998_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 87)
        store_literal_in_memory_53716443b7bd7507b39f06ccc77b750f3de24611478eb44557967ec0ab8cc998(pos)
        end := add(pos, 96)
    }

    function abi_encode_tuple_t_stringliteral_53716443b7bd7507b39f06ccc77b750f3de24611478eb44557967ec0ab8cc998__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_53716443b7bd7507b39f06ccc77b750f3de24611478eb44557967ec0ab8cc998_to_t_string_memory_ptr_fromStack( tail)

    }

    function store_literal_in_memory_ff08dc2cec389aedac90b00f3917f95f51ee7d90ee08b21e18775a4737b0beee(memPtr) {

        mstore(add(memPtr, 0), 0xd0a1d0b2d0bed0b1d0bed0b4d0bdd0b0d18f20d0bfd180d0bed0b4d0b0d0b6d0)

        mstore(add(memPtr, 32), 0xb020d0bdd0b520d0bdd0b0d187d0b0d0bbd0b0d181d18c000000000000000000)

    }

    function abi_encode_t_stringliteral_ff08dc2cec389aedac90b00f3917f95f51ee7d90ee08b21e18775a4737b0beee_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 55)
        store_literal_in_memory_ff08dc2cec389aedac90b00f3917f95f51ee7d90ee08b21e18775a4737b0beee(pos)
        end := add(pos, 64)
    }

    function abi_encode_tuple_t_stringliteral_ff08dc2cec389aedac90b00f3917f95f51ee7d90ee08b21e18775a4737b0beee__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_ff08dc2cec389aedac90b00f3917f95f51ee7d90ee08b21e18775a4737b0beee_to_t_string_memory_ptr_fromStack( tail)

    }

    function store_literal_in_memory_e9d88e315c27c4aec88da760f53294ce2c69c3b3e18cd739a1a6a1be3fca549f(memPtr) {

        mstore(add(memPtr, 0), 0xd097d0b0d18fd0b2d0bad0b020d0bdd0b520d181d183d189d0b5d181d182d0b2)

        mstore(add(memPtr, 32), 0xd183d0b5d1820000000000000000000000000000000000000000000000000000)

    }

    function abi_encode_t_stringliteral_e9d88e315c27c4aec88da760f53294ce2c69c3b3e18cd739a1a6a1be3fca549f_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 38)
        store_literal_in_memory_e9d88e315c27c4aec88da760f53294ce2c69c3b3e18cd739a1a6a1be3fca549f(pos)
        end := add(pos, 64)
    }

    function abi_encode_tuple_t_stringliteral_e9d88e315c27c4aec88da760f53294ce2c69c3b3e18cd739a1a6a1be3fca549f__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_e9d88e315c27c4aec88da760f53294ce2c69c3b3e18cd739a1a6a1be3fca549f_to_t_string_memory_ptr_fromStack( tail)

    }

    function store_literal_in_memory_23f5d326b4613253c5c16c6052593399e6c50c014265170439c76820b9569689(memPtr) {

        mstore(add(memPtr, 0), 0xd097d0b0d18fd0b2d0bad0b020d183d0b6d0b520d0bed0b1d180d0b0d0b1d0be)

        mstore(add(memPtr, 32), 0xd182d0b0d0bdd0b0000000000000000000000000000000000000000000000000)

    }

    function abi_encode_t_stringliteral_23f5d326b4613253c5c16c6052593399e6c50c014265170439c76820b9569689_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 40)
        store_literal_in_memory_23f5d326b4613253c5c16c6052593399e6c50c014265170439c76820b9569689(pos)
        end := add(pos, 64)
    }

    function abi_encode_tuple_t_stringliteral_23f5d326b4613253c5c16c6052593399e6c50c014265170439c76820b9569689__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_23f5d326b4613253c5c16c6052593399e6c50c014265170439c76820b9569689_to_t_string_memory_ptr_fromStack( tail)

    }

    function store_literal_in_memory_bd4c9e1c497595afa6caaff76a54f25ef8066e38c710778dda1aa6fbc44ae146(memPtr) {

        mstore(add(memPtr, 0), 0xd0a6d0b5d0bdd0b020d181d0bbd0b8d188d0bad0bed0bc20d0bcd0b0d0bbd0b5)

        mstore(add(memPtr, 32), 0xd0bdd18cd0bad0b0d18f00000000000000000000000000000000000000000000)

    }

    function abi_encode_t_stringliteral_bd4c9e1c497595afa6caaff76a54f25ef8066e38c710778dda1aa6fbc44ae146_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 42)
        store_literal_in_memory_bd4c9e1c497595afa6caaff76a54f25ef8066e38c710778dda1aa6fbc44ae146(pos)
        end := add(pos, 64)
    }

    function abi_encode_tuple_t_stringliteral_bd4c9e1c497595afa6caaff76a54f25ef8066e38c710778dda1aa6fbc44ae146__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_bd4c9e1c497595afa6caaff76a54f25ef8066e38c710778dda1aa6fbc44ae146_to_t_string_memory_ptr_fromStack( tail)

    }

    function store_literal_in_memory_f8b476f7d28209d77d4a4ac1fe36b9f8259aa1bb6bddfa6e89de7e51615cf8a8(memPtr) {

        mstore(add(memPtr, 0), "ERC20: decreased allowance below")

        mstore(add(memPtr, 32), " zero")

    }

    function abi_encode_t_stringliteral_f8b476f7d28209d77d4a4ac1fe36b9f8259aa1bb6bddfa6e89de7e51615cf8a8_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 37)
        store_literal_in_memory_f8b476f7d28209d77d4a4ac1fe36b9f8259aa1bb6bddfa6e89de7e51615cf8a8(pos)
        end := add(pos, 64)
    }

    function abi_encode_tuple_t_stringliteral_f8b476f7d28209d77d4a4ac1fe36b9f8259aa1bb6bddfa6e89de7e51615cf8a8__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_f8b476f7d28209d77d4a4ac1fe36b9f8259aa1bb6bddfa6e89de7e51615cf8a8_to_t_string_memory_ptr_fromStack( tail)

    }

    function store_literal_in_memory_69e1cb86831b6d6a0c34679512dbf0c2b9c6f970cfafd0eb561a98d915be509f(memPtr) {

        mstore(add(memPtr, 0), 0xd092d18b20d183d0b6d0b520d0b7d0b0d180d0b5d0b3d0b8d181d182d180d0b8)

        mstore(add(memPtr, 32), 0xd180d0bed0b2d0b0d0bdd18b0000000000000000000000000000000000000000)

    }

    function abi_encode_t_stringliteral_69e1cb86831b6d6a0c34679512dbf0c2b9c6f970cfafd0eb561a98d915be509f_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 44)
        store_literal_in_memory_69e1cb86831b6d6a0c34679512dbf0c2b9c6f970cfafd0eb561a98d915be509f(pos)
        end := add(pos, 64)
    }

    function abi_encode_tuple_t_stringliteral_69e1cb86831b6d6a0c34679512dbf0c2b9c6f970cfafd0eb561a98d915be509f__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_69e1cb86831b6d6a0c34679512dbf0c2b9c6f970cfafd0eb561a98d915be509f_to_t_string_memory_ptr_fromStack( tail)

    }

    function store_literal_in_memory_1850302625cc2c9c69b5a5614b08ae3977a7a83f63df1f2c45b947dad8e3d265(memPtr) {

        mstore(add(memPtr, 0), 0xd09fd0bed0bbd18cd0b7d0bed0b2d0b0d182d0b5d0bbd18c20d18120d182d0b0)

        mstore(add(memPtr, 32), 0xd0bad0b8d0bc20d0bbd0bed0b3d0b8d0bdd0bed0bc20d183d0b6d0b520d0b7d0)

        mstore(add(memPtr, 64), 0xb0d180d0b5d0b3d0b8d181d182d180d0b8d180d0bed0b2d0b0d0bd0000000000)

    }

    function abi_encode_t_stringliteral_1850302625cc2c9c69b5a5614b08ae3977a7a83f63df1f2c45b947dad8e3d265_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 91)
        store_literal_in_memory_1850302625cc2c9c69b5a5614b08ae3977a7a83f63df1f2c45b947dad8e3d265(pos)
        end := add(pos, 96)
    }

    function abi_encode_tuple_t_stringliteral_1850302625cc2c9c69b5a5614b08ae3977a7a83f63df1f2c45b947dad8e3d265__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_1850302625cc2c9c69b5a5614b08ae3977a7a83f63df1f2c45b947dad8e3d265_to_t_string_memory_ptr_fromStack( tail)

    }

    function store_literal_in_memory_c953f4879035ed60e766b34720f656aab5c697b141d924c283124ecedb91c208(memPtr) {

        mstore(add(memPtr, 0), "ERC20: approve from the zero add")

        mstore(add(memPtr, 32), "ress")

    }

    function abi_encode_t_stringliteral_c953f4879035ed60e766b34720f656aab5c697b141d924c283124ecedb91c208_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 36)
        store_literal_in_memory_c953f4879035ed60e766b34720f656aab5c697b141d924c283124ecedb91c208(pos)
        end := add(pos, 64)
    }

    function abi_encode_tuple_t_stringliteral_c953f4879035ed60e766b34720f656aab5c697b141d924c283124ecedb91c208__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_c953f4879035ed60e766b34720f656aab5c697b141d924c283124ecedb91c208_to_t_string_memory_ptr_fromStack( tail)

    }

    function store_literal_in_memory_24883cc5fe64ace9d0df1893501ecb93c77180f0ff69cca79affb3c316dc8029(memPtr) {

        mstore(add(memPtr, 0), "ERC20: approve to the zero addre")

        mstore(add(memPtr, 32), "ss")

    }

    function abi_encode_t_stringliteral_24883cc5fe64ace9d0df1893501ecb93c77180f0ff69cca79affb3c316dc8029_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 34)
        store_literal_in_memory_24883cc5fe64ace9d0df1893501ecb93c77180f0ff69cca79affb3c316dc8029(pos)
        end := add(pos, 64)
    }

    function abi_encode_tuple_t_stringliteral_24883cc5fe64ace9d0df1893501ecb93c77180f0ff69cca79affb3c316dc8029__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_24883cc5fe64ace9d0df1893501ecb93c77180f0ff69cca79affb3c316dc8029_to_t_string_memory_ptr_fromStack( tail)

    }

    function store_literal_in_memory_3b6607e091cba9325f958656d2b5e0622ab7dc0eac71a26ac788cb25bc19f4fe(memPtr) {

        mstore(add(memPtr, 0), "ERC20: insufficient allowance")

    }

    function abi_encode_t_stringliteral_3b6607e091cba9325f958656d2b5e0622ab7dc0eac71a26ac788cb25bc19f4fe_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 29)
        store_literal_in_memory_3b6607e091cba9325f958656d2b5e0622ab7dc0eac71a26ac788cb25bc19f4fe(pos)
        end := add(pos, 32)
    }

    function abi_encode_tuple_t_stringliteral_3b6607e091cba9325f958656d2b5e0622ab7dc0eac71a26ac788cb25bc19f4fe__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_3b6607e091cba9325f958656d2b5e0622ab7dc0eac71a26ac788cb25bc19f4fe_to_t_string_memory_ptr_fromStack( tail)

    }

    function store_literal_in_memory_baecc556b46f4ed0f2b4cb599d60785ac8563dd2dc0a5bf12edea1c39e5e1fea(memPtr) {

        mstore(add(memPtr, 0), "ERC20: transfer from the zero ad")

        mstore(add(memPtr, 32), "dress")

    }

    function abi_encode_t_stringliteral_baecc556b46f4ed0f2b4cb599d60785ac8563dd2dc0a5bf12edea1c39e5e1fea_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 37)
        store_literal_in_memory_baecc556b46f4ed0f2b4cb599d60785ac8563dd2dc0a5bf12edea1c39e5e1fea(pos)
        end := add(pos, 64)
    }

    function abi_encode_tuple_t_stringliteral_baecc556b46f4ed0f2b4cb599d60785ac8563dd2dc0a5bf12edea1c39e5e1fea__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_baecc556b46f4ed0f2b4cb599d60785ac8563dd2dc0a5bf12edea1c39e5e1fea_to_t_string_memory_ptr_fromStack( tail)

    }

    function store_literal_in_memory_0557e210f7a69a685100a7e4e3d0a7024c546085cee28910fd17d0b081d9516f(memPtr) {

        mstore(add(memPtr, 0), "ERC20: transfer to the zero addr")

        mstore(add(memPtr, 32), "ess")

    }

    function abi_encode_t_stringliteral_0557e210f7a69a685100a7e4e3d0a7024c546085cee28910fd17d0b081d9516f_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 35)
        store_literal_in_memory_0557e210f7a69a685100a7e4e3d0a7024c546085cee28910fd17d0b081d9516f(pos)
        end := add(pos, 64)
    }

    function abi_encode_tuple_t_stringliteral_0557e210f7a69a685100a7e4e3d0a7024c546085cee28910fd17d0b081d9516f__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_0557e210f7a69a685100a7e4e3d0a7024c546085cee28910fd17d0b081d9516f_to_t_string_memory_ptr_fromStack( tail)

    }

    function store_literal_in_memory_4107e8a8b9e94bf8ff83080ddec1c0bffe897ebc2241b89d44f66b3d274088b6(memPtr) {

        mstore(add(memPtr, 0), "ERC20: transfer amount exceeds b")

        mstore(add(memPtr, 32), "alance")

    }

    function abi_encode_t_stringliteral_4107e8a8b9e94bf8ff83080ddec1c0bffe897ebc2241b89d44f66b3d274088b6_to_t_string_memory_ptr_fromStack(pos) -> end {
        pos := array_storeLengthForEncoding_t_string_memory_ptr_fromStack(pos, 38)
        store_literal_in_memory_4107e8a8b9e94bf8ff83080ddec1c0bffe897ebc2241b89d44f66b3d274088b6(pos)
        end := add(pos, 64)
    }

    function abi_encode_tuple_t_stringliteral_4107e8a8b9e94bf8ff83080ddec1c0bffe897ebc2241b89d44f66b3d274088b6__to_t_string_memory_ptr__fromStack_reversed(headStart ) -> tail {
        tail := add(headStart, 32)

        mstore(add(headStart, 0), sub(tail, headStart))
        tail := abi_encode_t_stringliteral_4107e8a8b9e94bf8ff83080ddec1c0bffe897ebc2241b89d44f66b3d274088b6_to_t_string_memory_ptr_fromStack( tail)

    }

}
