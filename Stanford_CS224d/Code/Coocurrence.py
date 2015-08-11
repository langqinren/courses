import numpy as np


def compCoocurrenceMatrix(corpus):

    for doc in corpus:
        print doc.split()
    return 1



doc1   = "i like deep learning"
doc2   = "i like nlp"
doc3   = "i enjoy flying"
corpus = [doc1, doc2, doc3]


comatrix = compCoocurrenceMatrix(corpus)