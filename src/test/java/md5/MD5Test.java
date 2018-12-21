package md5;

import org.apache.shiro.crypto.hash.Md5Hash;

public class MD5Test {
	public static void main(String[] args) {
        Md5Hash hash1 = new Md5Hash(".ts00001", "ts00001", 3);
        System.out.println(hash1);
        Md5Hash hash2 = new Md5Hash(".ts00002", "ts00002", 3);
        System.out.println(hash2);
        Md5Hash hash3 = new Md5Hash(".ts00003", "ts00003", 3);
        System.out.println(hash3);
        Md5Hash hash4 = new Md5Hash(".ts00004", "ts00004", 3);
        System.out.println(hash4);
        Md5Hash hash5 = new Md5Hash(".ts00005", "ts00005", 3);
        System.out.println(hash5);
        Md5Hash hash6 = new Md5Hash(".ts00006", "ts00006", 3);
        System.out.println(hash6);
        Md5Hash hash7 = new Md5Hash(".ts00007", "ts00007", 3);
        System.out.println(hash7);
        Md5Hash hash8 = new Md5Hash(".ts00008", "ts00008", 3);
        System.out.println(hash8);
        Md5Hash hash9 = new Md5Hash(".ts00009", "ts00009", 3);
        System.out.println(hash9);
        Md5Hash hash10 = new Md5Hash(".ts000010", "ts000010", 3);
        System.out.println(hash10);
        Md5Hash hash11 = new Md5Hash(".ts000011", "ts000011", 3);
        System.out.println(hash11);
    }
}
