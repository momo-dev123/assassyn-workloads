'''The AST node module for constant values.'''

from .value import Value
from .dtype import Bits

class Const(Value):
    '''The AST node data structure for constant values.'''

    def __init__(self, dtype, value):
        assert dtype.inrange(value), f"Value {value} is out of range for {dtype}"
        self.dtype = dtype
        self.value = value

    def __repr__(self):
        return f'({self.value}:{self.dtype})'

    def as_operand(self):
        '''Dump the constant as an operand.'''
        return repr(self)

    def __getitem__(self, x):
        '''Override the value slicing operation.'''
        bits = x.stop - x.start + 1
        assert 0 < bits <= 32, "TODO: Support more than 32 bits later"
        assert self.dtype.bits >= bits, f"Got {self.dtype.bits} bits, but {bits} bits are needed"
        dtype = Bits(bits)
        return Const(dtype, (self.value >> x.start) & ((1 << bits) - 1))

    def concat(self, other):
        '''Concatenate two values together.'''

        if isinstance(other, Const):
            shift = other.dtype.bits
            return Bits(shift + self.dtype.bits)((self.value << shift) | other.value)

        return super().concat(other)


def _const_impl(dtype, value: int):
    '''The syntax sugar for creating a constant'''
    #pylint: disable=import-outside-toplevel
    return Const(dtype, value)
