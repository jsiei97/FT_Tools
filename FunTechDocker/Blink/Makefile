PROJECT=Blink.ino
PORT=/dev/ttyACM0
TARGET=arduino:renesas_uno:unor4wifi

BUILDDIR=build/

make all: compile flash

compile:
	arduino-cli compile --build-path $(BUILDDIR) --fqbn $(TARGET) $(PROJECT)

# remove sudo when udev rules for dev are solved
flash:
	sudo -E arduino-cli upload --input-dir $(BUILDDIR) -p $(PORT) --fqbn $(TARGET) $(PROJECT)

clean:
	rm -rf $(BUILDDIR)
