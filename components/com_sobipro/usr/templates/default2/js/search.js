/**
 * @version: $Id: search.js 3338 2013-04-03 09:57:34Z Radek Suski $
 * @package: SobiPro Component for Joomla!

 * @author
 * Name: Sigrid Suski & Radek Suski, Sigsiu.NET GmbH
 * Email: sobi[at]sigsiu.net
 * Url: http://www.Sigsiu.NET

 * @copyright Copyright (C) 2006 - 2013 Sigsiu.NET GmbH (http://www.sigsiu.net). All rights reserved.
 * @license GNU/GPL Version 3
 * This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License version 3
 * as published by the Free Software Foundation, and under the additional terms according section 7 of GPL v3.
 * See http://www.gnu.org/licenses/gpl.html and http://sobipro.sigsiu.net/licenses.

 * This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

 * $Date: 2013-04-03 11:57:34 +0200 (Wed, 03 Apr 2013) $
 * $Revision: 3338 $
 * $Author: Radek Suski $
 * File location: components/com_sobipro/usr/templates/default2/js/search.js $
 */

SobiPro.jQuery( document ).ready( function ()
{
	var spSearchDefStr = '';
	SobiPro.jQuery( '#SPSearchBox' ).bind( 'click', function ()
	{
		spSearchDefStr = spSearchDefStr == '' ? SobiPro.Txt( 'SH.SEARCH_FOR_BOX' ) : spSearchDefStr;
		if ( SobiPro.jQuery( '#SPSearchBox' ).val() == spSearchDefStr ) {
			SobiPro.jQuery( '#SPSearchBox' ).val( '' );
		}
	} );
	SobiPro.jQuery( '#SPSearchBox' ).bind( 'blur', function ()
	{
		spSearchDefStr = spSearchDefStr == '' ? SobiPro.Txt( 'SH.SEARCH_FOR_BOX' ) : spSearchDefStr;
		if ( SobiPro.jQuery( '#SPSearchBox' ).val() == '' ) {
			SobiPro.jQuery( '#SPSearchBox' ).val( spSearchDefStr );
		}
	} );
	SobiPro.jQuery( '.spsearchphrase' ).each( function ()
	{
		if ( SobiPro.jQuery( this ).hasClass( 'active' ) ) {
			SobiPro.jQuery( '#spsearchphrase' ).val( SobiPro.jQuery( this ).val() );
		}
	} );
	SobiPro.jQuery( '.spsearchphrase' ).click( function ()
	{
		SobiPro.jQuery( '#spsearchphrase' ).val( SobiPro.jQuery( this ).val() );
	} );
	try {
		SobiPro.jQuery( '#SPExtSearch' ).slideToggle( 'fast' );
		SobiPro.jQuery( '#SPExOptBt' ).bind( 'click', function ()
		{
			SobiPro.jQuery( '#SPExtSearch' ).slideToggle( 'fast' );
		} );
	}
	catch ( e ) {
	}
} );
