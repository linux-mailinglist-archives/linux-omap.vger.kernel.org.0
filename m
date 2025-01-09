Return-Path: <linux-omap+bounces-3061-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7E5A07DEF
	for <lists+linux-omap@lfdr.de>; Thu,  9 Jan 2025 17:45:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C0431883F8B
	for <lists+linux-omap@lfdr.de>; Thu,  9 Jan 2025 16:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6879D13D24D;
	Thu,  9 Jan 2025 16:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aFmsFSDB"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C714A2D;
	Thu,  9 Jan 2025 16:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736441115; cv=none; b=PppanYKs1NvaWneLSCuKbOOs06Zgr80I2pRdD7NS6ioR2NoXxgdYchMz/8C2UebiKkIw8WcEOkL2lh7K7pF8uFCFGqGlNYia0Uz+sGlvQMDS3jV/Yr9oGuxN3VF7muIYA3LxHjaFFOmOEL/9jk53y1loJdORID3BNgHi+qsJsVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736441115; c=relaxed/simple;
	bh=siYNbh3R41Aj3NLh15bp9tVkj973fVMnpC9J0cj2lMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AIdycCUEzE9/fvK9DhvZcP7MUieWrlEfMCK9iFjEC4uCV4maM9BoaZfnKnWTFFnv9DhfAiUS6NvHO/Huzw3lntiQeOhi70MtzzyzdLDsfERVBNlCPc1OoAWS1KVO5hXCpKwyeeVU012ssgUf23zhkZ6Z8Zi1LIvYzgCG1/emz+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aFmsFSDB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72ED0C4CED2;
	Thu,  9 Jan 2025 16:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736441115;
	bh=siYNbh3R41Aj3NLh15bp9tVkj973fVMnpC9J0cj2lMw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aFmsFSDBOIacLxJiXmc0AvJl+wNsvaequYO/nUg9qBzKwz1RnYCIQ3NTV6J1Prdae
	 5prao8QEAJUpxCrI1ukj8uQut/mLaVM/JQwwOSr6G12/HnIW8SyCeYHhZIZ7UDvCFw
	 qcRQ0TRyQhDJWD7cwIDVF/kkRw2N/rFrzKs0jVhAPIj1FfnbkrsOB0RFz5palqe8zW
	 Lrf7fGDBx7Ypl4MewHn8vdeEbtdlwmGCLMsrJAw/7jp1t6EigymZKMzY3EqnDklYuK
	 bGhx7SR3oCYHcDdUUF5l8LwrSkX4j4RBTKzyjvd0WWImAbY5gZhx9yTBY3wDjA1+eh
	 yHdVjg99icb8w==
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e54bd61e793so1829836276.2;
        Thu, 09 Jan 2025 08:45:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUbAQVK8wiDc639fuBybM5mq/V/xemc/enyRBRozdqAXXJ6MUlM/tk94qRuQRfmpT+/oT+Ki2bkShosMQ==@vger.kernel.org, AJvYcCVzjUo8ijUgl3X+YkdlCmXFDxYE1JLsfptCIz+hhGHbqxIt/26pD8qoZ5nYMNjVHKmjdTFTG6G1Lh9TRho=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHfj0YSlwp3CxVe6WhhctknNt4C7xKCVnYQ5AZGYcaQjdeDFpA
	hBkbDlKiJt5bOrvfJs8UsE2k0bxgn3WBCsPYuiYVYQ98fUhSF17RQQ73wNTh0Aeqx07p11Uvo3z
	xHsd01INV4U2uEnBI60qLpPXrmw==
X-Google-Smtp-Source: AGHT+IHuSx9VbaKgN88/WlrGSFOeqa3n33tsaEDavhvS2xcLD9ig9TJ19azNWzEvH6mwi4KBVEhHgGHzg1ILsR8qILs=
X-Received: by 2002:a05:6902:220a:b0:e47:f4e3:87f4 with SMTP id
 3f1490d57ef6-e54ee15ed4dmr7230853276.12.1736441114722; Thu, 09 Jan 2025
 08:45:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241231164456.262581-1-robh@kernel.org>
In-Reply-To: <20241231164456.262581-1-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Thu, 9 Jan 2025 10:45:03 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKHzPfrn4A_21qxqyJdGq5U55htiEwyp1zfa5yCAZhUEQ@mail.gmail.com>
X-Gm-Features: AbW1kvZ-caMZ74AUaqZ-1Wz2XxGGZ5QIFf-fdzb2X5XpvMuCLCXW0SJz251FYZY
Message-ID: <CAL_JsqKHzPfrn4A_21qxqyJdGq5U55htiEwyp1zfa5yCAZhUEQ@mail.gmail.com>
Subject: Re: [PATCH] usb: dwc3: omap: Use devm_regulator_get_optional()
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 31, 2024 at 10:45=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org=
> wrote:
>
> The 'vbus-supply' regulator is optional, so use
> devm_regulator_get_optional() instead of checking for property presence
> first.
>
> While here, rework the error handling to use dev_err_probe() which
> handles deferred probe correctly without an error message.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  drivers/usb/dwc3/dwc3-omap.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/usb/dwc3/dwc3-omap.c b/drivers/usb/dwc3/dwc3-omap.c
> index b261c46124c6..9b1d10ac33c1 100644
> --- a/drivers/usb/dwc3/dwc3-omap.c
> +++ b/drivers/usb/dwc3/dwc3-omap.c
> @@ -457,7 +457,7 @@ static int dwc3_omap_probe(struct platform_device *pd=
ev)
>
>         struct dwc3_omap        *omap;
>         struct device           *dev =3D &pdev->dev;
> -       struct regulator        *vbus_reg =3D NULL;
> +       struct regulator        *vbus_reg;
>
>         int                     ret;
>         int                     irq;
> @@ -483,13 +483,9 @@ static int dwc3_omap_probe(struct platform_device *p=
dev)
>         if (IS_ERR(base))
>                 return PTR_ERR(base);
>
> -       if (of_property_read_bool(node, "vbus-supply")) {
> -               vbus_reg =3D devm_regulator_get(dev, "vbus");
> -               if (IS_ERR(vbus_reg)) {
> -                       dev_err(dev, "vbus init failed\n");
> -                       return PTR_ERR(vbus_reg);
> -               }
> -       }
> +       vbus_reg =3D devm_regulator_get_optional(dev, "vbus");
> +       if (IS_ERR(vbus_reg))
> +               return dev_err_probe(dev, PTR_ERR(vbus_reg), "vbus init f=
ailed\n");

This is wrong because devm_regulator_get_optional() returns -ENODEV
rather than NULL like all the other _get_optional() functions...

Rob

