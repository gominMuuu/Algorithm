package Simulation;

import java.util.*;
import java.io.*;

public class bj5212 {
    static char[][] map;
    static char[][] newMap;
    static int r, c;

    static int[] dx = {0, 0, -1, 1};
    static int[] dy = {-1, 1, 0, 0};

    // .은 바다, X는 땅
    public static void solve(int x, int y) {
        int cnt = 0;

        for(int i=0; i<4; i++) {
            int cx = x + dx[i];
            int cy = y + dy[i];

            if(cx < 0 || cy < 0 || cx >= r || cy >= c) {
                cnt++;
                continue;
            }
            if(map[cx][cy] == '.') cnt++;
        }
        if(cnt >= 3) {
            newMap[x][y] = '.';
        }
    }

    public static void printMap() {

        int lx = Integer.MAX_VALUE;
        int ly = Integer.MAX_VALUE;
        int rx = Integer.MIN_VALUE;
        int ry = Integer.MIN_VALUE;

        for(int i=0; i<r; i++) {
            for(int j=0; j<c; j++) {
                if(newMap[i][j] == 'X') {
                    lx = Math.min(lx, j);
                    ly = Math.min(ly, i);
                    rx = Math.max(rx, j);
                    ry = Math.max(ry, i);
                }
            }
        }
        for(int i=ly; i<=ry; i++) {
            for(int j=lx; j<=rx; j++) {
                System.out.print(newMap[i][j] + "");
            }
            System.out.println();
        }
    }

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;

        st = new StringTokenizer(br.readLine(), " ");
        r = Integer.parseInt(st.nextToken());
        c = Integer.parseInt(st.nextToken());

        map = new char[r][c];
        newMap = new char[r][c];

        for(int i=0; i<r; i++) {
            char[] tmp = br.readLine().toCharArray();
            for(int j=0; j<c; j++) {
                map[i][j] = tmp[j];
                newMap[i][j] = tmp[j];
            }
        }

        for(int i=0; i<r; i++) {
            for(int j=0; j<c; j++) {
                if(map[i][j] == 'X') {
                    solve(i, j);
                }
            }
        }

        printMap();

    }
}
