package DivideConquer;

import java.util.*;
import java.io.*;

public class bj18222 {
    static long[] map;

    public static long get(long k) {
        if(k == 1) return 0;

        for(int i=1; i<65; i++) {
            if(k <= map[i])
                return 1 - get(k - map[i-1]);
        }
        return 0;
    }

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        long k = Long.parseLong(br.readLine());
        map = new long[65];

        map[0] = 1;
        for(int i=1; i<65; i++) {
            map[i] = map[i-1] * 2;
        }

        System.out.println(get(k));
    }
}
