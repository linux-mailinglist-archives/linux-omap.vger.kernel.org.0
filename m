Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1C0223304F
	for <lists+linux-omap@lfdr.de>; Thu, 30 Jul 2020 12:24:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726707AbgG3KYe (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 Jul 2020 06:24:34 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.167]:24256 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbgG3KYe (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 30 Jul 2020 06:24:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1596104672;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=5eS+BVhe8xR/vNU0oSAQGqLHjYljN5F6k3SOrv5G/WQ=;
        b=Wh/TwJA06GpCKRE8Ko9bjSkFFzFzVNom4HpETO6/guHnUZkEUJx3pu+gbV9sCRgiGF
        bfCWWhjStqW6ozeLKXkrXxgVopjgd0dajwibO2+oAnajZYbPum+7NA4ixFtr5UGSBjzb
        PRIy4s7fP/dfp+/JFTzjCQbLjiei+5JCT/avnQQcp7qDBp01gVCORn3LKKCEUldeq5GS
        VdVfiTECCFDXwXCAderALExM1Nnry01E65uGV38oFniTn7+aZzhl3jChFRFg3rOFscB/
        aKX9jPkt4xxwcr0kU8zIWjDGFoQhKpwGVk4HGCiYcOLBwZkx1PHLPpKiPT9L1YzOJ1/9
        ueuw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGHPrvwDOrng=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
        with ESMTPSA id V07054w6UAOOJMq
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Thu, 30 Jul 2020 12:24:24 +0200 (CEST)
Subject: Re: BUG: omap5: v5.8-rc7 boot fails
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200729115525.GG2811@atomide.com>
Date:   Thu, 30 Jul 2020 12:24:23 +0200
Cc:     Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
        kernel@pyra-handheld.com, Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <A5FDB933-0B23-43DE-840D-AA9126A5E60A@goldelico.com>
References: <3FEECC44-3156-4786-8DF9-149F8CA9B41D@goldelico.com> <20200728082348.GD2811@atomide.com> <20200729115525.GG2811@atomide.com>
To:     Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

> Am 29.07.2020 um 13:55 schrieb Tony Lindgren <tony@atomide.com>:
>=20
> * Tony Lindgren <tony@atomide.com> [200728 08:23]:
>> * H. Nikolaus Schaller <hns@goldelico.com> [200727 20:51]:
>>> Hi Tony,
>>> after trying v5.8-rc7 the Pyra boot hangs after ca. 3 seconds
>>> (a little random what the last log line is).
>>>=20
>>> I could bisect it to:
>>>=20
>>> 6cfcd5563b4fadbf49ba8fa481978e5e86d30322 is the first bad commit
>>> commit 6cfcd5563b4fadbf49ba8fa481978e5e86d30322
>>> Author: Tony Lindgren <tony@atomide.com>
>>> Date:   Mon Jul 13 09:26:01 2020 -0700
>>>=20
>>>    clocksource/drivers/timer-ti-dm: Fix suspend and resume for am3 =
and am4
>>>=20
>>> And a git revert makes it boot again.
>>>=20
>>> I haven't had time to do more tests (e.g. with omap3/4 or on =
omap5uevm).
>>=20
>> Oops sorry about that, I'll take a look.
>=20
> This fixes booting for me,

yes, I can confirm that this fixes the omap5 Pyra.

And there seems to be no regression on dm3730 GTA04 (but I didn't notice =
the bug either, although it also uses a pwm_dmtimer).

BR and thanks,
Nikolaus

> but I still need to check if we also
> need to enable before the reset. And then this needs to be tested
> on all the related SoCs again.
>=20
> Regards,
>=20
> Tony
>=20
> 8< ------------------
> diff --git a/drivers/clocksource/timer-ti-dm-systimer.c =
b/drivers/clocksource/timer-ti-dm-systimer.c
> --- a/drivers/clocksource/timer-ti-dm-systimer.c
> +++ b/drivers/clocksource/timer-ti-dm-systimer.c
> @@ -409,8 +409,8 @@ static int __init dmtimer_systimer_setup(struct =
device_node *np,
> 	t->wakeup =3D regbase + _OMAP_TIMER_WAKEUP_EN_OFFSET;
> 	t->ifctrl =3D regbase + _OMAP_TIMER_IF_CTRL_OFFSET;
>=20
> -	dmtimer_systimer_enable(t);
> 	dmtimer_systimer_reset(t);
> +	dmtimer_systimer_enable(t);
> 	pr_debug("dmtimer rev %08x sysc %08x\n", readl_relaxed(t->base),
> 		 readl_relaxed(t->base + t->sysc));
>=20

