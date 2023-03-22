package Simulation;

import java.util.*;
import java.io.*;

class Robot {
    int x;
    int y;

    public Robot(int x, int y) {
        this.x = x;
        this.y = y;
    }
}

public class bj14503 {
    static int[][] map;
    static Robot robot;
    static int dest;

    // 북 동 남 서
    static int[] dx = {-1, 0, 1, 0};
    static int[] dy = {0, 1, 0, -1};

    static int cnt;

    public static void solve() {
        int x = robot.x;
        int y = robot.y;

        while(true) {
            // 1. 현재 칸이 아직 청소되지 않은 경우, 현재 칸을 청소한다. -> -1로 전환
            if(map[x][y] == 0) {
                map[x][y] = -1;
                cnt++;
                continue;
            }
            // 주변 4칸 중 청소되지 않은 빈 칸이 있는 지 확인
            boolean isRoomExist = false;
            for(int i=0; i<4; i++) {
                int cx = x + dx[i];
                int cy = y + dy[i];

                if(map[cx][cy] == 0)
                    isRoomExist = true;
            }
            // 3. 현재 칸의 주변 4칸 중 청소되지 않은 빈 칸이 있는 경우,
            if(isRoomExist) {
                // 반시계 방향으로 90도 회전
                dest -= 1;
                if(dest == -1) dest = 3;
                // 바라보는 방향을 기준으로 앞쪽 칸이 청소되지 않은 빈 칸인 경우
                int nx = x + dx[dest];
                int ny = y + dy[dest];
                // 한 칸 전진, 1번으로 돌아간다.
                if(map[nx][ny] == 0) {
                    x = nx;
                    y = ny;
                }
            }
            // 2. 현재 칸의 주변 4칸 중 청소되지 않은 빈 칸이 없는 경우,
            else {
                // 바라보는 방향의 뒤쪽 방향을 살핀다.
                int tmp = dest;
                tmp -= 1;
                if(tmp == -1) tmp = 3;
                tmp -= 1;
                if(tmp == -1) tmp = 3;

                int nx = x + dx[tmp];
                int ny = y + dy[tmp];

                // 바라보는 방향의 뒤쪽 칸이 벽이라 후진할 수 없다면 작동을 멈춘다.
                if(map[nx][ny] == 1)
                    break;
                // 바라보는 방향을 유지한 채로 한 칸 후진할 수 있다면 한 칸 후진하고 1번으로 돌아간다.
                else {
                    x = nx;
                    y = ny;
                }
            }
        }
    }

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;

        st = new StringTokenizer(br.readLine(), " ");
        int n = Integer.parseInt(st.nextToken());
        int m = Integer.parseInt(st.nextToken());

        map = new int[n][m];

        st = new StringTokenizer(br.readLine(), " ");
        int r = Integer.parseInt(st.nextToken());
        int c = Integer.parseInt(st.nextToken());
        int d = Integer.parseInt(st.nextToken());

        robot = new Robot(r, c);
        dest = d;

        for(int i=0; i<n; i++) {
            st = new StringTokenizer(br.readLine(), " ");
            for(int j=0; j<m; j++) {
                map[i][j] = Integer.parseInt(st.nextToken());
            }
        }

        solve();

        System.out.println(cnt);
    }
}
