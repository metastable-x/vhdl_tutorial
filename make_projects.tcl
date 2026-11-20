set original_dir [pwd]
set repo_dir [file dirname [file normalize [info script]]]
cd $repo_dir
set part "xc7a35tcpg236-1"
set outdir [file join $repo_dir vivado]
file mkdir $outdir

create_project led_test $outdir/led_test -part $part -force
add_files -norecurse {led/led_test.vhd}
add_files -fileset constrs_1 -norecurse {led/led_test.xdc}
set_property top led_test [current_fileset]
close_project

create_project led_test_single $outdir/led_test_single -part $part -force
add_files -norecurse {led/led_test_single.vhd}
add_files -fileset constrs_1 -norecurse {led/led_test.xdc}
set_property top led_test_single [current_fileset]
close_project

create_project led_test_strobe $outdir/led_test_strobe -part $part -force
add_files -norecurse {led/led_test_strobe.vhd}
add_files -fileset constrs_1 -norecurse {led/led_test.xdc}
set_property top led_test_strobe [current_fileset]
close_project

create_project led_test_sweep $outdir/led_test_sweep -part $part -force
add_files -norecurse {led/led_test_sweep.vhd}
add_files -fileset constrs_1 -norecurse {led/led_test.xdc}
set_property top led_test_sweep [current_fileset]
close_project

create_project btn_counter $outdir/btn_counter -part $part -force
add_files -norecurse {db/btn_counter.vhd db/btn_debounce.vhd}
add_files -fileset constrs_1 -norecurse {db/btn_counter.xdc}
set_property top btn_counter [current_fileset]
close_project

create_project fifo_top $outdir/fifo_top -part $part -force
add_files -norecurse {fifo/fifo_top.vhd fifo/fifo.vhd fifo/seg_driver.vhd db/btn_debounce.vhd}
add_files -fileset constrs_1 -norecurse {fifo/fifo_top.xdc}
set_property top fifo_top [current_fileset]
close_project

create_project uart_tx $outdir/uart_tx -part $part -force
add_files -norecurse {uart/tx/uart_top.vhd uart/tx/uart_tx.vhd uart/tx/uart_ctrl.vhd db/btn_debounce.vhd}
add_files -fileset constrs_1 -norecurse {uart/tx/uart.xdc}
set_property top uart_top [current_fileset]
close_project

create_project uart_rx $outdir/uart_rx -part $part -force
add_files -norecurse {uart/rx/uart_top.vhd uart/rx/uart_rx.vhd uart/rx/uart_ctrl.vhd uart/rx/ascii_pkg.vhd uart/rx/msg_pkg.vhd uart/tx/uart_tx.vhd db/btn_debounce.vhd fifo/seg_driver.vhd}
add_files -fileset constrs_1 -norecurse {uart/rx/uart.xdc}
set_property top uart_top [current_fileset]
close_project

create_project uart_parity $outdir/uart_parity -part $part -force
add_files -norecurse {uart/rx/ascii_pkg.vhd uart/rx/msg_pkg.vhd uart/parity/uart_pkg.vhd uart/parity/uart_top.vhd uart/parity/uart_tx.vhd uart/parity/uart_rx.vhd uart/rx/uart_ctrl.vhd db/btn_debounce.vhd fifo/seg_driver.vhd}
add_files -fileset constrs_1 -norecurse {uart/parity/uart.xdc}
set_property top uart_top [current_fileset]
close_project

cd $original_dir
puts "ALL_PROJECTS_CREATED"
