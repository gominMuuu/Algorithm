package Simulation;

import java.util.*;
import java.io.*;

class Point {
    int x;
    int y;

    public Point(int x, int y) {
        this.x = x;
        this.y = y;
    }
}

public class bj20436 {
    static char[][] keyboard = {{'q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p'},
            {'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', ' '},
            {'z', 'x', 'c', 'v', 'b', 'n', 'm', ' ', ' ', ' '}};
    static char[] vowel = {'y', 'u', 'i', 'o', 'p', 'h', 'j', 'k', 'l', 'b', 'n', 'm'};

    static HashMap<Character, Point> map = new HashMap<>();
    static Point lP, rP;
    static int answer;

    public static void setKeyboard() {
        for(int i=0; i<3; i++) {
            for(int j=0; j<10; j++) {
                if(keyboard[i][j] == ' ') continue;
                map.put(keyboard[i][j], new Point(i, j));
            }
        }
    }
    public static void solve(Character ch) {
        Point target = map.get(ch);
        if(target == lP || target == rP) {
            answer++;
            return;
        }
        boolean isVowel = false;
        for(int i=0; i<vowel.length; i++) {
            if(vowel[i] == ch) {
                isVowel = true;
                break;
            }
        }
        if(isVowel) {
            answer += getDistance(target, rP);
            rP = target;
        } else {
            answer += getDistance(target, lP);
            lP = target;
        }
        answer++;
    }
    public static int getDistance(Point target, Point p) {
        int result = Math.abs(target.x - p.x) + Math.abs(target.y - p.y);
        return result;
    }

    public static void main(String[] args) throws IOException {
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st;

        st = new StringTokenizer(br.readLine(), " ");
        char lA = st.nextToken().charAt(0);
        char rA = st.nextToken().charAt(0);

        setKeyboard();

        lP = map.get(lA);
        rP = map.get(rA);

        String str = br.readLine();
        char[] arr = str.toCharArray();
        for(int i=0; i<arr.length; i++) {
            solve(arr[i]);
        }

        System.out.print(answer);

    }
}
