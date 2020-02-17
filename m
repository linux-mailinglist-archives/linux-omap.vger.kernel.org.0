Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB3A6161BAA
	for <lists+linux-omap@lfdr.de>; Mon, 17 Feb 2020 20:34:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728676AbgBQTeM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Feb 2020 14:34:12 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:16468 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728667AbgBQTeM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 17 Feb 2020 14:34:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581968048;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=JE80blxQI6VLYnGi9efV9cXY2ZbMPR7Lde/gcX39Kqg=;
        b=p3M1KHTTjPj/dfKLxeVGY6uvx3tyfSxu3kKQhZGe1QQ5rF3bJSxnH9NevxhTBQoYFy
        +gQbjFBBy774Vs7ThujEOpa5n5e81kS2Gw6WXJeIV7FakwlkoEUDcuN+C+FiTigPWIeF
        bog9A25/cpuv5dQc3kEQg854Ug9EuosekKZxK7ScGH+6h62d6s+aA+yHoqQxh7ZBPl4N
        eMNiBaiEWoYTpxsJRr/dwgf2YlMu35qmxxIoL402Gk8PJq9DwPBPmZpJlKQf43ILf4U9
        i/fT44yNFGwnFdop2ifBKmuO5GS4N7fHKbRHkyBF+osfT1lC6Zgpg6hYU+kIzz1h+9Vt
        FMog==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDVCaXA0OXQ=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id U06217w1HJXrPJ4
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Mon, 17 Feb 2020 20:33:53 +0100 (CET)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH v3] extcon: palmas: hide error messages if gpio returns -EPROBE_DEFER
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200217190745.GA147152@lenoch>
Date:   Mon, 17 Feb 2020 20:33:52 +0100
Cc:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-omap@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <017C406F-0DD9-478F-8AD5-D950A4000305@goldelico.com>
References: <d5c2826a5f00fcaee62f00662ae2a44dc4a5395d.1581946695.git.hns@goldelico.com> <C3D9F783-EE45-4681-93D9-C1407284CB59@goldelico.com> <20200217182906.GA140676@lenoch> <012228CC-2B49-4AAE-B574-92E44621F0D6@goldelico.com> <20200217190745.GA147152@lenoch>
To:     Ladislav Michl <ladis@linux-mips.org>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Ladis,

> Am 17.02.2020 um 20:07 schrieb Ladislav Michl <ladis@linux-mips.org>:
>=20
> On Mon, Feb 17, 2020 at 07:38:16PM +0100, H. Nikolaus Schaller wrote:
>> Hi,
>>=20
>>> Am 17.02.2020 um 19:29 schrieb Ladislav Michl =
<ladis@linux-mips.org>:
>>>=20
>>> On Mon, Feb 17, 2020 at 02:58:14PM +0100, H. Nikolaus Schaller =
wrote:
>>>>=20
>>>>> Am 17.02.2020 um 14:38 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>>>>>=20
>>>>> If the gpios are probed after this driver (e.g. if they
>>>>> come from an i2c expander) there is no need to print an
>>>>> error message.
>>>>>=20
>>>>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>>>>> ---
>>>>> drivers/extcon/extcon-palmas.c | 8 ++++++--
>>>>> 1 file changed, 6 insertions(+), 2 deletions(-)
>>>>>=20
>>>>> diff --git a/drivers/extcon/extcon-palmas.c =
b/drivers/extcon/extcon-palmas.c
>>>>> index edc5016f46f1..cea58d0cb457 100644
>>>>> --- a/drivers/extcon/extcon-palmas.c
>>>>> +++ b/drivers/extcon/extcon-palmas.c
>>>>> @@ -205,14 +205,18 @@ static int palmas_usb_probe(struct =
platform_device *pdev)
>>>>>=20
>>>>> 	palmas_usb->id_gpiod =3D devm_gpiod_get_optional(&pdev->dev, =
"id",
>>>>> 							GPIOD_IN);
>>>>> -	if (IS_ERR(palmas_usb->id_gpiod)) {
>>>>> +	if (PTR_ERR(palmas_usb->id_gpiod) =3D=3D -EPROBE_DEFER) {
>>>>> +		return -EPROBE_DEFER;
>>>>> +	} else if (IS_ERR(palmas_usb->id_gpiod)) {
>>>>=20
>>>> Hm.
>>>>=20
>>>> While looking again at that: why do we need the "{" and "} else "?
>>>>=20
>>>> It should be sufficient to have
>>>>=20
>>>>> 	palmas_usb->id_gpiod =3D devm_gpiod_get_optional(&pdev->dev, =
"id",
>>>>> 							GPIOD_IN);
>>>>> +	if (PTR_ERR(palmas_usb->id_gpiod) =3D=3D -EPROBE_DEFER)
>>>>> +		return -EPROBE_DEFER;
>>>>> 	if (IS_ERR(palmas_usb->id_gpiod)) {
>>>>=20
>>>> What do you think is better coding style here?
>>>=20
>>> How about something like this? (just an idea with some work left for =
you ;-))
>>>=20
>>> --- a/drivers/extcon/extcon-palmas.c
>>> +++ b/drivers/extcon/extcon-palmas.c
>>> @@ -206,8 +206,10 @@ static int palmas_usb_probe(struct =
platform_device *pdev)
>>> 	palmas_usb->id_gpiod =3D devm_gpiod_get_optional(&pdev->dev, =
"id",
>>> 							GPIOD_IN);
>>> 	if (IS_ERR(palmas_usb->id_gpiod)) {
>>> -		dev_err(&pdev->dev, "failed to get id gpio\n");
>>> -		return PTR_ERR(palmas_usb->id_gpiod);
>>> +		status =3D PTR_ERR(palmas_usb->id_gpiod);
>>> +		if (status !=3D -EPROBE_DEFER)
>>> +			dev_err(&pdev->dev, "failed to get id gpio: =
%d\n", status);
>>> +		return status;
>>> 	}
>>=20
>> Well, what would be the improvement?
>=20
> Linux kernel prints so many lines on bootup and only few of them are
> valuable. Lets improve it by printing error value to give a clue
> why it failed.

Hm. The upstream code does already print the error. This feature is not =
removed.
But it is also printing an error in the EPROBE_DEFER case as well, where =
it is
not needed or not an error.

And that is the whole purpose of this patch to get rid of it in the =
EPROBE_DEFER
case.

My question meant: what your proposal does improve over previous =
versions of
this patch. My first one was:

https://lkml.org/lkml/2020/2/17/220

which is very similar except not using an explicit temporary variable =
(which I
think is something every modern compiler will introduce). So the =
assembler
code is likely the same.

>=20
>> It needs an additional variable and makes the change more complex.
>=20
> That additional variable is already there...

Or a register assigned by the compiler.

>=20
>> The main suggestion by Chanwoo Choi was to move the check for =
EPROBE_DEFER
>> outside of the IS_ERR() because checking this first and then for =
EPROBE_DEFER
>> is not necessary.
>=20
> True, but there are two checks either way and this is slow path.

Well, it depends on likelihood of each code path... That is quite
difficult to assess.

>=20
>> If acceptable I'd prefer my last proposal. It just adds 2 LOC before
>> and without touching the existing if (IS_ERR(...)).
>=20
> I have no strong opinion. I was just waiting for project to compile
> so, consider my reply as product of boredom :)

Yes, compile times have increased significantly over the years :)

> (However, I do not like "let's touch only minimal number of lines"
> argument. End result should still matter more)

I would have been happy with my first proposal, but review suggested
to change it.

There is also some discussion for using IS_ERR() and PTR_ERR() =3D=3D =
-Esomething
first or second: https://lore.kernel.org/patchwork/patch/999602/

Well, about the end-result: this code path is run only once during
probe time. And that makes a difference in the sub-=C2=B5s range. So I =
don't
mind about the likelyhood. More concern is to have the code correct
and not introduce regressions.

And there the lines of code rule comes in: the less I change the less
I can break.

(Yes my compiler is also busy making me wait for result... so that
I can formulate such fundamental statements :).

>=20
>> If the compiler is clever it can cache palmas_usb->id_gpiod in a =
register
>> which serves the same purpose as the status variable.
>=20
> I'm not trying to outsmart compiler, but note status variable is =
needed
> three times.

BR and thanks,
Nikolaus

