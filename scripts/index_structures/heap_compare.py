
import sys
import random
from collections import deque

def heap_val(h, x):
  return h[x][0]

def heap_swap(h, x1, x2):
  tmp = h[x1]
  h[x1] = h[x2]
  h[x2] = tmp

def heap_fixup(h, x):
  while x > 1 and heap_val(h, x/2) > heap_val(h, x):
    heap_swap(h, x/2, x)
    x = x/2

def heap_next(h):
  v = heap_val(h, 1)

  done = run_pop(h[1])
  if done:
    # run is finished, remove from heap
    if len(h) > 2:
      # more runs
      h[1] = h.pop()
      # uncache outcome
      h[0] = 0
    else:
      # no more runs
      h.pop()
      return v, 0, 0

  ncmp = 0
  ocmp = 0

  # run not finished, fix heap
  #print 'before fix', h
  k = 1
  nruns = len(h) - 1
  while 2*k <= nruns:
    j = 2*k

    if j < nruns:
      ncmp += 1
      if k > 1 or h[0] == 0:
        # cached comparison can't be used
        ocmp += 1
      if k == 1:
        # cache outcome
        h[0] = 1
      if heap_val(h, j) > heap_val(h,j+1):
        j += 1

    ncmp += 1
    ocmp += 1
    if heap_val(h,k) <= heap_val(h,j):
      break

    if k == 1:
      # uncache outcome
      h[0] = 0

    heap_swap(h, k, j)
    k = j

  #print 'after fix', h
  return v, ncmp, ocmp

def heap_insert(h, v):
  h.append(v)
  heap_fixup(h, len(h)-1)

def run_pop(run):
  run.popleft()
  if len(run):
    return False
  else:
    return True
    
def main(argv):
  h = [0]
  nval = 0
  for a in argv:
    a = int(a)
    nval += a
    run = [random.randint(0, 1000000000) for x in xrange(a)]
    run.sort()
    d = deque()
    for x in run:
      d.append(x)
    #print run
    heap_insert(h, d)
    #print h

  lastv = -1
  ncmp = 0
  ocmp = 0
  while len(h) > 1:
    (v, c1, c2) = heap_next(h)
    ncmp += c1
    ocmp += c2
    #print 'produce %d' % v
    assert v >= lastv
    lastv = v
  print 'nval = %d, ncmp = %d, ocmp = %d, ncmp/v = %.2f, ocmp/v = %.2f' % (
    nval, ncmp, ocmp, (1.0*ncmp) / nval, (1.0*ocmp) / nval)

if __name__ == '__main__':
  sys.exit(main(sys.argv[1:]))

