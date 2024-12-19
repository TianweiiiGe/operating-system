target=multi_wifi_load_driver

all:
	$(CC) -Wall $(target).c -o $(target) -lusb-1.0

clean:
	rm $(target)

install:
	install -m 0755 $(target) $(TARGET_DIR)/usr/bin/
