Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42C1813C1A7
	for <lists+linux-omap@lfdr.de>; Wed, 15 Jan 2020 13:50:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728984AbgAOMuB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 15 Jan 2020 07:50:01 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:8555 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726483AbgAOMuB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 15 Jan 2020 07:50:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1579092598;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=FlKYrcfTx+j6HFG2OMx3UB6x+Hgicmbld9+5zOIqrjU=;
        b=PDfxuYXtaSMi3poGzSW0+HzE9GKFxC0Zu1xLLHKEUmVCRmkfXusW9tIgbVfhGwY82Z
        C+f7XBvwghSAtsv1INI5iYAC3pKbxVt7gMbZHpqEqhUxRsh6pX3vwhhcPLw2+HZYBXu0
        oCIhlQ6HtIesuFWQvg7lhqXC6ODklN0Sq+te9I6HaixZhhVgRsdzz7Lcyq4ETAWE4OkE
        dDONPz3wvjFzaQQ+p2g68K1z4xAqvEaxHvYX1pic1+kbQR7Demy0adC8ybpV9WGD8bVf
        1FWjIDMEx4qONZIgnM+L7Ge/PoCpwb/6I1G8KDo+jgznmv/FhfiNqStt9l+QWXjK2hm6
        wLQQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmAvw43knb0="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.1.4 DYNA|AUTH)
        with ESMTPSA id c04ea5w0FCnrTgf
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 15 Jan 2020 13:49:53 +0100 (CET)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH] ARM: dts: Configure omap5 AESS
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200114210039.GT5885@atomide.com>
Date:   Wed, 15 Jan 2020 13:49:52 +0100
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org,
        Matthijs van Duin <matthijsvanduin@gmail.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Tero Kristo <t-kristo@ti.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <5E0BF30D-2723-4724-89E1-449230758EE2@goldelico.com>
References: <20200114150937.18304-1-tony@atomide.com> <52905C15-A2D1-4372-9781-D602D0B274B6@goldelico.com> <20200114164613.GR5885@atomide.com> <D51230C4-2642-4388-959F-313A3382AB99@goldelico.com> <20200114171634.GS5885@atomide.com> <632E66D6-47EF-44CF-BF02-B0F5A215D904@goldelico.com> <ACB71118-B121-4CF7-934D-A88654366E8F@goldelico.com> <20200114210039.GT5885@atomide.com>
To:     Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Am 14.01.2020 um 22:00 schrieb Tony Lindgren <tony@atomide.com>:
>=20
> * H. Nikolaus Schaller <hns@goldelico.com> [200114 18:40]:
>> I have checked our tree and it is already built into a separate =
module with
>>=20
>> sound/soc/ti/aess/omap-aess-core.c:	{ .compatible =3D =
"ti,omap4-aess", },
>>=20
>> So
>>=20
>>> target-module@f1000 {			/* 0x401f1000, ap 32 =
20.0 */
>>> 	...
>>> 	aess: aess {
>>> 		compatible =3D "ti,omap4-aess";
>>> 		status =3D "disabled";
>>> 	};
>>> };
>>=20
>> would be what we will need.
>=20
> OK good to hear.

I have cleaned up my working tree and added your patches and the one
above (without status =3D "disabled" and could
a) boot well
b) see that the (non-working) aess driver module is loaded through child =
node

So you can add my Tested-by: Nikolaus Schaller <hns@goldelico.com>

BR and thanks,
Nikolaus

