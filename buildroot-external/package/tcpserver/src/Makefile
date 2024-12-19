TARGET = tcpserver
SRCS := crypto_helper.c tcpserver.cpp

LDFLAGS += -lcrypto

all:
	$(CXX) $(CFLAGS) $(LDFLAGS) $(SRCS) -o $(TARGET)

clean:
	rm $(TARGET)

install:
	install -m 0755 $(TARGET) $(TARGET_DIR)/usr/bin/

uninstall:
	rm -f $(TARGET_DIR)/usr/bin/$(TARGET)
