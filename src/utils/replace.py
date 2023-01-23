import re

def replace(pattern: str, repl: str, text: str):
    """
    Return the result of replacing the replacement repl with the pattern in the given text.
    
    Parameters
    --
    pattern: pattern which will be found and replaced
    repl: replacement of pattern
    text: given text
    """
    return re.sub(pattern, repl, text)