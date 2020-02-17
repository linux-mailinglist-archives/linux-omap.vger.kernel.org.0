Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63D1616125C
	for <lists+linux-omap@lfdr.de>; Mon, 17 Feb 2020 13:52:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727006AbgBQMwH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Feb 2020 07:52:07 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.168]:16702 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726963AbgBQMwH (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 17 Feb 2020 07:52:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581943925;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=u71Pc6KAIo1SNLKuB56gx3LtEud7uCwwBJw8/xtQmEU=;
        b=QXjOmUMjjWI8ke4gN+RqEXRM7VroXh0o7DFspAwi9e3MJOLAMkRaxFFDEmrJpWa7+u
        Gbue9xQEeI6zcMG/OqMrTJdbEUe2UlxFZ+UhIUIikDWj5yeUZZT6pVWC/UJx+LzTymR4
        m06s5cKFK8QgPtgbYNWd0zkJxzWEvYM6qaZqmhPTEwQjYRvxe/YuZPJm+zNtHX3GDqWZ
        pahXiyaeiEs7MBbJUZl0FY+BWsH+s2qMJ2VdI5TQ6Ksq1c9nk2341fdtrSTI+jK6FaTM
        NjSy9Gi63SS+8haBaCmDlfStFQxxf9cKsBbdZPukLwupadvuGy8cQwPfzVKKpVJCkfra
        UbRA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDVCaXA0OXQ=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id U06217w1HCq2NEF
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Mon, 17 Feb 2020 13:52:02 +0100 (CET)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH v2] extcon: palmas: hide error messages if gpio returns -EPROBE_DEFER
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <cf2554c724a8ddc5a3e3485228f3ab750980d4b4.1581941945.git.hns@goldelico.com>
Date:   Mon, 17 Feb 2020 13:52:01 +0100
Cc:     linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-omap@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <F87F334B-AFCD-44D4-A10A-F62A3B3003E0@goldelico.com>
References: <cf2554c724a8ddc5a3e3485228f3ab750980d4b4.1581941945.git.hns@goldelico.com>
To:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Am 17.02.2020 um 13:19 schrieb H. Nikolaus Schaller =
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
> index edc5016f46f1..701d7c9584fa 100644
> --- a/drivers/extcon/extcon-palmas.c
> +++ b/drivers/extcon/extcon-palmas.c
> @@ -205,14 +205,18 @@ static int palmas_usb_probe(struct =
platform_device *pdev)
>=20
> 	palmas_usb->id_gpiod =3D devm_gpiod_get_optional(&pdev->dev, =
"id",
> 							GPIOD_IN);
> -	if (IS_ERR(palmas_usb->id_gpiod)) {
> +	if (PTR_ERR(palmas_usb->id_gpiod) !=3D -EPROBE_DEFER) {

oops. Polarity went wrong. Will send a v3 asap.

> +		return -EPROBE_DEFER;
> +	} else if (IS_ERR(palmas_usb->id_gpiod)) {
> 		dev_err(&pdev->dev, "failed to get id gpio\n");
> 		return PTR_ERR(palmas_usb->id_gpiod);
> 	}
>=20
> 	palmas_usb->vbus_gpiod =3D devm_gpiod_get_optional(&pdev->dev, =
"vbus",
> 							GPIOD_IN);
> -	if (IS_ERR(palmas_usb->vbus_gpiod)) {
> +	if (PTR_ERR(palmas_usb->vbus_gpiod) !=3D -EPROBE_DEFER) {
> +		return -EPROBE_DEFER;
> +	} else if (IS_ERR(palmas_usb->vbus_gpiod)) {
> 		dev_err(&pdev->dev, "failed to get vbus gpio\n");
> 		return PTR_ERR(palmas_usb->vbus_gpiod);
> 	}
> --=20
> 2.23.0
>=20

