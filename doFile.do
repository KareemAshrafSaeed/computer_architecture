project compileall
vsim work.alu
add wave sim:/alu/A
add wave sim:/alu/B
add wave sim:/alu/cin
add wave sim:/alu/sel
add wave sim:/alu/F
add wave sim:/alu/cout


##################################
force sim:/alu/A 11110000
force sim:/alu/B 10110000
force sim:/alu/sel 0100
run 10ns

force sim:/alu/A 11110000
force sim:/alu/B 00001011
force sim:/alu/sel 0101
run 10ns

force sim:/alu/A 11110000
force sim:/alu/B 10110000
force sim:/alu/sel 0110
run 10ns

force sim:/alu/A 11110000
force sim:/alu/B UUUUUUUU
force sim:/alu/sel 0111
run 10ns
###################################

force sim:/alu/A 11110000
force sim:/alu/sel 1000
run 10ns

force sim:/alu/A 11110000
force sim:/alu/sel 1001
run 10ns

force sim:/alu/A 11110000
force sim:/alu/sel 1010
force sim:/alu/cin 0
run 10ns

force sim:/alu/A 11110000
force sim:/alu/sel 1011
force sim:/alu/cin U
run 10ns

force sim:/alu/A 11110000
force sim:/alu/sel 1100
run 10ns

force sim:/alu/A 11110000
force sim:/alu/sel 1101
run 10ns

force sim:/alu/A 11110000
force sim:/alu/sel 1110
force sim:/alu/cin 0
run 10ns

force sim:/alu/A 11110000
force sim:/alu/sel 1111
force sim:/alu/cin U
run 10ns

force sim:/alu/A 11110000
force sim:/alu/sel 1010
force sim:/alu/cin 1
run 10ns

force sim:/alu/A 11110000
force sim:/alu/sel 1110
force sim:/alu/cin 1
run 10ns
