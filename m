Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78360161410
	for <lists+linux-omap@lfdr.de>; Mon, 17 Feb 2020 14:58:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727448AbgBQN6U (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Feb 2020 08:58:20 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.53]:12455 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726528AbgBQN6U (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 17 Feb 2020 08:58:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581947898;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=gtMTPVIhIXUeH0xdkSwv3qku1/SwM+IetmGopOl+iV8=;
        b=l9FBQzosiiQ2IMm95p+UXyhqg17xAjy7up+qcJswNgEi/w4wH1/b20lBkq3beQPOnQ
        +aqnv8weFB2Q4DISUYCBehYkIhiqj0ZuyiDLsmDACcEZOedw+4BvabVFf2ObfVJPvkM1
        O8XEv1Xnc6PjlWrH3vMJztLzu2AuReydamCF5mXnQGjCSpIOXPnUsep4Gq/8XFcfN/ye
        uGqpYI1QQAP7L9oFd58KZTBME28KKi0pqqmQKDCs+huUMUqcFx4r+I2MKwhbHsv2z4ut
        4ayh2JnAorfSArO19nEXOkfKP5QG16ZY1meVwzmSz7j9E2WwyP+RXqbvgOD5Ze6Hrsfe
        x1xQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDVCaXA0OXQ=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id U06217w1HDwFNp5
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Mon, 17 Feb 2020 14:58:15 +0100 (CET)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH v3] extcon: palmas: hide error messages if gpio returns -EPROBE_DEFER
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <d5c2826a5f00fcaee62f00662ae2a44dc4a5395d.1581946695.git.hns@goldelico.com>
Date:   Mon, 17 Feb 2020 14:58:14 +0100
Cc:     linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-omap@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <C3D9F783-EE45-4681-93D9-C1407284CB59@goldelico.com>
References: <d5c2826a5f00fcaee62f00662ae2a44dc4a5395d.1581946695.git.hns@goldelico.com>
To:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Am 17.02.2020 um 14:38 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>=20
> If the gpios are probed after this driver (e.g. if they
> come from an i2c expander) there is no need to print an
> error message.
>=20
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
> drivers/extcon/extcon-palmas.c | 8 ++++++--
> 1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/extcon/extcon-palmas.c =
b/drivers/extcon/extcon-palmas.c
> index edc5016f46f1..cea58d0cb457 100644
> --- a/drivers/extcon/extcon-palmas.c
> +++ b/drivers/extcon/extcon-palmas.c
> @@ -205,14 +205,18 @@ static int palmas_usb_probe(struct =
platform_device *pdev)
>=20
> 	palmas_usb->id_gpiod =3D devm_gpiod_get_optional(&pdev->dev, =
"id",
> 							GPIOD_IN);
> -	if (IS_ERR(palmas_usb->id_gpiod)) {
> +	if (PTR_ERR(palmas_usb->id_gpiod) =3D=3D -EPROBE_DEFER) {
> +		return -EPROBE_DEFER;
> +	} else if (IS_ERR(palmas_usb->id_gpiod)) {

Hm.

While looking again at that: why do we need the "{" and "} else "?

It should be sufficient to have

> 	palmas_usb->id_gpiod =3D devm_gpiod_get_optional(&pdev->dev, =
"id",
> 							GPIOD_IN);
> +	if (PTR_ERR(palmas_usb->id_gpiod) =3D=3D -EPROBE_DEFER)
> +		return -EPROBE_DEFER;
> 	if (IS_ERR(palmas_usb->id_gpiod)) {

What do you think is better coding style here?

BR,
Nikolaus Schaller=
