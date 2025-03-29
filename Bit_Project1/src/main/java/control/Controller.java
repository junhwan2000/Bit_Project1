package control;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import handler.CommandHandler;
import handler.DefaultHandler;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Controller extends HttpServlet{
	private Map<String, CommandHandler> handlerMap
	= new HashMap<String, CommandHandler> ();
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		String path = config.getServletContext().getRealPath("/");
		String configFile = config.getInitParameter("configFile");
		path = path + configFile;
		FileInputStream fis = null;
		Properties prop = new Properties();
		try {
			fis = new FileInputStream(path);
			prop.load(fis);
			Iterator<Object> keys = prop.keySet().iterator();
			while (keys.hasNext()){
				String command = (String) keys.next();
				String handlerName = prop.getProperty(command);
				Class<?> handlerClass = Class.forName(handlerName);
				CommandHandler handler 
					= (CommandHandler) handlerClass.getDeclaredConstructor().newInstance();
				handlerMap.put(command, handler);
			}
		} catch(FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
		} catch (SecurityException e) {
			e.printStackTrace();
		}
				
	}
	
	public void doProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String command = request.getRequestURI();
		if(command.indexOf(request.getContextPath())==0) {
			command = command.substring(request.getContextPath().length());
		}
		CommandHandler handler = handlerMap.get(command);
		if(handler == null) {
			handler = new DefaultHandler();
		}
		String viewPage = null;
		try {
		viewPage = handler.process(request, response);
		} catch(Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		doProcess(req, resp);
	}
	
}	// class
