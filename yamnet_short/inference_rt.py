import pyaudio # Soundcard audio I/O access library
import soundfile as sf
import matplotlib.pyplot as plt
import numpy as np

# Setup channel info
FORMAT = pyaudio.paInt16 # data type formate
CHANNELS = 1 # Adjust to your number of channels
RATE = 16000 # Sample Rate
CHUNK = 1024 # Block Size
RECORD_SECONDS = 5 # Record time
WAVE_OUTPUT_FILENAME = "file.wav"

# Startup pyaudio instance
audio = pyaudio.PyAudio()
# %matplotlib qt

# start Recording
stream = audio.open(format=FORMAT, channels=CHANNELS,
                rate=RATE, input=True,
                frames_per_buffer=CHUNK)
print("recording...")

fig, axes = plt.subplots(nrows=1)
fig.show()
fig.canvas.draw()


while 1==1:
    frames = []
    # Record for RECORD_SECONDS
    for i in range(0, int(RATE / CHUNK * RECORD_SECONDS)):
        data = stream.read(CHUNK)
        frames.append(data)

    bytes = b''.join(frames)
    data_s16 = np.frombuffer(bytes, dtype=np.int16, count=len(bytes)//2, offset=0)
    float_data = data_s16 * 0.5**15
    print(float_data)
    plt.plot(float_data[:100])    
    plt.pause(0.001)

# # Stop Recording
stream.stop_stream()
stream.close()
audio.terminate()
