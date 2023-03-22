package Simulation;
import java.util.*;
import java.io.*;

class Command {
    int time;
    char command;

    public Command(int time, char command) {
        this.time = time;
        this.command = command;
    }
}

class SnakePoint {
    int x;
    int y;

    public SnakePoint(int x, int y) {
        this.x = x;
        this.y = y;
    }
}

public class bj3190 {
    static int[][] map;
    static int n;
    static int snakeLength;
    static int time;
    static Queue<Command> stack = new LinkedList<>();
    // 뱀의 머리와 꼬리의 위치
    static Queue<SnakePoint> snakeLoc = new LinkedList<>();

    // 동 남 서 북
    static int[] dx = {0, 1, 0, -1};
    static int[] dy = {1, 0, -1, 0};

    public static void solve() {
        int cx = 0, cy = 0;
        int d = 0;
        snakeLoc.add(new SnakePoint(0, 0));

        while(true) {
            time++;

            int nx = cx + dx[d];
            int ny = cy + dy[d];

            boolean isFinish = false;
            // 뱀이 범위를 벗어나거나
            if(nx < 0 || ny < 0 || nx >= n || ny >= n) {
                isFinish = true;
            }
            // 자기 자신의 몸통과 부딪혔을 때 종료
            for(SnakePoint sp : snakeLoc) {
                if(nx == sp.x && ny == sp.y)
                    isFinish = true;
            }
            if(isFinish) break;

            // 뱀이 사과를 만났을 때
            if(map[nx][ny] == 1) {
                // 머리 위치 추가
                snakeLoc.add(new SnakePoint(nx, ny));
                // 사과는 먹어서 사라짐
                map[nx][ny] = 0;
            } else {
                // 사과를 만나지 않았을 땐
                // 머리 위치 추가, 꼬리 위치 제거
                snakeLoc.add(new SnakePoint(nx, ny));
                snakeLoc.remove();
            }

            // 현재 시간과 비교해 방향을 바꾼다.
            d = rotateSnake(d);

            // 뱀의 위치 업데이트하기
            cx = nx;
            cy = ny;
        }
    }
    public static int rotateSnake(int d) {
        if(stack.isEmpty()) return d;
        Command command = stack.peek();
        int t = command.time;
        char c = command.command;

        if(time == t) {
            stack.poll();
            if(c == 'D') {
                d += 1;
                if(d == 4) d = 0;
            } else if(c == 'L') {
                d -= 1;
                if(d == -1) d = 3;
            }
        }

        return d;
    }

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;

        n = Integer.parseInt(br.readLine());
        int k = Integer.parseInt(br.readLine());

        map = new int[n][n];

        // 사과의 좌표 ax, ay는 1
        for(int i=0; i<k; i++) {
            st = new StringTokenizer(br.readLine(), " ");
            int ax = Integer.parseInt(st.nextToken()) - 1;
            int ay = Integer.parseInt(st.nextToken()) - 1;
            map[ax][ay] = 1;
        }

        int l = Integer.parseInt(br.readLine());
        for(int i=0; i<l; i++) {
            st = new StringTokenizer(br.readLine(), " ");
            int t = Integer.parseInt(st.nextToken());
            char command = st.nextToken().charAt(0);
            stack.add(new Command(t, command));
        }

        solve();

        System.out.println(time);

    }
}