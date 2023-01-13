package DataStructure;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.*;

// 문제번호와 난이도를 갖는 Problem 클래스
// 난이도 순으로 정렬하는 compareTo 함수 오버라이드
class Problem implements Comparable<Problem> {
    int num;
    int difficulty;

    public Problem(int num, int difficulty) {
        this.num = num;
        this.difficulty = difficulty;
    }

    @Override
    public int compareTo(Problem o) {
        if (difficulty - o.difficulty == 0) {
            return num - o.num;
        } else {
            return difficulty - o.difficulty;
        }
    }
}

public class bj21939 {
    public static void main(String[] args) throws NumberFormatException, IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;
        StringBuilder sb = new StringBuilder();

        TreeSet<Problem> ts = new TreeSet<>();      // 난이도 순으로 정렬되는 TreeSet 사용
        Map<Integer,Integer> map = new HashMap<>();     // remove 시 사용할 HashMap

        int N = Integer.parseInt(br.readLine());
        for(int i=0; i<N; i++) {
            st = new StringTokenizer(br.readLine(), " ");
            int num = Integer.parseInt(st.nextToken());
            int difficulty = Integer.parseInt(st.nextToken());
            ts.add(new Problem(num, difficulty));
            map.put(num, difficulty);
        }

        int M = Integer.parseInt(br.readLine());
        for(int i=0; i<M; i++) {
            st = new StringTokenizer(br.readLine(), " ");
            String opr = st.nextToken();
            switch (opr) {
                case "add":
                    int num = Integer.parseInt(st.nextToken());
                    int difficulty = Integer.parseInt(st.nextToken());
                    ts.add(new Problem(num, difficulty));
                    map.put(num, difficulty);
                    break;
                case "recommend":
                    int x = Integer.parseInt(st.nextToken());
                    if (x == 1) {
                        sb.append(ts.last().num).append('\n');
                    } else if (x == -1) {
                        sb.append(ts.first().num).append('\n');
                    }
                    break;
                case "solved":
                    int xt = Integer.parseInt(st.nextToken());
                    Problem p = new Problem(xt, map.get(xt));
                    ts.remove(p);
            }
        }
        System.out.println(sb);
    }
}
