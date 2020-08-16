Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BB6824574D
	for <lists+linux-omap@lfdr.de>; Sun, 16 Aug 2020 13:25:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728913AbgHPLZK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 16 Aug 2020 07:25:10 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.165]:25156 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726971AbgHPLZG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 16 Aug 2020 07:25:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1597577098;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=RbaWvxLbZYhYmRBCvlGb2AaBi8Bxa6oAcs3HYd06/Tg=;
        b=Cs7/UimIFpUJ8Hq52jhqHC+AnEq12/ZzGYR9o84LHdw3yscOrEn1RZ7f2tQqvk57Qv
        OT9KQeh4TnE1mllNy2eTLiBW8zGZXBkG9jtrE2SPCBbYBxgPPRk7uyPBivz2CC4pyxz1
        tjnLYhJEayGMVA4VQ2MGzOJhO9bCyF4zGQBo1mvAFBryUyhUiae7L8FWLLTVleBwuVNm
        97JN0IdMYDm5JsqF2jJv+a5+3SX7xMqaUI8uTooFwTPuLSVqp/wIY8xtHMrxOeZo7JLf
        ECAdKXnCmZ0M1cTl4llVma4OTH9b73+6Oa2Pc2Lu6iArh8qyl071Mm+HQGXx3uwLyIUb
        f9mQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGHPrpwDOpoA=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
        with ESMTPSA id V07054w7GBOmJJG
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Sun, 16 Aug 2020 13:24:48 +0200 (CEST)
Subject: Re: [Letux-kernel] module_mipi_dsi_driver panel with omapdrm?
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <63501267004c35bd1dc6971cb9cddda07c967303.camel@ds0.me>
Date:   Sun, 16 Aug 2020 13:24:47 +0200
Cc:     Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jyri Sarha <jsarha@ti.com>, kernel@pyra-handheld.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <83C454BF-F443-4C8F-904E-D6745A01A296@goldelico.com>
References: <20200706143613.GS37466@atomide.com> <E4616E3C-2519-4421-BC75-87A5CA2BB9EF@goldelico.com> <20200707180115.GB5849@atomide.com> <ECE29C41-DFE5-4A50-9206-6FB3183824C3@goldelico.com> <6E0A9415-9AB5-48D9-9E61-12D20655D04D@goldelico.com> <EE54FB82-C18E-4B81-AB38-E9453A32406B@goldelico.com> <20200724012411.GJ21353@pendragon.ideasonboard.com> <7023EB05-DC29-4D42-84C8-F0D14B50467D@goldelico.com> <20200801232259.hitcfosiq6f2i57y@earth.universe> <4F1BD997-B791-4570-92B9-552C9BFF1350@goldelico.com> <20200805112831.akufm5wxkwqehiff@earth.universe> <0DDD1D3E-4F63-44B4-91CA-1B5B853837BC@goldelico.com> <64416676-a2ea-f11e-4d07-51a3efb55cdd@ti.com> <7ef4e081c1a0db81fd98f9e94afc6228a9b68703.camel@ds0.me> <1ec9febeb685c7fa866b14b0a4c2a5026f0a3461.camel@ds0.me> <63501267004c35bd1dc6971cb9cddda07c967303.camel@ds0.me>
To:     David Shah <dave@ds0.me>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi David,

> Am 06.08.2020 um 20:44 schrieb David Shah <dave@ds0.me>:
>=20
> Following a bit of testing, the DSI issues are fixed by=20
> =
https://github.com/daveshah1/pyra-kernel-devel/commit/3161275854a0f2cd44a5=
5b8eb039bd201f894486
> (I will prepare a proper patch set shortly). This makes the display
> work with HDMI disabled.

yes, it makes the LCD work (tested so far on 5.8-rc7).
But even with HDMI enabled.

>=20
> There also seems to be a race condition between the hdmi0 connector
> and tpd12s015 "encoder". This results in the tpd12s015 permanently
> returning EPROBE_DEFER and the display subsystem never successfully
> probing.

>=20
> Reversing the order of the encoder and connector in the device tree
> (omap5-board-common.dtsi) makes the display work again with HDMI
> enabled; as does adding some printks to the display-connector driver.

I didn't have to disable or reverse the order. Maybe the speed of the SD
card also has an influcence...

So I'll backport it to all our affected Letux kernels until it is =
merged/fixed
upstream.

Then we can work on debugging/testing a module_mipi_dsi_driver based =
panel
drivers as soon as Sebastian's new patches become available.

BR and thanks,
Nikolaus

>=20
> On Thu, 2020-08-06 at 17:04 +0100, David Shah wrote:
>> Sorry, my error. I forgot the Pyra is LPAE and therefore using 64-bit
>> physical addresses.
>>=20
>> The start is indeed a correct physical address, 0x58005000, but off
>> by
>> 0x1000 from what the DSI driver is expecting.
>>=20
>> On Thu, 2020-08-06 at 16:50 +0100, David Shah wrote:
>>> I had a moment to give letux-5.7.y a test on the Pyra hardware.
>>>=20
>>> I notice an error in dmesg:
>>>=20
>>> DSI: omapdss DSI error: unsupported DSI module
>>>=20
>>> which comes from this code (with a small patch added by me):
>>>=20
>>> 	d =3D dsi->data->modules;
>>> 	while (d->address !=3D 0 && d->address !=3D dsi_mem->start)
>>> 		d++;
>>>=20
>>> 	if (d->address =3D=3D 0) {
>>> 		DSSERR("unsupported DSI module (start: %08x)\n",
>>> dsi_mem->start);
>>> 		return -ENODEV;
>>> 	}
>>>=20
>>> "start" here is c0b3ba5c - a kernel virtual address - which
>>> definitely
>>> doesn't seem right as it would never match.=20
>>>=20
>>> Not sure my kernel-fu is quite up to tracking this down yet, but I
>>> will
>>> keep trying to trace out what is happening.
>>>=20
>>> Best
>>>=20
>>> Davidg
>>>=20
>>> On Wed, 2020-08-05 at 15:08 +0300, Tomi Valkeinen wrote:
>>>> On 05/08/2020 14:49, H. Nikolaus Schaller wrote:
>>>>> Hi,
>>>>>=20
>>>>>> Am 05.08.2020 um 13:28 schrieb Sebastian Reichel <
>>>>>> sebastian.reichel@collabora.com>:
>>>>>>=20
>>>>>> Hi,
>>>>>>=20
>>>>>> On Wed, Aug 05, 2020 at 11:19:20AM +0200, H. Nikolaus
>>>>>> Schaller
>>>>>> wrote:
>>>>>>> What I do not yet understand is how Laurent's patch should
>>>>>>> be
>>>>>>> able
>>>>>>> to break it.
>>>>>>=20
>>>>>> omapdrm will not probe successfully if any DT enabled
>>>>>> component
>>>>>> does not probe correctly. Since the patch you identified
>>>>>> touched
>>>>>> HDMI and VENC and you are probably using HDMI, I suggest
>>>>>> looking
>>>>>> there first.
>>>>>=20
>>>>> Yes, that is a very good explanation.
>>>>>=20
>>>>> Maybe there is a subtle change in how the HDMI connector has to
>>>>> be
>>>>> defined
>>>>> which is missing in our (private) DTB. Maybe the OMAP5-uEVM DTS
>>>>> gives a hint.
>>>>>=20
>>>>> A quick check shows last hdmi specific change for omap5-board-
>>>>> common or uevm
>>>>> was in 2017 but I may have missed something.
>>>>>=20
>>>>> There are 715a5a978733f0 and 671ab615bd507f which arrived in
>>>>> v5.7-
>>>>> rc1 as well
>>>>> and are related to hdmi clocks. So this may be (or not) and
>>>>> influencing factor.
>>>>=20
>>>> HDMI should "just work", and has been tested. But maybe there's
>>>> some
>>>> conflict with HDMI and DSI.
>>>>=20
>>>> Tomi
>>>>=20
>>>=20
>>> _______________________________________________
>>> https://projects.goldelico.com/p/gta04-kernel/
>>> Letux-kernel mailing list
>>> Letux-kernel@openphoenux.org
>>> http://lists.goldelico.com/mailman/listinfo.cgi/letux-kernel
>>=20
>> _______________________________________________
>> Kernel mailing list
>> Kernel@pyra-handheld.com
>> http://pyra-handheld.com/cgi-bin/mailman/listinfo/kernel
>=20

