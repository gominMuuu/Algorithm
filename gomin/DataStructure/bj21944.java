package DataStructure;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.*;

// 문제번호, 난이도, 알고리즘 분류번호 를 갖는 AlProb 클래스
// 난이도 순으로 정렬하는 compareTo 함수 오버라이드 (기본 TreeSet에 사용)
class AlProb implements Comparable<AlProb> {
    int num;
    int difficulty;
    int algorithm;

    public AlProb(int num, int difficulty, int algorithm) {
        this.num = num;
        this.difficulty = difficulty;
        this.algorithm = algorithm;
    }

    @Override
    public int compareTo(AlProb o) {
        if (difficulty - o.difficulty == 0) {
            return num - o.num;
        } else {
            return difficulty - o.difficulty;
        }
    }
//    public String toString(){
//        return "num : " + num + " difficulty : " + difficulty + " algorithm : " + algorithm;
//    }
}

public class bj21944 {
    public static void main(String[] args) throws NumberFormatException, IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;
        StringBuilder sb = new StringBuilder();

        TreeSet<AlProb> ts = new TreeSet<>();       // 난이도 순으로 정렬되는 기본 TreeSet
        Map<Integer, TreeSet<AlProb>> algoTreeSet = new HashMap();      // 같은 난이도는 번호 순으로 정렬한 Map
        Map<Integer, Integer> levelmap = new HashMap<>();   // 난이도 map
        Map<Integer, Integer> algomap = new HashMap<>();    // 알고리즘 번호 map

        int N = Integer.parseInt(br.readLine());
        for(int i=0; i<N; i++) {
            st = new StringTokenizer(br.readLine(), " ");
            int num = Integer.parseInt(st.nextToken());
            int difficulty = Integer.parseInt(st.nextToken());
            int algo = Integer.parseInt(st.nextToken());

            ts.add(new AlProb(num, difficulty, algo));

            // 이미 algoTreeSet에 존재하는 알고리즘 번호라면 replace
            if (algoTreeSet.containsKey(algo)) {
                TreeSet<AlProb> tmp = algoTreeSet.get(algo);
                tmp.add(new AlProb(num, difficulty, algo));
                algoTreeSet.replace(algo, tmp);
            } else {
                TreeSet<AlProb> tmp = new TreeSet<>();
                tmp.add(new AlProb(num, difficulty, algo));
                algoTreeSet.put(algo, tmp);
            }

            levelmap.put(num, difficulty);
            algomap.put(num, algo);
        }

        int M = Integer.parseInt(br.readLine());
        for(int i=0; i<M; i++) {
            st = new StringTokenizer(br.readLine(), " ");
            String opr = st.nextToken();
            switch (opr) {
                case "add":
                    int num = Integer.parseInt(st.nextToken());
                    int difficulty = Integer.parseInt(st.nextToken());
                    int algo = Integer.parseInt(st.nextToken());

                    ts.add(new AlProb(num, difficulty, algo));

                    if (algoTreeSet.containsKey(algo)) {
                        TreeSet<AlProb> tmp = algoTreeSet.get(algo);
                        tmp.add(new AlProb(num, difficulty, algo));
                        algoTreeSet.replace(algo, tmp);
                    } else {
                        TreeSet<AlProb> tmp = new TreeSet<>();
                        tmp.add(new AlProb(num, difficulty, algo));
                        algoTreeSet.put(algo, tmp);
                    }
                    levelmap.put(num, difficulty);
                    algomap.put(num, algo);

                    break;
                case "recommend":
                    int x_algo = Integer.parseInt(st.nextToken());
                    int x = Integer.parseInt(st.nextToken());

                    // last: 최대값
                    // first: 최소값
                    if (x == 1) {
                        sb.append(algoTreeSet.get(x_algo).last().num).append('\n');
                    } else if (x == -1) {
                        sb.append(algoTreeSet.get(x_algo).first().num).append('\n');
                    }
                    break;
                case "recommend2":
                    int n = Integer.parseInt(st.nextToken());
                    if (n == 1) {
                        sb.append(ts.last().num).append('\n');
                    } else if (n == -1) {
                        sb.append(ts.first().num).append('\n');
                    }
                    break;
                case "recommend3":
                    int l = Integer.parseInt(st.nextToken());
                    int l_diff = Integer.parseInt(st.nextToken());

                    // 지정된 난이도보다 같거나 높은것중에서 제일 작은것 -> ceiling
                    // 지정된 난이도보다 같거나 낮은것중에서 제일 큰것 -> floor
                    // return이 null으로 나올수 있으므로 체크
                    if (l == 1) {
                        if (ts.ceiling(new AlProb(0, l_diff, 0)) == null) {
                            sb.append(-1).append('\n');
                        } else {
                            sb.append(ts.ceiling(new AlProb(0, l_diff, 0)).num).append('\n');
                        }
                    } else {
                        if (ts.floor(new AlProb(0, l_diff, 0)) == null) {
                            sb.append(-1).append('\n');
                        } else {
                            sb.append(ts.floor(new AlProb(0, l_diff, 0)).num).append('\n');
                        }
                    }
                    break;
                case "solved":
                    int n_idx = Integer.parseInt(st.nextToken());
                    int n_level = levelmap.get(n_idx);
                    int n_algo = algomap.get(n_idx);

                    ts.remove(new AlProb(n_idx, n_level, n_algo));
                    algoTreeSet.get(n_algo).remove(new AlProb(n_idx, n_level, n_algo));

                    levelmap.remove(n_idx);
                    algomap.remove(n_idx);

                    break;
            }
        }
        System.out.println(sb);
    }
}
