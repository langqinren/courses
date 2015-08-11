from nltk.corpus import wordnet as wn

panda = wn.synset('panda.n.01')
hyper = lambda s : s.hypernyms()

for x in list(panda.closure(hyper)):
    print x