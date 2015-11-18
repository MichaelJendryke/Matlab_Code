print "Using arcPy to warp files" 

import arcpy

source_pnt = "'121.409947 31.330781';'121.419349 31.106076';'121.544547 31.434673';'121.391634 31.482088';'121.530173 31.014675';'121.624136 31.382917';'121.292109 31.070578'"
target_pnt = "'121.490793 31.240604';'121.506024 31.017628';'121.624604 31.346071';'121.468467 31.390138';'121.622549 30.928796';'121.708151 31.295372';'121.379516 30.980537'"


arcpy.Warp_management(r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20130416_20130508\Outdata\20130416_20130508_r.tif", source_pnt, target_pnt, r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20130416_20130508\Outdata\20130416_20130508_r_warp.tif", "POLYORDER2", "NEAREST")
arcpy.Warp_management(r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20130416_20130508\Outdata\20130416_20130508_rf.tif", source_pnt, target_pnt, r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20130416_20130508\Outdata\20130416_20130508_rf_warp.tif", "POLYORDER2", "NEAREST")
arcpy.Warp_management(r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20130416_20130621\Outdata\20130416_20130621_r.tif", source_pnt, target_pnt, r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20130416_20130621\Outdata\20130416_20130621_r_warp.tif", "POLYORDER2", "NEAREST")
arcpy.Warp_management(r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20130416_20130621\Outdata\20130416_20130621_rf.tif", source_pnt, target_pnt, r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20130416_20130621\Outdata\20130416_20130621_rf_warp.tif", "POLYORDER2", "NEAREST")
arcpy.Warp_management(r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20130508_20130621\Outdata\20130508_20130621_r.tif", source_pnt, target_pnt, r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20130508_20130621\Outdata\20130508_20130621_r_warp.tif", "POLYORDER2", "NEAREST")
arcpy.Warp_management(r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20130508_20130621\Outdata\20130508_20130621_rf.tif", source_pnt, target_pnt, r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20130508_20130621\Outdata\20130508_20130621_rf_warp.tif", "POLYORDER2", "NEAREST")
arcpy.Warp_management(r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20130508_20130713\Outdata\20130508_20130713_r.tif", source_pnt, target_pnt, r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20130508_20130713\Outdata\20130508_20130713_r_warp.tif", "POLYORDER2", "NEAREST")
arcpy.Warp_management(r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20130508_20130713\Outdata\20130508_20130713_rf.tif", source_pnt, target_pnt, r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20130508_20130713\Outdata\20130508_20130713_rf_warp.tif", "POLYORDER2", "NEAREST")
arcpy.Warp_management(r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20130621_20130917\Outdata\20130621_20130917_r.tif", source_pnt, target_pnt, r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20130621_20130917\Outdata\20130621_20130917_r_warp.tif", "POLYORDER2", "NEAREST")
arcpy.Warp_management(r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20130621_20130917\Outdata\20130621_20130917_rf.tif", source_pnt, target_pnt, r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20130621_20130917\Outdata\20130621_20130917_rf_warp.tif", "POLYORDER2", "NEAREST")
arcpy.Warp_management(r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20130713_20130917\Outdata\20130713_20130917_r.tif", source_pnt, target_pnt, r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20130713_20130917\Outdata\20130713_20130917_r_warp.tif", "POLYORDER2", "NEAREST")
arcpy.Warp_management(r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20130713_20130917\Outdata\20130713_20130917_rf.tif", source_pnt, target_pnt, r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20130713_20130917\Outdata\20130713_20130917_rf_warp.tif", "POLYORDER2", "NEAREST")
arcpy.Warp_management(r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20130917_20131214\Outdata\20130917_20131214_r.tif", source_pnt, target_pnt, r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20130917_20131214\Outdata\20130917_20131214_r_warp.tif", "POLYORDER2", "NEAREST")
arcpy.Warp_management(r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20130917_20131214\Outdata\20130917_20131214_rf.tif", source_pnt, target_pnt, r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20130917_20131214\Outdata\20130917_20131214_rf_warp.tif", "POLYORDER2", "NEAREST")
arcpy.Warp_management(r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20131214_20140312\Outdata\20131214_20140312_r.tif", source_pnt, target_pnt, r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20131214_20140312\Outdata\20131214_20140312_r_warp.tif", "POLYORDER2", "NEAREST")
arcpy.Warp_management(r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20131214_20140312\Outdata\20131214_20140312_rf.tif", source_pnt, target_pnt, r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20131214_20140312\Outdata\20131214_20140312_rf_warp.tif", "POLYORDER2", "NEAREST")
arcpy.Warp_management(r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20140312_20140517\Outdata\20140312_20140517_r.tif", source_pnt, target_pnt, r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20140312_20140517\Outdata\20140312_20140517_r_warp.tif", "POLYORDER2", "NEAREST")
arcpy.Warp_management(r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20140312_20140517\Outdata\20140312_20140517_rf.tif", source_pnt, target_pnt, r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20140312_20140517\Outdata\20140312_20140517_rf_warp.tif", "POLYORDER2", "NEAREST")
arcpy.Warp_management(r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20140802_20140517\Outdata\20140802_20140517_r.tif", source_pnt, target_pnt, r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20140802_20140517\Outdata\20140802_20140517_r_warp.tif", "POLYORDER2", "NEAREST")
arcpy.Warp_management(r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20140802_20140517\Outdata\20140802_20140517_rf.tif", source_pnt, target_pnt, r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20140802_20140517\Outdata\20140802_20140517_rf_warp.tif", "POLYORDER2", "NEAREST")
arcpy.Warp_management(r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20140802_20140915\Outdata\20140802_20140915_r.tif", source_pnt, target_pnt, r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20140802_20140915\Outdata\20140802_20140915_r_warp.tif", "POLYORDER2", "NEAREST")
arcpy.Warp_management(r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20140802_20140915\Outdata\20140802_20140915_rf.tif", source_pnt, target_pnt, r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20140802_20140915\Outdata\20140802_20140915_rf_warp.tif", "POLYORDER2", "NEAREST")
arcpy.Warp_management(r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20140802_20141029\Outdata\20140802_20141029_r.tif", source_pnt, target_pnt, r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20140802_20141029\Outdata\20140802_20141029_r_warp.tif", "POLYORDER2", "NEAREST")
arcpy.Warp_management(r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20140802_20141029\Outdata\20140802_20141029_rf.tif", source_pnt, target_pnt, r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20140802_20141029\Outdata\20140802_20141029_rf_warp.tif", "POLYORDER2", "NEAREST")
arcpy.Warp_management(r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20141029_20141223\Outdata\20141029_20141223_r.tif", source_pnt, target_pnt, r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20141029_20141223\Outdata\20141029_20141223_r_warp.tif", "POLYORDER2", "NEAREST")
arcpy.Warp_management(r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20141029_20141223\Outdata\20141029_20141223_rf.tif", source_pnt, target_pnt, r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20141029_20141223\Outdata\20141029_20141223_rf_warp.tif", "POLYORDER2", "NEAREST")
arcpy.Warp_management(r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20150401_20150515\Outdata\20150401_20150515_r.tif", source_pnt, target_pnt, r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20150401_20150515\Outdata\20150401_20150515_r_warp.tif", "POLYORDER2", "NEAREST")
arcpy.Warp_management(r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20150401_20150515\Outdata\20150401_20150515_rf.tif", source_pnt, target_pnt, r"F:\LINUX\2_Stack_SH\SM\SBAsubsets\20150401_20150515\Outdata\20150401_20150515_rf_warp.tif", "POLYORDER2", "NEAREST")

print "END" 
raw_input()