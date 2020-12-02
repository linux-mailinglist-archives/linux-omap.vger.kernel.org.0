Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AC2E2CC080
	for <lists+linux-omap@lfdr.de>; Wed,  2 Dec 2020 16:14:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728099AbgLBPNk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 2 Dec 2020 10:13:40 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.51]:22613 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727315AbgLBPNk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 2 Dec 2020 10:13:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1606921848;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=4tuLBquUzhnMPGXmatITflnxZ9VsRPiymqp2Up/v1eU=;
        b=IEwruCpTy79v7ez1NkdogCVVPo9NmW+1ij3am+qCBZGNz2nJm1gEGHC+9MpTIrMUuq
        FOEU98B11SfyRSuzglBOgiICrqbCWOhB87dub+eYga28/TK3TqtdvCgqeGvwSaG2yPR2
        K6gAa4isMFKt1yd1V/7xJtOLych9FOr20JUmlXmMaF2p+EJMKUxBdpWVcmeOmRQJOt2t
        Bch/dawxcu/FbcsHQ4yEh06YCSZJ32zuL9L6VQ7CgOI/n0PlyJEEnJuj3A+RtDaD9zLx
        XK+px5yOJTJArPOeeLDnBH2+B9IqIDPhbt0UdH6JZauLLE5j6PfD19/SCOIE8gk/Gnel
        9Riw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmMlw4jpZQ=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 47.3.4 DYNA|AUTH)
        with ESMTPSA id N02faawB2FATa0N
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 2 Dec 2020 16:10:29 +0100 (CET)
Subject: Re: Understanding OMAP5 DPLL_ABE and CM_CLKSEL_WKUPAON
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20201201073753.GV26857@atomide.com>
Date:   Wed, 2 Dec 2020 16:10:27 +0100
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Tero Kristo <t-kristo@ti.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com,
        Andreas Kemnade <andreas@kemnade.info>,
        Tony Lindgren <tony@atomide.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <9920C431-6841-4813-92B1-8FB1E8BC7833@goldelico.com>
References: <c077ece056713ad120b3d2fd59916aab1248cd1c.camel@ds0.me> <20200727082833.GB2811@atomide.com> <ac19052a552660c86838709f071cffe0f3e65932.camel@ds0.me> <20200728084257.GF2811@atomide.com> <B66CD988-7339-44C2-B750-9FA2088D86FA@goldelico.com> <20201201073753.GV26857@atomide.com>
To:     David Shah <dave@ds0.me>
X-Mailer: Apple Mail (2.3124)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi David,

> Am 01.12.2020 um 08:37 schrieb Tony Lindgren <tony@atomide.com>:
>=20
> * H. Nikolaus Schaller <hns@goldelico.com> [201123 20:11]:
>> Hi David and Tony,
>>=20
>>> Am 28.07.2020 um 10:42 schrieb Tony Lindgren <tony@atomide.com>:
>>>=20
>>> * David Shah <dave@ds0.me> [200727 08:58]:
>>>> On Mon, 2020-07-27 at 01:28 -0700, Tony Lindgren wrote:
>>>>> If it only needs to be configured to 1 for reboot, sounds like it
>>>>> should
>>>>> be set in omap44xx_restart(). And we should also set it to 1 for
>>>>> omap4
>>>>> too.
>>>>=20
>>>> omap44xx_restart doesn't seem like the right place to me, as the =
bug
>>>> also affects hard resets (i.e. NRESWARM assertion) and it would be =
nice
>>>> to have these working, too.
>>>=20
>>> Ah right, the device reboots fine, but the rebooted kernel
>>> won't initialize properly.
>>>=20
>>>> Would a better solution be to set it early during startup (the =
first
>>>> part of clock init), and then clear it when the DPLLs are set up =
and
>>>> locked?
>>>=20
>>> Yes sounds like then the place to configure this is in the
>>> drivers/clk/ti/clk-54xx.c omap5xxx_dt_clk_init(). Maybe add
>>> a comment to the patch description that a similar patch may
>>> be also needed for omap4 on some devices.
>>=20
>> It seems as if the conclusion was that the patch is at the right
>> location omap5xxx_dt_clk_init(). Has it been merged somewhere?
>>=20
>> It seems as if we still need it in our 5.10-rc series:
>>=20
>> =
https://git.goldelico.com/?p=3Dletux-kernel.git;a=3Dcommit;h=3Daa8eda144e8=
faa185e154710ca0eef12adb2d29d
>=20
> I recall Dave needs to resend it to the clock maintainers as
> listed with scripts/get_maintainer.pl -f option.

Do you think you will find to push this upstream?

BR and thanks,
Nikolaus

