package com.bgs.fc.utils;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Comparator;

public class GenericComparator implements Comparator {

	String cobjMethodName = null;

	public GenericComparator(String objMethodName)
	{
		StringBuffer strBuffer = new StringBuffer(objMethodName);
		strBuffer.setCharAt(0,Character.toUpperCase(strBuffer.charAt(0)));
		cobjMethodName = "get"+strBuffer.toString();
	}
	
	@SuppressWarnings("unchecked")
	public int compare(Object o1, Object o2)
	{
		Method objMethod = null;
		Object object1 = null;
		Object object2 = null;

		if(!(o1.getClass().isInstance(o2)))
		{
			throw new ClassCastException("Classes do not match " +
			o1.getClass().getName() + " : "+
			o2.getClass().getName());
		}
	
		try
		{
			objMethod = o1.getClass().getMethod(cobjMethodName, new Class[]{});
		}
	
		catch(NoSuchMethodException e)
		{
			throw new RuntimeException("Method name" +this.cobjMethodName+
					" not found in class "+o1.getClass().getName());
		}
	
		try
		{
			object1 = objMethod.invoke(o1, new Object[]{});
			object2 = objMethod.invoke(o2, new Object[]{});
		}
	
		catch(IllegalAccessException e1)
		{
			throw new RuntimeException("Access denied to method " +
			this.cobjMethodName + " in class "+
			o1.getClass().getName());
		}
	
		catch(InvocationTargetException e2)
		{
			throw new RuntimeException(this.cobjMethodName + " in class "+
					o1.getClass().getName() + "threw an exception");
		}
	
		return ((Comparable)object1).compareTo(object2);
	} 
}
