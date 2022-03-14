
public class Identity{
    
    private String name;
    private boolean sex;  //0 for female or 1 for male
    private int age; 
    private int height; // in cm
    private String nationality;

    public Identity(String name, boolean sex, int age, int height, String nationality){
        this.name = name;
        this.age = age;
        this.height = height;
        this.nationality = nationality;
    }

        @Override
    public String toString(){
        String gender = "";
        if(sex){
            gender = "Female";
        }
        else{
            gender = "Male";
        }
        return "Name : " + name +
                "\nGender : " + gender + 
                "\nAge : " + age + 
                "\nHeight : " + height + 
                "\nNationality : " + nationality;
    }

    public void printId(){
        System.out.println(toString());
    }
}