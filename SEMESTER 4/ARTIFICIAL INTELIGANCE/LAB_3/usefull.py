from random import uniform


def generateNewValue(x, y):
    return (int)(uniform(x, y))


def bin_to_int(bits):
    # Ensure that the input is a list of binary digits
    if not all(bit in (0, 1) for bit in bits):
        raise ValueError("Input must be a list of binary digits (0s and 1s)")

    # Convert the binary digits to an integer value
    value = 0
    for bit in bits:
        value = value * 2 + bit

    return value
