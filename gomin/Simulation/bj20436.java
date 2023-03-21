package Simulation;

import java.io.*;
import java.util.*;

class Alphabet {
    int x;
    int y;
    public Alphabet(int x, int y) {
        this.x = x;
        this.y = y;
    }
}

public class bj20436 {
    static char[][] keyboard = {{'q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p'},
                                {'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', ' '},
                                {'z', 'x', 'c', 'v', 'b', 'n', 'm', ' ', ' ', ' '}};
    static HashMap<Character, Alphabet> map = new HashMap<>();
    static int answer;

    static Alphabet lA, rA;

    public static void setKeyboard() {
        for(int i=0; i<3; i++) {
            for(int j=0; j<10; j++) {
                if(keyboard[i][j] == ' ') continue;
                map.put(keyboard[i][j], new Alphabet(i, j));
            }
        }
    }

    public static int getDistance(Alphabet a1, Alphabet a2) {
        int result = Math.abs(a1.x - a2.x) + Math.abs(a1.y - a2.y);
        return result;
    }

    public static void solve(char x) {
        Alphabet target = map.get(x);
        if(lA == target) {
            lA = target;
            answer++;
            return;
        }
        if(rA == target) {
            rA = target;
            answer++;
            return;
        }
        int timeWithLA = getDistance(target, lA);
        int timeWithRA = getDistance(target, rA);

        int time = Math.min(timeWithLA, timeWithRA);
        answer += time;

        if(timeWithLA > timeWithRA) {
            rA = target;
        } else if(timeWithLA < timeWithRA) {
            lA = target;
        }
        answer++;
    }

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

        setKeyboard();

        String[] strArr = br.readLine().split(" ");
        lA = map.get(strArr[0].charAt(0));
        rA = map.get(strArr[1].charAt(0));

        char[] chArr = br.readLine().toCharArray();
        for(int i=0; i<chArr.length; i++) {
            solve(chArr[i]);
        }

        System.out.println(answer);

    }
}