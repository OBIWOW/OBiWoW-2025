try:
    import numpy as np
except ImportError:
    print ('Cannot import numpy')

try:
    raise Exception('I do not like this code')
except Exception:
    # I could ignore it here
    pass
    # Or not
    # raise

def add(x, y):
    temp = x + y
    print ('{} + {} = {}'.format(x, y, temp))
    return temp

a = 2
b = 3
c = list(range(5))
print (c[add(a,b)])

class Testing:
    def __init__(self, message, setting) -> None:
        self.setting = setting
        self.do_something(message)

    def do_something(self, message, setting=True):
        if setting:
            print (message.upper())
            print ('Setting was set')
        else:
            print (message)
            print ('Setting was not set')

message = 'Hello world!'
t1 = Testing(message, True)
t2 = Testing(message, False)