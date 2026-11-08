#!/usr/bin/env python3
"""Synthesizes Wortschatz's game sounds (original, no samples):
correct, wrong, combo, round_end. 44.1 kHz mono 16-bit WAV.

  python3 -I tool/sfx/make_sfx.py assets/sfx
"""
import math, struct, sys, wave, pathlib

RATE = 44100
out = pathlib.Path(sys.argv[1]); out.mkdir(parents=True, exist_ok=True)

def tone(freq, dur, vol=0.5, decay=6.0, glide=0.0, harm=0.25):
    n = int(RATE * dur); s = []
    for i in range(n):
        t = i / RATE
        f = freq + glide * t / dur
        env = math.exp(-decay * t) * min(1.0, t / 0.004)  # 4 ms attack
        x = math.sin(2 * math.pi * f * t) + harm * math.sin(4 * math.pi * f * t)
        s.append(vol * env * x / (1 + harm))
    return s

def seq(*parts, gap=0.0):
    s = []
    for p in parts:
        s += p + [0.0] * int(RATE * gap)
    return s

def write(name, samples):
    with wave.open(str(out / f'{name}.wav'), 'wb') as w:
        w.setnchannels(1); w.setsampwidth(2); w.setframerate(RATE)
        w.writeframes(b''.join(struct.pack('<h', int(max(-1, min(1, v)) * 32767)) for v in samples))

C5, E5, G5, C6, E6, G6 = 523.25, 659.25, 783.99, 1046.5, 1318.5, 1568.0
write('correct', seq(tone(C6, 0.09, 0.45, 18), tone(E6, 0.16, 0.45, 14)))
write('wrong', tone(220, 0.18, 0.5, 14, glide=-60, harm=0.4))
write('combo', seq(tone(C6, 0.05, 0.35, 25), tone(E6, 0.05, 0.35, 25), tone(G6, 0.14, 0.4, 16)))
write('round_end', seq(tone(C5, 0.10, 0.4, 10), tone(E5, 0.10, 0.4, 10), tone(G5, 0.10, 0.4, 10), tone(C6, 0.55, 0.45, 5)))
print('sfx written to', out)
