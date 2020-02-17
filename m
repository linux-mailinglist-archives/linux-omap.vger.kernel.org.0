Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FDB71619CC
	for <lists+linux-omap@lfdr.de>; Mon, 17 Feb 2020 19:38:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729455AbgBQSia (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Feb 2020 13:38:30 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.23]:32424 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727601AbgBQSia (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 17 Feb 2020 13:38:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581964705;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=FrQjJ8ihAd6vGkITrjAOakArT8nZi8aEb7RBIaL49hI=;
        b=C/RUgW+liIXAfAfCIm529v+jKked3nuE7PD3NF9M3TwOog2K4kdi5L7lty+eBiXoTJ
        LAM9zW31gWz6eQzZigYDA+z6P63yjLqBy12HuujvSC1qogMWy9zmRT/VW66eeGJlEMYW
        siR+NN108eqDrdHBLkWozSRDt4Bzjibgyw0SEgB1EYKufU0Re/vQDDtKB4yUbODSCPc5
        XIRDK7jpxIs6Gn64BosL5lWMMvz9GLR0XqZnXXb9tBi3JH8qYJOuqJvewYdTr6osVRjP
        bRSgyUj5qL7vmhFCE7SK+T/TLLjLsePc2LacG55X4Mhmjw1FtfCre84S9NxmMLIU5fHp
        Id3Q==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDVCaXA0OXQ=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id U06217w1HIcGPAL
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Mon, 17 Feb 2020 19:38:16 +0100 (CET)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH v3] extcon: palmas: hide error messages if gpio returns -EPROBE_DEFER
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200217182906.GA140676@lenoch>
Date:   Mon, 17 Feb 2020 19:38:16 +0100
Cc:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-omap@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <012228CC-2B49-4AAE-B574-92E44621F0D6@goldelico.com>
References: <d5c2826a5f00fcaee62f00662ae2a44dc4a5395d.1581946695.git.hns@goldelico.com> <C3D9F783-EE45-4681-93D9-C1407284CB59@goldelico.com> <20200217182906.GA140676@lenoch>
To:     Ladislav Michl <ladis@linux-mips.org>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

> Am 17.02.2020 um 19:29 schrieb Ladislav Michl <ladis@linux-mips.org>:
>=20
> On Mon, Feb 17, 2020 at 02:58:14PM +0100, H. Nikolaus Schaller wrote:
>>=20
>>> Am 17.02.2020 um 14:38 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>>>=20
>>> If the gpios are probed after this driver (e.g. if they
>>> come from an i2c expander) there is no need to print an
>>> error message.
>>>=20
>>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>>> ---
>>> drivers/extcon/extcon-palmas.c | 8 ++++++--
>>> 1 file changed, 6 insertions(+), 2 deletions(-)
>>>=20
>>> diff --git a/drivers/extcon/extcon-palmas.c =
b/drivers/extcon/extcon-palmas.c
>>> index edc5016f46f1..cea58d0cb457 100644
>>> --- a/drivers/extcon/extcon-palmas.c
>>> +++ b/drivers/extcon/extcon-palmas.c
>>> @@ -205,14 +205,18 @@ static int palmas_usb_probe(struct =
platform_device *pdev)
>>>=20
>>> 	palmas_usb->id_gpiod =3D devm_gpiod_get_optional(&pdev->dev, =
"id",
>>> 							GPIOD_IN);
>>> -	if (IS_ERR(palmas_usb->id_gpiod)) {
>>> +	if (PTR_ERR(palmas_usb->id_gpiod) =3D=3D -EPROBE_DEFER) {
>>> +		return -EPROBE_DEFER;
>>> +	} else if (IS_ERR(palmas_usb->id_gpiod)) {
>>=20
>> Hm.
>>=20
>> While looking again at that: why do we need the "{" and "} else "?
>>=20
>> It should be sufficient to have
>>=20
>>> 	palmas_usb->id_gpiod =3D devm_gpiod_get_optional(&pdev->dev, =
"id",
>>> 							GPIOD_IN);
>>> +	if (PTR_ERR(palmas_usb->id_gpiod) =3D=3D -EPROBE_DEFER)
>>> +		return -EPROBE_DEFER;
>>> 	if (IS_ERR(palmas_usb->id_gpiod)) {
>>=20
>> What do you think is better coding style here?
>=20
> How about something like this? (just an idea with some work left for =
you ;-))
>=20
> --- a/drivers/extcon/extcon-palmas.c
> +++ b/drivers/extcon/extcon-palmas.c
> @@ -206,8 +206,10 @@ static int palmas_usb_probe(struct =
platform_device *pdev)
> 	palmas_usb->id_gpiod =3D devm_gpiod_get_optional(&pdev->dev, =
"id",
> 							GPIOD_IN);
> 	if (IS_ERR(palmas_usb->id_gpiod)) {
> -		dev_err(&pdev->dev, "failed to get id gpio\n");
> -		return PTR_ERR(palmas_usb->id_gpiod);
> +		status =3D PTR_ERR(palmas_usb->id_gpiod);
> +		if (status !=3D -EPROBE_DEFER)
> +			dev_err(&pdev->dev, "failed to get id gpio: =
%d\n", status);
> +		return status;
> 	}

Well, what would be the improvement?
It needs an additional variable and makes the change more complex.

The main suggestion by Chanwoo Choi was to move the check for =
EPROBE_DEFER
outside of the IS_ERR() because checking this first and then for =
EPROBE_DEFER
is not necessary.

If acceptable I'd prefer my last proposal. It just adds 2 LOC before
and without touching the existing if (IS_ERR(...)).

If the compiler is clever it can cache palmas_usb->id_gpiod in a =
register
which serves the same purpose as the status variable.

>=20
> 	palmas_usb->vbus_gpiod =3D devm_gpiod_get_optional(&pdev->dev, =
"vbus",

BR and thanks,
Nikolaus=
