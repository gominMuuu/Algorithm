package DataStructure;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.*;

public class bj1620 {
    public String solution(String str, HashMap<String, Integer> map, String[] nA) {
        String answer = "";
        // 문제값이 숫자인 지, 문자인 지 구분
        boolean isNumeric =  str.matches("[+-]?\\d*(\\.\\d+)?");

        // 포켓몬 번호라면 String array[숫자]의 값을 반한
        // 포켓몬 이름이라면 HashMap에서 키-값으로 반환
        if(isNumeric) {
            answer = nA[Integer.parseInt(str)];
        } else {
            answer = String.valueOf(map.get(str));
        }
        return answer;
    }
    public static void main(String[] args) throws NumberFormatException, IOException {
        bj1620 T = new bj1620();

        // BufferedReader로 읽어오기
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        // sb에 답 넣고 한번에 출력
        StringBuilder sb = new StringBuilder();

        // 첫 줄의 숫자 두 개를 인식하기 위해 tokenize
        StringTokenizer command;
        command = new StringTokenizer(br.readLine(), " ");

        int N = Integer.parseInt(command.nextToken());
        int M = Integer.parseInt(command.nextToken());

        // HashMap<포켓몬 이름, 포켓몬 번호>
        // 포켓몬 이름이 넣어질 String[] 생성
        HashMap<String,Integer> map = new HashMap<String,Integer>();
        String[] nameArr = new String[N + 1];

        for(int i=0; i<N; i++) {
            String name = br.readLine();
            map.put(name, (i+1));
            nameArr[i + 1] = name;
        }
        for(int i=0; i<M; i++) {
            sb.append(T.solution(br.readLine(), map, nameArr)).append('\n');
        }
        System.out.println(sb);
    }
}
