package GraphTraversal;

import java.io.*;
import java.util.*;

class Tomato {
    int x;
    int y;

    public Tomato(int x, int y) {
        this.x = x;
        this.y = y;
    }
}

public class bj7576 {
    static int[] dx = {0, 0, 1, -1};
    static int[] dy = {1, -1, 0, 0};

    static int n, m;
    static int[][] map;
    static boolean visited[][];

    static Queue<Tomato> queue = new LinkedList<>();
    static int count = 0;

    public static void bfs() {
        while(!queue.isEmpty()) {
            Tomato current = queue.poll();
            int x = current.x;
            int y = current.y;

            for(int i=0; i<4; i++) {
                int nx = current.x + dx[i];
                int ny = current.y + dy[i];

                if(nx < 0 || ny < 0 || nx >= n || ny >= m) continue;
                if(map[nx][ny] == -1) continue;
                if(visited[nx][ny]) continue;

                // 토마토가 안 익었다면
                if(map[nx][ny] == 0) {
                    // 익은 토마토를 추가
                    queue.add(new Tomato(nx, ny));
                    // 익은 날짜를 얻기 위해 그 전 날짜에서 +1
                    map[nx][ny] = map[x][y] + 1;
                }
            }
        }
    }

    public static void main(String[] args) throws Exception {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;
        StringBuilder sb = new StringBuilder();

        st = new StringTokenizer(br.readLine(), " ");
        m = Integer.parseInt(st.nextToken());
        n = Integer.parseInt(st.nextToken());

        map = new int[n][m];
        visited = new boolean[n][m];

        for(int x=0; x<n; x++) {
            st = new StringTokenizer(br.readLine(), " ");
            for(int y=0; y<m; y++) {
                map[x][y] = Integer.parseInt(st.nextToken());
                // 만약 익은 토마토라면 queue에 추가
                if(map[x][y] == 1)
                    queue.add(new Tomato(x, y));
            }
        }

        bfs();

        int result = Integer.MIN_VALUE;
        for(int i=0; i<n; i++) {
            for(int j=0; j<m; j++) {
                // 안 익은 토마토가 있다면
                if(map[i][j] == -1) {
                    result = -1;
                    break;
                }
                result = Math.max(result, map[i][j]);
            }
        }

        // 토마토가 이미 모두 익어있는 상태일 경우
        if(result == 1)
            count = 0;
        // 걸린 일수: 최대 날짜 -1
        else
            count = result - 1;

        sb.append(count);
        System.out.println(sb);
    }
}
