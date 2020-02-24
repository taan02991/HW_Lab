def toBCD(value, bits):
    s = str(value)
    result = ''
    for i in range(len(s)):
        result += bin(int(s[i])).replace("0b", "").zfill(4)
    return result.zfill(bits)

for op in range(4):
    for i in range(16):
        for j in range(16):
            addr = str(op*256 + i*16 + j)
            if op == 0:
                print(toBCD(i+j, 12) + ' //addr = ' + addr)
            elif op == 1:
                if j > i:
                    print(toBCD(0, 12) + ' //addr = ' + addr)
                else:
                    print(toBCD(i-j, 12) + ' //addr = ' + addr)
            elif op == 2:
                print(toBCD(i*j, 12) + ' //addr = ' + addr)
            else:
                if j == 0:
                   print(toBCD(0, 12) + ' //addr = ' + addr)
                else:
                    print(toBCD(int(i/j), 12) + ' //addr = ' + addr)
    
## 1 8 4 = 256 + 8*15
