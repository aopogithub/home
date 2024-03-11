import socket
import os
import time

def child_process():
    # 创建一个socket对象
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    # 绑定端口
    server_address = ('localhost', 2222)
    sock.bind(server_address)

    # 开始监听，最大连接数为1
    sock.listen(1)

    while True:
        print('Child process is listening on port 2222...')
        connection, client_address = sock.accept()
        try:
            data = connection.recv(16)
            print('Received {!r}'.format(data))
            # 这里只是简单地接收数据并打印，实际应用中可能会进行其他处理
        finally:
            connection.close()

def main():
    pid = os.fork()

    if pid == 0:  # 子进程
        child_process()
    else:  # 父进程
        print('Parent process created child with PID {}'.format(pid))
        time.sleep(5)  # 父进程休眠一段时间后结束
        print('Parent process exiting.')

if __name__ == '__main__':
    main()
