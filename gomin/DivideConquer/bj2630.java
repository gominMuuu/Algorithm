package DivideConquer;

import java.util.*;
import java.io.*;

public class bj2630 {
    static int[][] map;
    static int white;
    static int blue;

    public static void partition(int row, int col, int size) {
        if(colorCheck(row, col, size)) {
            if(map[row][col] == 1)
                blue++;
            else
                white++;
            return;
        }
        else {
            partition(row, col, size/2);
            partition(row, col + size/2, size/2);
            partition(row + size/2, col, size/2);
            partition(row + size/2, col + size/2, size/2);
        }
    }

    public static boolean colorCheck(int row, int col, int size) {
        int color = map[row][col];

        for(int i=row; i<row+size; i++) {
            for (int j = col; j < col + size; j++) {
                if (map[i][j] != color)
                    return false;
            }
        }

        return true;
    }
    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;

        int n = Integer.parseInt(br.readLine());
        map = new int[n][n];

        for(int i=0; i<n; i++) {
            st = new StringTokenizer(br.readLine(), " ");
            for(int j=0; j<n; j++) {
                map[i][j] = Integer.parseInt(st.nextToken());
            }
        }

        partition(0, 0, n);

        System.out.println(white);
        System.out.println(blue);
    }
}
