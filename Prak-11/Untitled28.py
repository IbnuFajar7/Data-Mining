#!/usr/bin/env python
# coding: utf-8

# In[1]:


import numpy as np # linear algebra
import pandas as pd # data processing, CSV file I/O (e.g. pd.read_csv)


# In[2]:


def step_activation(z):
    if z>0:
        f_z = 1
    else:
        f_z = 0
    return f_z


# In[3]:


def sign_activation(z):
    if z>=0:
        f_z = 1
    else:
        f_z = -1
    return f_z


# In[4]:


import math

def sigmoid_activation(z):
    return 1 / (1 + math.exp(-z))


# In[5]:


data = np.array([[1,0,0,-1],[1,0,1,1],[1,1,0,1],[1,1,1,1],[0,0,1,-1],[0,1,0,-1],[0,1,1,1],[0,0,0,-1]])
m,n = data.shape
print(m,n)

X = data[:,:-1]
y = data[:,n-1]
print(X)
print(y)


# In[6]:


def perceptron(X,y,lr, epochs):
    m,n = X.shape
    #inisiasi bobot wi 
    w = np.zeros((n+1,1))
    str_w = ' '.join([str(elem) for elem in w])
    print(f'w ke 0:{str_w}')
    n_miss_list=[]
    for epoch in range(epochs):
        print(f'epoch: {epoch}')
        n_miss =0
        for idx, x_i in enumerate(X):
           # print(idx)
            #print(x_i)
            # tambahkan w0 (bias)pada posisi kolom ke 0
            x_i = np.insert(x_i,0,1).reshape(-1,1)
            #print(x_i)
            #hitung y_hat
           # y_hat = step_activation(np.dot(x_i.T,w))
            #y_hat = sign_activation(np.dot(x_i.T,w))
            y_hat = sigmoid_activation(np.dot(x_i.T,w))
            #update bobot jika 
            delta = y[idx] - y_hat
            print(f'y:{y[idx]}')
            print(f'y_hat:{y_hat}')
            print(f'delta:{delta}')
            squeze = np.squeeze(delta)
            #print(f'sq:{squeze}')
            if squeze!=0:
                w += lr*((y[idx] - y_hat)*x_i)
                n_miss += 1
            str_w = ' '.join([str(elem) for elem in w])
            print(f'w ke {idx}:{str_w}')
        n_miss_list.append(n_miss)
    return w, n_miss_list


# In[7]:


w, nmiss_list = perceptron(X,y,0.1,7)


# In[8]:


import numpy as np # linear algebra
import pandas as pd # data processing, CSV file I/O (e.g. pd.read_csv)


# In[9]:


from random import seed
from random import random
import math


# In[10]:


# Initialize a network
def initialize_network(n_inputs, n_hidden, n_outputs):
  network = list()
  hidden_layer = [{'weights':[random() for i in range(n_inputs + 1)]} for i in range(n_hidden)]
  network.append(hidden_layer)
  output_layer = [{'weights':[random() for i in range(n_hidden + 1)]} for i in range(n_outputs)]
  network.append(output_layer)
  return network

seed(1)
network = initialize_network(2, 1, 2)
for layer in network:
  print(layer)


# In[11]:


# Calculate neuron activation for an input
def activate(weights, inputs):
  activation = weights[-1]
  for i in range(len(weights)-1):
    activation += weights[i] * inputs[i]
  return activation

# Transfer neuron activation
def transfer(activation):
  return 1.0 / (1.0 + math.exp(-activation))


# In[12]:


# Forward propagate input to a network output
def forward_propagate(network, row):
  inputs = row
  for layer in network:
    new_inputs = []
    for neuron in layer:
      activation = activate(neuron['weights'], inputs)
      neuron['output'] = transfer(activation)
      new_inputs.append(neuron['output'])
    inputs = new_inputs
  return inputs


# In[13]:


# Data network
network = [[{'weights': [0.13436424411240122, 0.8474337369372327, 0.763774618976614]}],           [{'weights': [0.2550690257394217, 0.49543508709194095]}, {'weights': [0.4494910647887381, 0.651592972722763]}]]
row = [1, 0, None]
output = forward_propagate(network, row)
print(output)


# In[14]:


# using the sigmoid transfer function, the derivative: 
# derivative = output * (1.0 - output)
# Calculate the derivative of an neuron output
def transfer_derivative(output):
  return output * (1.0 - output)


# In[15]:


# error = (expected - output) * transfer_derivative(output)
# Backpropagate error and store in neurons
def backward_propagate_error(network, expected):
  for i in reversed(range(len(network))):
    layer = network[i]
    errors = list()
    if i != len(network)-1:
      for j in range(len(layer)):
        error = 0.0
        for neuron in network[i + 1]:
          error += (neuron['weights'][j] * neuron['delta'])
        errors.append(error)
    else:
      for j in range(len(layer)):
        neuron = layer[j]
        errors.append(expected[j] - neuron['output'])
    for j in range(len(layer)):
      neuron = layer[j]
      neuron['delta'] = errors[j] * transfer_derivative(neuron['output'])


# In[16]:


# Calculate the derivative of an neuron output
def transfer_derivative(output):
  return output * (1.0 - output)


# In[17]:


# Backpropagate error and store in neurons
def backward_propagate_error(network, expected):
  for i in reversed(range(len(network))):
    layer = network[i]
    errors = list()
    if i != len(network)-1:
      for j in range(len(layer)):
        error = 0.0
        for neuron in network[i + 1]:
          error += (neuron['weights'][j] * neuron['delta'])
        errors.append(error)
    else:
      for j in range(len(layer)):
        neuron = layer[j]
        errors.append(expected[j] - neuron['output'])
    for j in range(len(layer)):
      neuron = layer[j]
      neuron['delta'] = errors[j] * transfer_derivative(neuron['output'])


# In[18]:


# test backpropagation of error
network = [[{'output': 0.7105668883115941, 'weights': [0.13436424411240122, 0.8474337369372327, 0.763774618976614]}],
    [{'output': 0.6213859615555266, 'weights': [0.2550690257394217, 0.49543508709194095]}, {'output': 0.6573693455986976, 'weights': [0.4494910647887381, 0.651592972722763]}]]
expected = [0, 1]
backward_propagate_error(network, expected)
for layer in network:
  print(layer)


# In[19]:


#update bobot
# weight = weight + learning_rate * error * input
# Update network weights with error
def update_weights(network, row, l_rate):
  for i in range(len(network)):
    inputs = row[:-1]
    if i != 0:
      inputs = [neuron['output'] for neuron in network[i - 1]]
    for neuron in network[i]:
      for j in range(len(inputs)):
        neuron['weights'][j] += l_rate * neuron['delta'] * inputs[j]
      neuron['weights'][-1] += l_rate * neuron['delta']


# In[20]:


# Train a network for a fixed number of epochs
def train_network(network, train, l_rate, n_epoch, n_outputs):
  for epoch in range(n_epoch):
    sum_error = 0
    for row in train:
      outputs = forward_propagate(network, row)
      expected = [0 for i in range(n_outputs)]
      expected[row[-1]] = 1
      sum_error += sum([(expected[i]-outputs[i])**2 for i in range(len(expected))])
      backward_propagate_error(network, expected)
      update_weights(network, row, l_rate)
    print('&gt;epoch=%d, lrate=%.3f, error=%.3f' % (epoch, l_rate, sum_error))


# In[21]:


# Test training backprop algorithm
seed(1)
dataset = [[2.7810836,2.550537003,0],
  [1.465489372,2.362125076,0],
  [3.396561688,4.400293529,0],
  [1.38807019,1.850220317,0],
  [3.06407232,3.005305973,0],
  [7.627531214,2.759262235,1],
  [5.332441248,2.088626775,1],
  [6.922596716,1.77106367,1],
  [8.675418651,-0.242068655,1],
  [7.673756466,3.508563011,1]]
n_inputs = len(dataset[0]) - 1
n_outputs = len(set([row[-1] for row in dataset]))
network = initialize_network(n_inputs, 2, n_outputs)
train_network(network, dataset, 0.5, 20, n_outputs)
for layer in network:
  print(layer)


# In[22]:


# Make a prediction with a network
def predict(network, row):
  outputs = forward_propagate(network, row)
  return outputs.index(max(outputs))


# In[23]:


# Test making predictions with the network
dataset = [[2.7810836,2.550537003,0],
  [1.465489372,2.362125076,0],
  [3.396561688,4.400293529,0],
  [1.38807019,1.850220317,0],
  [3.06407232,3.005305973,0],
  [7.627531214,2.759262235,1],
  [5.332441248,2.088626775,1],
  [6.922596716,1.77106367,1],
  [8.675418651,-0.242068655,1],
  [7.673756466,3.508563011,1]]
network = [[{'weights': [-1.482313569067226, 1.8308790073202204, 1.078381922048799]}, {'weights': [0.23244990332399884, 0.3621998343835864, 0.40289821191094327]}],
  [{'weights': [2.5001872433501404, 0.7887233511355132, -1.1026649757805829]}, {'weights': [-2.429350576245497, 0.8357651039198697, 1.0699217181280656]}]]
for row in dataset:
  prediction = predict(network, row)
  print('Expected=%d, Got=%d' % (row[-1], prediction))


# In[ ]:




