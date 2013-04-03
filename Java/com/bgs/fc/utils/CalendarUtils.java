package com.bgs.fc.utils;

import java.util.Calendar;

public class CalendarUtils {

	 public String getTimeAndDate( Calendar cal, boolean includeMS )
	 {
		 StringBuffer buf = new StringBuffer();
		 formatDateAndTime(includeMS, buf, cal);
		 return buf.toString();
	 }
	
	 public String getTimeAndDate( boolean includeMS )
	    {
	        StringBuffer buf = new StringBuffer();
	        Calendar cal = Calendar.getInstance();
	        formatDateAndTime(includeMS, buf, cal);

	        return buf.toString();
	    } // getTimeAndDate

	private void formatDateAndTime(boolean includeMS, StringBuffer buf, Calendar cal) {
		int day     = cal.get(Calendar.DAY_OF_MONTH);
		int month   = cal.get(Calendar.MONTH) + 1;
		int year    = cal.get(Calendar.YEAR);
		int hour24  = cal.get(Calendar.HOUR_OF_DAY);
		int min     = cal.get(Calendar.MINUTE);
		int sec     = cal.get(Calendar.SECOND );
		int msec    = cal.get(Calendar.MILLISECOND );

		buf.append( month );
		buf.append('/');
		buf.append( day );
		buf.append('/');
		buf.append( year );
		buf.append(' ');
		buf.append( hour24 );
		buf.append(':');
		buf.append( min );
		buf.append(':');
		buf.append( sec );

		if (includeMS) {
		    buf.append(':');
		    buf.append( msec );
		}
	}

}
