import re

def uncomm(text: str, line: str):
    """
    Uncomment a specific line from given text
    
    Parameters
    --
    text: given text
    line: specific line to uncomment
    """
    return re.sub(fr'#{line}', f'{line}', text)