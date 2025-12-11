import numpy as np
import matplotlib.pyplot as plt

# Create a random number generator
seed = 42
rng = np.random.default_rng(seed)

# Create some random data
x = np.linspace(0, 100, 1000)
y = np.linspace(0, 10, 1000) + rng.normal(0, 1, 1000)

# Plot a scatterplot
fig,ax = plt.subplots()
ax.plot(x, y, 'r+')
fig.savefig('example_plot.png')