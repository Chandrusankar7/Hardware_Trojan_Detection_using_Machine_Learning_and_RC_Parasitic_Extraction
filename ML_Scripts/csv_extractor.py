import pandas as pd

#Reading Power report
power_myfile = open("c17_power_report.txt","r")
power_myfile1 = open("c17_power_report.txt","r")
power_content = power_myfile1.readlines()
power_mylines = []
count = 0
start_count=0
end_count=0
power_file = open ("c17_power_report.csv","w") 

#Reading RC report
rc_myfile = open("c17_RC.txt","r")
rc_mylines = []
rc_file = open ("c17_RC_report.csv","w")

#CSV report
csv_report = open ("csv_report.csv","w")

for mylines in power_myfile:
    count = count+1
    if ('Net Load' in mylines):
        print ('Report starting at ', count)
        start_count = count
        
    if ('Total (' in mylines):
        print ('Report ending at ', count)
        end_count = count
        
end_count = end_count-2

column = 'Net' + ", " + "Total Net Load" + ", " + "Static Prob." + ", " + "Toggle Rate" + ", " + "Switching Power" + '\n'
power_file.write(column)

for i in range (start_count+1,end_count):
    split1 = power_content[i].split()
    split1.append(split1)
    split2 = str(split1[0] + ", " + split1[1] + ", " + split1[2] + ", " + split1[3] + ", " + split1[4] + '\n')
    #print (split2)
    power_file.writelines(split2)
    
power_file.close()
    
column = 'Net' + ", " + "RC" + '\n'
rc_file.write(column)
    
for rc_mylines in rc_myfile:
    if ('*R_NET' in rc_mylines):
        split3 = rc_mylines.split()
        split3.append(split3)
        split4 = str(split3[1]) + ", " + str(split3[2]) + '\n'
        #print (split4)
        rc_file.writelines(split4)
        
rc_file.close()

#csv_report.write(str(l1))
l1 = pd.read_csv(r'''c17_power_report.csv''',encoding='cp1252')
print (l1)
l2 = pd.read_csv(r'''c17_RC_report.csv''',encoding='cp1252')
print (l2)
l1 = l1.merge(l2,on='Net',how='right')
print (l1)
csv_report.write(str(l1))
