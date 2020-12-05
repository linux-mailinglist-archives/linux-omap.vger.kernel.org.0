Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D913E2CFB9E
	for <lists+linux-omap@lfdr.de>; Sat,  5 Dec 2020 15:57:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726578AbgLEO4G (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 5 Dec 2020 09:56:06 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.164]:17446 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726472AbgLEOwy (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 5 Dec 2020 09:52:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1607179744;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=TyW1m57J3F2Y9KutR2AU6eeirTWuUd91dzI4NsWas4g=;
        b=MQNiGWz4P8GhvcAVVIwa91Ga5TX31M1Z8tHF/h1L7bebacSGJASxbRsGuQqeVIXSWx
        nyiK9jMipeM7xUBpMFF5FQsTM6QbFUcpfhVCF1V7vaZ2z8kympSrTfV9s4/MgnDtg3Z1
        gvdMp9hn2+BZrli+QWGdGamcVjV3V16bAx3MFo4hTtD316hrAmuX7jsA3yB1791127hc
        H9AKvGtJ5DtRQ6gyaeZ7APeKFlWit1KIeKlTA19Bfw+dKi/ntiNgX1wct8xsWdab72aE
        8RflKrTxx8izBDAsCnu4xS6usskCl+Wo4s/Rv+qK8vhC2bmVd+61hcHxkFKdIsyWq0QM
        xWKQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGHPrtwDCrvXQ="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 47.3.4 DYNA|AUTH)
        with ESMTPSA id N02faawB5EmlkGx
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Sat, 5 Dec 2020 15:48:47 +0100 (CET)
Subject: Re: Understanding OMAP5 DPLL_ABE and CM_CLKSEL_WKUPAON
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <9920C431-6841-4813-92B1-8FB1E8BC7833@goldelico.com>
Date:   Sat, 5 Dec 2020 15:48:46 +0100
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Tero Kristo <t-kristo@ti.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com,
        Andreas Kemnade <andreas@kemnade.info>,
        Tony Lindgren <tony@atomide.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <2A854345-73EA-475E-8827-7AA3D378349C@goldelico.com>
References: <c077ece056713ad120b3d2fd59916aab1248cd1c.camel@ds0.me> <20200727082833.GB2811@atomide.com> <ac19052a552660c86838709f071cffe0f3e65932.camel@ds0.me> <20200728084257.GF2811@atomide.com> <B66CD988-7339-44C2-B750-9FA2088D86FA@goldelico.com> <20201201073753.GV26857@atomide.com> <9920C431-6841-4813-92B1-8FB1E8BC7833@goldelico.com>
To:     David Shah <dave@ds0.me>
X-Mailer: Apple Mail (2.3124)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi David,

> Am 02.12.2020 um 16:10 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>=20
> Hi David,
>=20
>> Am 01.12.2020 um 08:37 schrieb Tony Lindgren <tony@atomide.com>:
>>=20
>> * H. Nikolaus Schaller <hns@goldelico.com> [201123 20:11]:
>>> Hi David and Tony,
>>>=20
>>>> Am 28.07.2020 um 10:42 schrieb Tony Lindgren <tony@atomide.com>:
>>>>=20
>>>> * David Shah <dave@ds0.me> [200727 08:58]:
>>>>> On Mon, 2020-07-27 at 01:28 -0700, Tony Lindgren wrote:
>>>>>> If it only needs to be configured to 1 for reboot, sounds like it
>>>>>> should
>>>>>> be set in omap44xx_restart(). And we should also set it to 1 for
>>>>>> omap4
>>>>>> too.
>>>>>=20
>>>>> omap44xx_restart doesn't seem like the right place to me, as the =
bug
>>>>> also affects hard resets (i.e. NRESWARM assertion) and it would be =
nice
>>>>> to have these working, too.
>>>>=20
>>>> Ah right, the device reboots fine, but the rebooted kernel
>>>> won't initialize properly.
>>>>=20
>>>>> Would a better solution be to set it early during startup (the =
first
>>>>> part of clock init), and then clear it when the DPLLs are set up =
and
>>>>> locked?
>>>>=20
>>>> Yes sounds like then the place to configure this is in the
>>>> drivers/clk/ti/clk-54xx.c omap5xxx_dt_clk_init(). Maybe add
>>>> a comment to the patch description that a similar patch may
>>>> be also needed for omap4 on some devices.
>>>=20
>>> It seems as if the conclusion was that the patch is at the right
>>> location omap5xxx_dt_clk_init(). Has it been merged somewhere?
>>>=20
>>> It seems as if we still need it in our 5.10-rc series:
>>>=20
>>> =
https://git.goldelico.com/?p=3Dletux-kernel.git;a=3Dcommit;h=3Daa8eda144e8=
faa185e154710ca0eef12adb2d29d
>>=20
>> I recall Dave needs to resend it to the clock maintainers as
>> listed with scripts/get_maintainer.pl -f option.
>=20
> Do you think you will find to push this upstream?

I hope your are well.

If you don't disagree I can add some of your original description
to the commit message and your and my signed-off and post it for
review.

BR and thanks,
Nikolaus

