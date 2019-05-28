Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DF042C523
	for <lists+linux-omap@lfdr.de>; Tue, 28 May 2019 13:06:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726747AbfE1LGc convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-omap@lfdr.de>); Tue, 28 May 2019 07:06:32 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([146.101.78.151]:37051 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726512AbfE1LGc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Tue, 28 May 2019 07:06:32 -0400
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-51-I9st8qMRPWGW6eWon_ML-A-1; Tue, 28 May 2019 12:06:27 +0100
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Tue, 28 May 2019 12:06:26 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Tue, 28 May 2019 12:06:26 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Tony Lindgren' <tony@atomide.com>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
CC:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        "Roger Quadros" <rogerq@ti.com>, Suman Anna <s-anna@ti.com>,
        Tero Kristo <t-kristo@ti.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Rob Herring <robh@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH 01/12] bus: ti-sysc: Support 16-bit writes too
Thread-Topic: [PATCH 01/12] bus: ti-sysc: Support 16-bit writes too
Thread-Index: AQHVFIXZIpY/mCelSky05+1Jud+wtaaAYYxw
Date:   Tue, 28 May 2019 11:06:26 +0000
Message-ID: <5e9a31dfdfd843469c51106fce9ea353@AcuMS.aculab.com>
References: <20190527121348.45251-1-tony@atomide.com>
 <20190527121348.45251-2-tony@atomide.com>
In-Reply-To: <20190527121348.45251-2-tony@atomide.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-MC-Unique: I9st8qMRPWGW6eWon_ML-A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Tony Lindgren
> Sent: 27 May 2019 13:14
> We need to also support 16-bit writes for i2c in addition to the reads
> when we start configuring the sysconfig register for reset and idle modes.
> 
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  drivers/bus/ti-sysc.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
> --- a/drivers/bus/ti-sysc.c
> +++ b/drivers/bus/ti-sysc.c
> @@ -100,6 +100,13 @@ static void sysc_parse_dts_quirks(struct sysc *ddata, struct device_node *np,
> 
>  static void sysc_write(struct sysc *ddata, int offset, u32 value)
>  {
> +	if (ddata->cfg.quirks & SYSC_QUIRK_16BIT) {
> +		writew_relaxed(value & 0xffff, ddata->module_va + offset);
> +		writew_relaxed(value >> 16, ddata->module_va + offset + 4);

Should that be + 2 ???

> +
> +		return;
> +	}
> +
>  	writel_relaxed(value, ddata->module_va + offset);
>  }

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

