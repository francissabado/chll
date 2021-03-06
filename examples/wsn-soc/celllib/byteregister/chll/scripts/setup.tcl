#!flowproc
#
# Setup the cell
#

# remove the following two lines
#puts "ERROR: You have to edit this file [info script] before executing."
#exit 1

puts "################################################################################"
puts "## Setup Cell $CELL_NAME"

create_cell "$CELL_NAME"

puts "## Adding ports, parameters, ..."
cell_add_port "Reset_n_i" -map "Reset_n_i"
cell_add_port "Clk_i"     -map "Clk_i"
# value
cell_add_port "D_i"       -in  -conntype "Byte"
cell_add_port "Q_o"       -out -conntype "Byte"
# control
cell_add_port "Enable_i"  -in  -conntype "Bit"

