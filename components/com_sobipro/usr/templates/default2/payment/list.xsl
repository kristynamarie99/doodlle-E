<?xml version="1.0" encoding="UTF-8"?>
<!--
 @version: $Id: list.xsl 3090 2013-02-05 16:29:40Z Sigrid Suski $
 @package: SobiPro Component for Joomla!

 @author
 Name: Sigrid Suski & Radek Suski, Sigsiu.NET GmbH
 Email: sobi[at]sigsiu.net
 Url: http://www.Sigsiu.NET

 @copyright Copyright (C) 2006 - 2013 Sigsiu.NET GmbH (http://www.sigsiu.net). All rights reserved.
 @license GNU/GPL Version 3
 This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License version 3
 as published by the Free Software Foundation, and under the additional terms according section 7 of GPL v3.
 See http://www.gnu.org/licenses/gpl.html and http://sobipro.sigsiu.net/licenses.

 This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

 $Date: 2013-02-05 17:29:40 +0100 (Tue, 05 Feb 2013) $
 $Revision: 3090 $
 $Author: Sigrid Suski $
 File location: components/com_sobipro/usr/templates/default2/payment/list.xsl $
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:php="http://php.net/xsl">
	<xsl:output method="xml" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" encoding="UTF-8" />
	<xsl:template name="paymentTable">
		<table class="table table-striped payment">
			<thead>
				<tr>
					<td>#</td>
					<td>
						<xsl:value-of select="php:function( 'SobiPro::Txt', 'PAYMENT_POSITION_NAME' )" />
					</td>
					<td>
						<div class="pull-right">
							<xsl:value-of select="php:function( 'SobiPro::Txt', 'PAYMENT_POSITION_NET' )" />
						</div>
					</td>
					<td>
						<div class="pull-right">
							<xsl:value-of select="php:function( 'SobiPro::Txt', 'PAYMENT_POSITION_GROSS' )" />
						</div>
					</td>
				</tr>
			</thead>
			<tbody>
				<xsl:for-each select="positions/position">
					<tr>
						<td>
							<xsl:value-of select="position()" />
						</td>
						<td>
							<xsl:value-of select="." />
						</td>
						<td>
							<div class="pull-right">
								<xsl:value-of select="@netto" />
							</div>
						</td>
						<td>
							<div class="pull-right">
								<xsl:value-of select="@brutto" />
							</div>
						</td>
					</tr>
				</xsl:for-each>
				<tr class="summary">
					<td colspan="4">
						<xsl:value-of select="php:function( 'SobiPro::Txt', 'PAYMENT_POSITION_SUMMARY' )" />:
					</td>
				</tr>
				<tr class="info">
					<td colspan="3">
						<div class="pull-right">
							<xsl:value-of select="php:function( 'SobiPro::Txt', 'PAYMENT_POSITION_NET' )" />
						</div>
					</td>
					<td>
						<div class="pull-right">
							<xsl:value-of select="summary/@sum_netto" />
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<div class="pull-right">
							<xsl:value-of select="php:function( 'SobiPro::Txt', 'VAT' )" />
							(<xsl:value-of select="summary/@vat" />)
						</div>
					</td>
					<td>
						<div class="pull-right">
							<xsl:value-of select="summary/@sum_vat" />
						</div>
					</td>
				</tr>
				<tr class="success sum">
					<td colspan="3">
						<div class="pull-right">
							<xsl:value-of select="php:function( 'SobiPro::Txt', 'PAYMENT_POSITION_GROSS' )" />
						</div>
					</td>
					<td>
						<div class="pull-right">
							<xsl:value-of select="summary/@sum_brutto" />
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</xsl:template>
</xsl:stylesheet>
