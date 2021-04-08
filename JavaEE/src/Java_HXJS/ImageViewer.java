package Java_HXJS;

import java.awt.*;
import java.io.*;
import javax.swing.*;

/**
 * 
 * @author Lyon
 *2021-1-19 00:11:57
 *熟悉书上内容（窗口）
 *a program for viewing images.
 */
public class ImageViewer {
	public static void main(String[] args) {
		EventQueue.invokeLater(()->{
			var frame = new ImageViewerFrame();
			frame.setTitle("ImageViewerFrame");
			frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
			frame.setVisible(true);
		});
	}
}

/**
 * 
 * a frame with a label to show an image.
 */

class ImageViewerFrame extends JFrame{
	private static final int DEFAULT_WIDTH = 300;
	private static final int DEFAULT_HEIGHT = 300;
	/**
	 * @throws HeadlessException
	 */
	public ImageViewerFrame(){
		setSize(DEFAULT_WIDTH, DEFAULT_HEIGHT);
		
		//user a label to display the images 
		var label = new JLabel();
		add(label);
		
		//set up the file chooser
		var chooser = new JFileChooser();
		chooser.setCurrentDirectory(new File("."));
		
		//set up the menu bar 
		var menu = new JMenu("File");
		menuBar.add(menu);
		
		var openItem = new JMenuItem("Open");
		menu.add(openItem);
		openItem.addActionListener(encent -> {
			//show file chooser dialog
			int result = chooser.showOpenDialog(null);
			
			//if file selected, set it as icon of the label 
			if(result == JFileChooser.APPROVE_OPTION){
				String name = chooser.getSelectedFile().getPath();
				label.setIcon(new ImageIcon(name));
			}
		});
		
		var exitItem = new JMenuItem("Exit");
		menu.add(exitItem);
		exitIten.addActionListener(event -> System.exit(0));
	}
	
}