public class Main {
    

    public static void main(String[] args) {
        Identity id = new Identity("Barnabé", true, 23, 177, "French");
        id.printId();

        try {
            System.out.println("Start waiting for nothing.");
            Thread.sleep(10000000);
        }
        catch(Exception e) {
            System.out.println("Osef");
        }
    }
}

