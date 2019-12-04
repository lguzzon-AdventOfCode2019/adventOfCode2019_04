
import unittest

import adventOfCode2019_04
import adventOfCode2019_04/consts


suite "unit-test suite":
    test "getMessage":
        assert(cHelloWorld == getMessage())
