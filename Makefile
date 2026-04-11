ASM=as
LD=ld
ASMFLAGS=--64
TARGET=a-vim
SRC=a_vim.S

.PHONY: all clean test rebuild

all: $(TARGET)

$(TARGET): $(SRC)
	$(ASM) $(ASMFLAGS) -o a_vim.o $(SRC)
	$(LD) -o $(TARGET) a_vim.o

test: $(TARGET) smoke_test.py
	python3 smoke_test.py

rebuild: clean all

clean:
	rm -f $(TARGET) a_vim.o tmp_*.txt tmp_*.c tmp_*.asm onechar*.txt qa_tmp.asm
	rm -rf __pycache__
