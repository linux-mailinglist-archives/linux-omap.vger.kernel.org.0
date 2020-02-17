Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6DFA1611F0
	for <lists+linux-omap@lfdr.de>; Mon, 17 Feb 2020 13:21:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728430AbgBQMVl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Feb 2020 07:21:41 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:35689 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726932AbgBQMVl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 17 Feb 2020 07:21:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581942098;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=gwvD48n/zrKQkZA3LrOyQDl0wGdy39OY1AO4/Rvx8d8=;
        b=X5l8eV95gvqr/5zzpxllVlcTnZJlixLZP6Vf55wejxLne2+4u1z27WtJ6x6UZJReg/
        UbjAFDIEAL6jACSh1JF7Sjl1BH8dHgdqQVnU5+PwEZGzH+3DXk8MCjQTm7f2wQgGzGtx
        s5Dnd1EbA5NJ8yvkSdCN24o/QHgqM3z46pX6Q0+Gz9p7pmF7qNwmp4Hb0CkPzlQxMwk8
        4+2X/AJvHTT3HQ8fNfwppOyYmjSt6rK6Tdm+edUbWo3FlwemUvdUpPLtaZfL0qd7CYu+
        Csuo/x4Ub/2TcqLh/bHbyqATUt/LZakjW/I7VV0lZTHUhfCe+7gOeJpbts2HicGVp6jw
        rGKw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDVCaXA0OXQ=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id U06217w1HCLVMmu
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Mon, 17 Feb 2020 13:21:31 +0100 (CET)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH] extcon: palmas: hide error messages if gpio returns -EPROBE_DEFER
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <36bac0ac-f772-9f04-fb64-1c11e9d86fa5@samsung.com>
Date:   Mon, 17 Feb 2020 13:21:30 +0100
Cc:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-omap@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <673AFAA2-DF93-4FD7-BBCD-8F7FC58FFCEC@goldelico.com>
References: <CGME20200217085551epcas1p49113220d034155f8a78dc5e0767637a5@epcas1p4.samsung.com> <f65ad0ef2866e7d5b6743e13579c1efe8c572b4f.1581929741.git.hns@goldelico.com> <b9fe52e9-0340-4204-ee85-44b6c1ea7f3b@samsung.com> <2DF972B9-EECF-44E9-93FC-74B6C3B6FFC2@goldelico.com> <36bac0ac-f772-9f04-fb64-1c11e9d86fa5@samsung.com>
To:     Chanwoo Choi <cw00.choi@samsung.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

> Am 17.02.2020 um 12:24 schrieb Chanwoo Choi <cw00.choi@samsung.com>:
>=20
> Hi,
>=20
> On 2/17/20 8:07 PM, H. Nikolaus Schaller wrote:
>> Hi Chanwoo Choi,
>>=20
>>> Am 17.02.2020 um 11:15 schrieb Chanwoo Choi <cw00.choi@samsung.com>:
>>>=20
>>> Hi,
>>>=20
>>> On 2/17/20 5:55 PM, H. Nikolaus Schaller wrote:
>>>> If the gpios are probed after this driver (e.g. if they
>>>> come from an i2c expander) there is no need to print an
>>>> error message.
>>>>=20
>>>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>>>> ---
>>>> drivers/extcon/extcon-palmas.c | 6 ++++--
>>>> 1 file changed, 4 insertions(+), 2 deletions(-)
>>>>=20
>>>> diff --git a/drivers/extcon/extcon-palmas.c =
b/drivers/extcon/extcon-palmas.c
>>>> index edc5016f46f1..9c6254c0531c 100644
>>>> --- a/drivers/extcon/extcon-palmas.c
>>>> +++ b/drivers/extcon/extcon-palmas.c
>>>> @@ -206,14 +206,16 @@ static int palmas_usb_probe(struct =
platform_device *pdev)
>>>> 	palmas_usb->id_gpiod =3D devm_gpiod_get_optional(&pdev->dev, =
"id",
>>>> 							GPIOD_IN);
>>>> 	if (IS_ERR(palmas_usb->id_gpiod)) {
>>>> -		dev_err(&pdev->dev, "failed to get id gpio\n");
>>>> +		if (PTR_ERR(palmas_usb->id_gpiod) !=3D -EPROBE_DEFER)
>>>> +			dev_err(&pdev->dev, "failed to get id gpio\n");
>>>> 		return PTR_ERR(palmas_usb->id_gpiod);
>>>> 	}
>=20
>=20
> How about editing it ? as following:
> because following suggestion reduces the one checking behavior
> when return value is -EPROBE_DEFER.
>=20
> 	if (PTR_ERR(palmas_usb->id_gpiod) =3D=3D -EPROBE_DEFER) {
> 		return -EPROBE_DEFER;
> 	} else if (IS_ERR(palmas_usb->id_gpiod)) {
> 		dev_err(&pdev->dev, "failed to get id gpio\n");
> 		return PTR_ERR(palmas_usb->id_gpiod);
> 	}

Yes, looks indeed to be valid (some discussion around
is here: https://lore.kernel.org/patchwork/patch/999602/ ).

So I'll send an update asap.

>=20
>>>>=20
>>>> 	palmas_usb->vbus_gpiod =3D devm_gpiod_get_optional(&pdev->dev, =
"vbus",
>>>> 							GPIOD_IN);
>>>> 	if (IS_ERR(palmas_usb->vbus_gpiod)) {
>>>> -		dev_err(&pdev->dev, "failed to get vbus gpio\n");
>>>> +		if (PTR_ERR(palmas_usb->vbus_gpiod) !=3D -EPROBE_DEFER)
>>>> +			dev_err(&pdev->dev, "failed to get vbus =
gpio\n");
>=20
> ditto.
>=20
>>>> 		return PTR_ERR(palmas_usb->vbus_gpiod);
>>>> 	}
>>>>=20
>>>>=20
>>>=20
>>> Usually, gpio driver like pinctrl is very early probed
>>> because almost device drivers should use gpio.
>>> So, I have not any experience about this situation.
>>> Do you meet this situation on any h/w board?
>>=20
>> Yes, I have experienced that sometimes on omap5+palmas based boards.
>>=20
>> It seems to be this:
>>=20
>> =
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/ar=
ch/arm/boot/dts/omap5-board-common.dtsi?h=3Dv5.6-rc2#n384
>>=20
>> The extcon_usb3 can potentially match this extcon-palmas driver at
>> a moment where the palmas_gpio it is referring to has not yet been
>> successfully probed. Then the palmas_gpio would return -EPROBE_DEFER.
>>=20
>> AFAIK there is no guarantee for a specific sequence of drivers
>> being probed and it is pure luck that in most cases the gpios
>> are already probed.
>=20
> Thanks for explaining the example.

BR and thanks,
Nikolaus Schaller

