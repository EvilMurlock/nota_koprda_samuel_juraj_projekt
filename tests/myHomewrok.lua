print ("Hello, World!")
--[[Practice loops
Given number N, print all numbers up to N.
Given number N, print every odd number up to N without using an if.
Given number N, print all numbers up to N in reverse order.
]]
print("Practice loops")
N = 10

for i=0,N,1 do
  print(i)
end

for i=0,N,2 do
  print(i)
end

for i=N,0,-1 do
  print(i)
end


--[[
Practice arrays
Given an array of numbers, print the sum of all of them.
Given an array of numbers, print the index of the largest number.
Given number N, make an array containing the squares of every number up to N.
Given an array of numbers and a number N, print the N-th odd number in the array.
]]
print("Practice arrays")
testray = {1,2,3,4,5}
sum = 0
max = nil
max_index = nil
for i,val in pairs(testray) do
  sum = sum + val
  if max == nil then
    max = val
    max_index = i end
  if max < val then
    max = val
    max_index = i end
end

print(sum)

print(max_index)

squarearay = {}

for i=1,N,1 do
  squarearay[i] = i^2
  print(squarearay[i])
end

--[[
Practice arrays vs. tables
Given an array, print every element and its index.
Given a table, print every element and its key.
Given an array, count the number of its elements.
Given a table, count the number of its elements.
Given an array, determine if it is empty.
Given a table, determine if it is empty.
]]
print("Practice arrays vs. tables")
for i,val in pairs(testray) do
  print(val .. " " .. i)
end

table_with_keys = {["first"] = "king", second = "prince", third = "duke"}

for i,val in pairs(table_with_keys) do
  print(val .. " " .. i)
end



print("Array has : " .. #testray .. " elemetns")


elem_count = 0
for i,val in pairs(table_with_keys) do
  elem_count = elem_count +1
end
print("Table has : " .. elem_count .. " elemetns")

empty_array = {}
if(#empty_array == 0) then
  print("Array is empty")
end

empty_table = {}
elem_count = 0
for i,val in pairs(empty_table) do
  elem_count = elem_count +1
end
if(elem_count == 0) then
  print("Table is empty")
end

--[[Practice tables in basic applications
Create a function that can print any boolean, number, string, array or table; arrays and. tables may themselves contain arrays and tables.
a function that takes an array and a predicate, and returns an array of all elements that pass the predicate.
]]
print("Practice tables in basic applications")
function funkyPrinter(toPrintRec)
  if(type(toPrintRec) == "table") then
    for i,val in pairs(toPrintRec) do
      funkyPrinter(val)
    end
  else
    print(toPrintRec)
  end
end


funkyPrinter({1,2,{"yep"}})


function evenPred(x)
  if(x%2 == 0) then 
    return true
  else
    return false
  end
end


function pickAndChooser(myray, pred)
  newRay = {}
  for _,val in pairs(myray) do
      if(pred(val)) then
        newRay[#newRay+1] = val
    end
  end
  return newRay
end

choosingArray = {1,2,3,4,5,6}
print("Choosing based on prediacte")
for _,val in pairs(pickAndChooser(choosingArray,evenPred)) do
  print(val)
end





