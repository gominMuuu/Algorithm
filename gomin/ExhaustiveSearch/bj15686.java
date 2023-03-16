package ExhaustiveSearch;

import java.io.*;
import java.util.*;

/* 0: 빈 집 / 1: 일반 집 / 2: 치킨집
    1) 치킨집 좌표 저장
    2) 조합을 사용해 M개의 치킨집 선택
    3) 각 집에서 치킨집까지의 거리 = 치킨거리 를 구한다.
    4) 치킨거리의 합이 최소가 되는 '도시의 치킨거리'를 구한다.
 */

class House {
    int x;
    int y;
    public House(int x, int y) {
        this.x = x;
        this.y = y;
    }
}

public class bj15686 {
    static int[][] map;
    static int n;
    static ArrayList<House> homeArrayList = new ArrayList<>();
    static int answer = Integer.MAX_VALUE;

    // 조합을 구하는 백트래킹
    static void combination(ArrayList<House> arr, boolean[] visited, int start, int n, int r) {
        if(r == 0) {
            // m개의 치킨집만 선정
            ArrayList<House> selectedChickenArrayList = new ArrayList<>();
            for (int i = 0; i < n; i++) {
                if (visited[i]) {
                    selectedChickenArrayList.add(arr.get(i));
                }
            }
            // 선정된 치킨집을 활용해 도시의 치킨거리를 연산하고, 최소값을 구한다.
            answer = Math.min(getChickenDistance(selectedChickenArrayList), answer);
            return;
        }
        for(int i=start; i<n; i++) {
            visited[i] = true;
            combination(arr, visited, i+1, n, r-1);
            visited[i] = false;
        }
    }

    // 조합으로 선택된 치킨집과 각 집까지의 치킨거리 구하고
    // 도시의 치킨 거리의 합을 구하기
    static int getChickenDistance(ArrayList<House> selectedChickenArrayList) {
        int cityChickenDistance = 0;
        for(House house : homeArrayList) {
            int houseToChinkenDistance = Integer.MAX_VALUE;
            for(House chicken : selectedChickenArrayList) {
                int distance = Math.abs(house.x - chicken.x) + Math.abs(house.y - chicken.y);
                houseToChinkenDistance = Math.min(distance, houseToChinkenDistance);
            }
            cityChickenDistance += houseToChinkenDistance;
        }
        return cityChickenDistance;
    }

    public static void main(String[] args) throws Exception {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;

        st = new StringTokenizer(br.readLine(), " ");
        n = Integer.parseInt(st.nextToken());
        int m = Integer.parseInt(st.nextToken());

        map = new int[n+1][n+1];
        ArrayList<House> chickenArrayList = new ArrayList<>();

        for(int i=1; i<=n; i++) {
            st = new StringTokenizer(br.readLine(), " ");
            for(int j=1; j<=n; j++) {
                int num = Integer.parseInt(st.nextToken());
                map[i][j] = num;
                if(num == 2) {
                    chickenArrayList.add(new House(i, j));
                } else if(num == 1) {
                    homeArrayList.add(new House(i, j));
                }
            }
        }

        int chickenCnt = chickenArrayList.size();
        boolean[] visited = new boolean[chickenCnt];
        combination(chickenArrayList, visited, 0, chickenCnt, m);

        System.out.println(answer);
    }
}
