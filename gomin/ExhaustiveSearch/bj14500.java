package ExhaustiveSearch;

import java.io.*;
import java.util.*;

public class bj14500 {
    static int n;   // 세로
    static int m;   // 가로
    static int[][] map;
    static boolean[][] visited;

    static int[] dx = {-1, 1, 0, 0};
    static int[] dy = {0, 0, -1, 1};

    static int max = Integer.MIN_VALUE;

    static public void dfs() {
        for(int i=0; i<n; i++) {
            for(int j=0; j<m; j++) {
                visited[i][j] = true;
                solve(i, j, map[i][j], 1);
                visited[i][j] = false;
            }
        }
    }

    static public void solve(int row, int col, int sum, int count) {
        // 테트로미노 완성 시 수들의 합 계산
        if(count == 4) {
            max = Math.max(max, sum);
            return;
        }

        // 상하좌우 탐색
        for(int i=0; i<4; i++) {
            int cx = row + dx[i];
            int cy = col + dy[i];

            if(cx < 0 || cy < 0 || cx >= n || cy >= n) continue;
            if(!visited[cx][cy]) {
                // 보라색(ㅗ) 테트로미노 만들기 위해 2번째 칸에서 탐색 한번 더 진행
                if(count == 2) {
                    visited[cx][cy] = true;
                    solve(row, col, sum + map[cx][cy], count + 1);
                    visited[cx][cy] = false;
                }

                visited[cx][cy] = true;
                solve(cx, cy, sum + map[cx][cy], count + 1);
                visited[cx][cy] = false;
            }
        }
    }

    public static void main(String[] args) throws Exception {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;

        st = new StringTokenizer(br.readLine(), " ");
        n = Integer.parseInt(st.nextToken());
        m = Integer.parseInt(st.nextToken());

        map = new int[n][m];
        visited = new boolean[n][m];

        for(int i=0; i<n; i++) {
            st = new StringTokenizer(br.readLine(), " ");
            for(int j=0; j<m; j++) {
                map[i][j] = Integer.parseInt(st.nextToken());
            }
        }

        dfs();

        System.out.println(max);
    }
}
