#Add files for compiler
TARGET=steering_wheel.c ./libraries/lib_mcu/can/can_lib.c ./libraries/lib_mcu/can/can_drv.c ./libraries/lib_mcu/uart/uart_lib.c ./libraries/lib_mcu/uart/uart_drv.c  ./libraries/lib_mcu/timer/timer16_drv.c ./libraries/lib_mcu/timer/timer8_drv.c 

# Change based on computer
USB=tty.usbserial-A902ZULV 

# Change for output file
OUTPUT=steering_wheel.elf

build: $(TARGET)
	avr-gcc -mmcu=at90can128 -O1 $(TARGET) -o $(OUTPUT)

flash: $(OUTPUT)
	avrdude -p c128 -P /dev/$(USB) -c jtag1 -U flash:w:$(OUTPUT)

## Clean target
.PHONY: clean
clean:
	-rm -rf $(OUTPUT)
