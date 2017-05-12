require 'mlist'

function usagetest()
  local mlist = new_mlist()
  local r = {}
  for i=1, 100000 do
  	r[#r+1] = i
  	mlist:push(i)
  end
  
  local t 
  
  t = mlist:pop_tail_t(1000)
  assert(t[#t] == 100000)
  assert(#t == 1000)
  assert(mlist:len() == 99000)
  
  t = mlist:tail_t(1000)
  assert(t[#t] == 99000)
  assert(#t == 1000)
  assert(mlist:len() == 99000)
  
  
  t = mlist:pop_front_t(1000)
  
  assert(t[#t] == 1000)
  assert(t[1] == 1)
  assert(#t == 1000)
  assert(mlist:len() == 98000)
  
  t = mlist:front_t(1000)
  
  assert(t[#t] == 2000)
  assert(t[1] == 1001)
  assert(#t == 1000)
  assert(mlist:len() == 98000)
  
  for i=1, 2000 do
  	mlist:push(i)
  end
  
  t = mlist:front_t(1000)
  
  assert(t[#t] == 2000)
  assert(t[1] == 1001)
  assert(#t == 1000)
  assert(mlist:len() == 100000)
  
  
  for i=2000, 1, -1 do
  	mlist:prepend(i)
  end
  
  t = mlist:front_t(1000)
  
  assert(t[#t] == 1000)
  assert(t[1] == 1)
  assert(#t == 1000)
  assert(mlist:len() == 102000)
  
  t = mlist:pop_front_t(2000)
  
  assert(t[#t] == 2000)
  assert(t[1] == 1)
  assert(#t == 2000)
  assert(mlist:len() == 100000)
  
  
  mlist:each(function (k, v, vindex) 
    if (vindex == 1) then assert(v == 1001) end
    if (vindex == 100000) then assert(v == 2000) end
  end)
  
  local vindex2 = 0
  mlist:each(function (k, v, vindex) 
    vindex2 = vindex
    if (vindex == 5000)  then return false end
  end)
  
  assert(vindex2 == 5000)
  
  assert(mlist:kat(1) == nil)
  assert(mlist:kat(mlist:len()) == nil)
  
  assert(mlist:at(1) == 1001)
  assert(mlist:at(mlist:len()) == 2000)
  
  mlist['plop'] = 'moot'
  mlist:insert('plip', 'woot')
  mlist:value('')
  
  assert(mlist['plop'] == 'moot')
  assert(mlist['plip'] == 'woot')
  assert(mlist:len() == 100002)
  t = mlist:list()
  assert(t[#t] == mlist:at(mlist:len()))
  assert(t[1] == mlist:at(1))
  
  assert(mlist:map()['plop'] == 'moot')
  assert(mlist:map()['plip'] == 'woot')
end

collectgarbage()
print('before ', collectgarbage("count"))
usagetest()
print('after', collectgarbage("count"))
collectgarbage()
print('after gc', collectgarbage("count"))
