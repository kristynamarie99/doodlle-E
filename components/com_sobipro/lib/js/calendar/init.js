/**
 * @version: $Id: init.js 2989 2013-01-15 16:32:42Z Sigrid Suski $
 * @package: SobiPro Library

 * @author
 * Name: Sigrid Suski & Radek Suski, Sigsiu.NET GmbH
 * Email: sobi[at]sigsiu.net
 * Url: http://www.Sigsiu.NET

 * @copyright Copyright (C) 2006 - 2013 Sigsiu.NET GmbH (http://www.sigsiu.net). All rights reserved.
 * @license GNU/LGPL Version 3
 * This program is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License version 3 as published by the Free Software Foundation, and under the additional terms according section 7 of GPL v3.
 * See http://www.gnu.org/licenses/lgpl.html and http://sobipro.sigsiu.net/licenses.

 * This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

 * $Date: 2013-01-15 17:32:42 +0100 (Tue, 15 Jan 2013) $
 * $Revision: 2989 $
 * $Author: Sigrid Suski $
 * File location: components/com_sobipro/lib/js/calendar/init.js $
 */

function SPCalendar( id, bid, format )
{
	if( !format ) {
		format = "__FORMAT__";
	}
	var el = SP_id( id );
	if ( calendar != null ) {
		calendar.hide();
		calendar.parseDate( el.value );
	} else {
		var cal = new Calendar( true, null, SPSelectedDate, SPCloseCal );
		calendar = cal;
		SobiCal = cal;
		cal.setRange( 1800, 2300 );
		calendar.create();
	}
	calendar.setDateFormat( format );
	calendar.setTtDateFormat( "__FORMAT_TXT__" )
	calendar.parseDate( el.value );
	calendar.sel = el;
	calendar.showAtElement( SP_id( id ) );
	return false;
}
function SPCloseCal( c ) { c.hide(); }
function SPSelectedDate( c, d ) { c.sel.value = d; }