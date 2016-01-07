// these import statements prompt the code for working with images
import java.io.File; // used to create a File object
import java.io.IOException; // used to catch IO Exception that could occur during the reading/writing of an image file
import java.awt.image.BufferedImage; // created buffer to hold image
import javax.imageio.ImageIO; // perform read and write operation

public class ImageTest{
    public static void main (String[]args) throws IOException{
	int width = 1000; // of image
	int length = 900;
	BufferedImage buffer = null;
	File f = null;

	try{
	    f = new File("PrivateInvestigator.png");
	    buffer = new BufferedImage(width, length, BufferedImage.TYPE_INT_ARGB);
	    buffer = ImageIO.read(f);
	    System.out.println("done reading file");
	}catch(IOException e){
	    System.out.println("error: did not successfully read file");
	}

    }
}

