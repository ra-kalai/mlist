mlist
=====

About
-----

An ordered map-list structure

Usage
-----

Import the module using something like

    require 'mlist'

Create a mlist object by calling the function __new_mlist__

the following method are available on an __mlist__ object

* __push__(v) : list[#list + 1] = v
* __prepend__(v) :  list[-1] = v
* __push_kv__(k, v) : list[#list + 1] = v ; map[k] = v
* __prepend_kv__(k, v) : list[-1] = v ; map[k] = v
* __insert__(k, v) : alias of __push_kv__

* __pop_tail__(n)  :  *pop* && return list[#list-n], ...,  list[#list] 
* __pop_tail_t__(n)  : *pop* && return {list[#list-n], ..., list[#list]]}
* __tail__(n)  :  return list[#list-n], ...,  list[#list] 
* __tail_t__(n)  : return {list[#list-n], ..., list[#list]]}

* __pop_front__(n)  :  *pop* && return list[1], ...,  list[n]
* __pop_front_t__(n)  : *pop* && return {list[1], ..., list[n]]}
* __front__(n)  :  return list[1], ...,  list[n]
* __front_t__(n)  : return  {list[1], ..., list[n]]}

* __map__(n)  : return map
* __list__(n)  : return list
* __len__(v) : return #list
* __value__(v) : return map[k]
* __at__(v) : return list[i]
* __kat__(v) : return key of item at list[i]

* __each__(function (k, v, vindex) --[[ return false to break ]]-- end) : loop over the set

Contact
-------

Please send bug reports, patches and feature requests to me <ra@apathie.net>.
