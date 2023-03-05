package Implementation;

import java.io.*;
import java.util.*;

public class bj4396 {
    static int n;
    static char[][] boom; // 지뢰칸 입력
    static char[][] map; // 결과
    static boolean flag = false; // 지뢰칸 오픈 여부

    // 8방 탐색을 위한 delta배열
    static int[] dx = {-1, -1, -1, 0, 0, 0, 1, 1, 1};
    static int[] dy = {-1, 0, 1, -1, 0, 1, -1, 0, 1};

    public static void main(String[] args) throws Exception {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        n = Integer.parseInt(br.readLine());

        boom = new char[n][n];
        map = new char[n][n];

        // 지뢰의 위치를 받는 map
        for (int i = 0; i < n; i++) {
            String str = br.readLine();
            for (int j = 0; j < n; j++) {

                boom[i][j] = str.charAt(j);
            }
        }

        // 열린 곳의 위치를 받는 map
        for (int i = 0; i < n; i++) {
            String str = br.readLine();
            for (int j = 0; j < n; j++) {

                map[i][j] = str.charAt(j);
            }
        }

        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                // 주변 지뢰의 개수
                int count = 0;
                // 열린 곳이면서
                if (map[i][j] == 'x') {
                    // 폭탄이라면 >> 지뢰를 모두 열어줘야 하므로 flag를 트루로 만들어 준다.
                    if (boom[i][j] == '*') {
                        flag = true;
                    }
                    // 폭탄이 아니라면
                    else {
                        // 8방 탐색을 해야함
                        for (int k = 0; k < dx.length; k++) {
                            int x = i + dx[k];
                            int y = j + dy[k];

                            // 범위를 벗어나지 않고 폭탄이라면
                            if (x >= 0 && x < n && y >= 0 && y < n && boom[x][y] == '*') {
                                count++;
                            }
                        }
                        // 해당 위치에 count를 표시해줘야 하므로
                        map[i][j] = (char)(count + '0');
                    }
                }
                // 열린 곳이 아니라면 .표시
                else {
                    map[i][j] = '.';
                }
            }
        }

        // 만약 지뢰가 있는 곳을 열었다면
        if (flag) {
            for (int i = 0; i < n; i++) {
                for (int j = 0; j < n; j++) {
                    // 지뢰인 곳은
                    if (boom[i][j] == '*') {
                        // 모두 *로 변경
                        map[i][j] = '*';
                    }
                }
            }
        }

        // 출력
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                System.out.print(map[i][j]);
            }
            System.out.println();
        }
    }
}
