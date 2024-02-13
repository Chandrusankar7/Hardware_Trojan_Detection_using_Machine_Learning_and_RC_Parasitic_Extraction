csh
source setup_18.csh
dc_shell -batch -tcl report_extractor.tcl $1
dc_shell -batch -tcl report_extractor.tcl $2
python csv_extractor_arguments.py 
python csv_extractor_arguments.py 
python hw_detection.py