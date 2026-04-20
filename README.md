# solution-powertoggle-vm

Automatically starts and deallocates Azure VMs on a schedule defined by resource tags (`AutoStart`, `AutoStop`, `AutoEnabled`, `AutoWeekdaysOnly`). An Event Grid–triggered Azure Function ingests tag changes in real time, while a minute-level timer executes due actions and a daily job extends the scheduling horizon.
