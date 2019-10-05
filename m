Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96FB6CCB13
	for <lists+linux-omap@lfdr.de>; Sat,  5 Oct 2019 18:20:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726318AbfJEQUt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 5 Oct 2019 12:20:49 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.165]:13561 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726114AbfJEQUt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 5 Oct 2019 12:20:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1570292446;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=rUueBqAEeewEqXL83wlhxWPHm4ysz6LdEd5xrKZsuN8=;
        b=qHHii3TascOf/pxum1dV6L4qqhr/UILgWIDZrNV90++B/ZffWqE3shVCZGZk5voMXW
        8GlhQltG8mukdkzXpwCKM15PxK8hpPmizRRB1Q/PWBf38KKW8g2NK9rVSrjoLLM0SP2e
        /U7qVpVaB4KaNs1d+m3XulufD3KmrhV0D1fswS7DTXECHC5hVApynLCf6OLaluw3ov6h
        niFlUJDio3v2yNFSWCMSWGGdBWcZvdsFxkU7Lo0e1J7e3uQEqxnM62sz0HGXhEJlutCt
        QUuUl+F/9lHE3FTVs9GR6bm2inuH/yyYPFlmzR9Qywoz9z2rthiygXbqfxrZyRqs6SJO
        OqLw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmAlw47tvfA="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 44.28.0 DYNA|AUTH)
        with ESMTPSA id v00409v95GKPju2
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Sat, 5 Oct 2019 18:20:25 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH 4/6] ARM: dts: Configure sgx for omap5
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20190826145530.GT52127@atomide.com>
Date:   Sat, 5 Oct 2019 18:20:25 +0200
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        devicetree <devicetree@vger.kernel.org>,
        Adam Ford <aford173@gmail.com>,
        =?utf-8?Q?Filip_Matijevi=C4=87?= <filip.matijevic.pz@gmail.com>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        moaz korena <moaz@korena.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        =?utf-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Philipp Rossak <embed3d@gmail.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Tero Kristo <t-kristo@ti.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <45A3C28C-69DE-4056-9786-3257B129D060@goldelico.com>
References: <20190814131408.57162-1-tony@atomide.com> <20190814131408.57162-5-tony@atomide.com> <20190815182348.8A1BA2063F@mail.kernel.org> <20190817065615.GI52127@atomide.com> <20190826145530.GT52127@atomide.com>
To:     Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

> Am 26.08.2019 um 16:55 schrieb Tony Lindgren <tony@atomide.com>:
>=20
> * Tony Lindgren <tony@atomide.com> [190817 06:56]:
>> * Stephen Boyd <sboyd@kernel.org> [190815 18:24]:
>>> Quoting Tony Lindgren (2019-08-14 06:14:06)
>>>> diff --git a/arch/arm/boot/dts/omap54xx-clocks.dtsi =
b/arch/arm/boot/dts/omap54xx-clocks.dtsi
>>>> --- a/arch/arm/boot/dts/omap54xx-clocks.dtsi
>>>> +++ b/arch/arm/boot/dts/omap54xx-clocks.dtsi
>>>> @@ -1146,6 +1146,20 @@
>>>>                };
>>>>        };
>>>>=20
>>>> +       gpu_cm: gpu_cm@1500 {
>>>=20
>>> Node names shouldn't have underscores. Maybe clock-controller?
>>=20
>> OK yeah clock-controller sounds good to me.
>=20
> Below is this one updated to use clock-controller naming.
>=20
> Regards,
>=20
> Tony
>=20
> 8< ---------------------------
> =46rom tony Mon Sep 17 00:00:00 2001
> From: Tony Lindgren <tony@atomide.com>
> Date: Wed, 14 Aug 2019 05:18:16 -0700
> Subject: [PATCH] ARM: dts: Configure sgx for omap5
> MIME-Version: 1.0
> Content-Type: text/plain; charset=3DUTF-8
> Content-Transfer-Encoding: 8bit
>=20
> I've tested that the interconnect target module enables and idles
> just fine when probed with ti-sysc with PM runtime control via sys:
>=20
> # echo on > $(find /sys -name control | grep \/5600)

Patch has arrived in v5.4-rc1 but does not work in that environment for =
me:

root@letux:~# echo on > $(find /sys -name control | grep \/5600)
[  213.490926] clock-controller:clk:0000:0: failed to enable
root@letux:~# uname -a
Linux letux 5.4.0-rc1+ #1083 SMP Sat Oct 5 17:47:13 CEST 2019 armv7l =
GNU/Linux
root@letux:~# find /sys -name control | grep \/5600
/sys/devices/platform/44000000.ocp/5600fe00.target-module/power/control
root@letux:~#

I have tested our own tree but also mainline (plus some minimal
patch set to run the Pyra) using omap2plus_defconfig.

Does it work on omap5uevm?

Is there some related patch needed that did not yet arrive in v5.4-rc1?

BR and thanks,
Nikolaus

