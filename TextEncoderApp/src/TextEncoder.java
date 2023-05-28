public class TextEncoder {
    private final String referenceTable = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789()*+,-./";

    public String encode(String plainText, char offset) {
        StringBuilder encodedText = new StringBuilder();

        for (char c : plainText.toCharArray()) {
            int index = referenceTable.indexOf(c);
            if (index != -1) {
                int offsetIndex = (index - referenceTable.indexOf(offset)+referenceTable.length()) % referenceTable.length();
                encodedText.append(referenceTable.charAt(offsetIndex));
            } else {
                encodedText.append(c);
            }
        }

        return offset+encodedText.toString();
    }

    public String decode(String encodedText) {
        char offset = encodedText.charAt(0);
        StringBuilder decodedText = new StringBuilder();

        for (int i = 1; i < encodedText.length(); i++) {
            char c = encodedText.charAt(i);
            int index = referenceTable.indexOf(c);
            if (index != -1) {
                int offsetIndex = (index + referenceTable.indexOf(offset) +referenceTable.length()) % referenceTable.length();
                decodedText.append(referenceTable.charAt(offsetIndex));
            } else {
                decodedText.append(c);
            }
        }

        return decodedText.toString();
    }

    public static void main(String[] args) {
        TextEncoder encoder = new TextEncoder();

        String plainText = "HELLO WORLD";
        char offset = 'F';
        String encodedText = encoder.encode(plainText, offset);
        System.out.println("Encoded text: " + encodedText);

        String decodedText = encoder.decode(encodedText);
        System.out.println("Decoded text: " + decodedText);
    }
}
