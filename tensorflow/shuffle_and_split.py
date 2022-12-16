import os
import pandas as pd

BASE_DIR = os.getcwd()
DATA_DIR = os.path.join(BASE_DIR, "tensorflow", "data")

# load all data
df = pd.read_csv(os.path.join(DATA_DIR, "data_entire_eachSub.csv"), header=None)

# shuffle data
df = df.sample(frac = 1)

# find splitting index
n_rows = len(df.index)
n_split = int(n_rows * 0.8)

# split data
train = df.iloc[:n_split,:]
test = df.iloc[n_split:,:]

# save data
train.to_csv(os.path.join(DATA_DIR, 'train.csv'), index=False, header=False)
test.to_csv(os.path.join(DATA_DIR, 'test.csv'), index=False, header=False)