import { customAlphabet, nanoid } from 'nanoid'

export const newNanoIDImpl = (length) => () => nanoid(length)

export const newCustomNanoIDImpl = (alphabet) => (length) => customAlphabet(alphabet, length)  // customAlphabet returns a new function

