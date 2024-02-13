read_file -format verilog {[lindex $argv 1].v}
set link_library /home/student/labs/Chandru/saed90nm_max.db
uplevel #0 {report_power -net -cell -analysis_effort low} > [lindex $argv 1]_power.txt
write_parasitics -output "[lindex $argv 1]_rc.txt"