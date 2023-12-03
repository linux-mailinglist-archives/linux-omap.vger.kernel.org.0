Return-Path: <linux-omap+bounces-101-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C712802881
	for <lists+linux-omap@lfdr.de>; Sun,  3 Dec 2023 23:46:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9263CB209CC
	for <lists+linux-omap@lfdr.de>; Sun,  3 Dec 2023 22:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A34E19448;
	Sun,  3 Dec 2023 22:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gspeQB1A"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31950D7;
	Sun,  3 Dec 2023 14:46:32 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1d053c45897so22335125ad.2;
        Sun, 03 Dec 2023 14:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701643591; x=1702248391; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9yYONdg2NO4nh9SwUqz66EGVIpRiF7l/11wqLgxgto=;
        b=gspeQB1AC+E5jB06IJYpN81wo4NleeGNGWkMCS8by5aoyx9y9FP2TYHvI/R2ICS/oY
         HTEE2d6+CtKj2da5k35a1KUmsTL/ljsdn9wmMavyrURAN/zswV+dNQh7JAA6+Atgj+wa
         wfdGDVwgH20+6c5adcG83KdbqyBvOnwMJrhcSDBbxj5Bhi352eOj62Fxi6+8oHc3Y3l9
         n9l/vxIXtHKjW4WNM2SIJrj//px+uIwMCxK3GWs6/McC+DRWQraqGgjqtd21HdvdsXfJ
         a6sZ+/RuZTMpI4UWDNZ2xtBGEWScxADuM6HU2wtk6MyVYNyM9pNxjHjG0F5siUXrQyuV
         QZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701643591; x=1702248391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a9yYONdg2NO4nh9SwUqz66EGVIpRiF7l/11wqLgxgto=;
        b=OPY6zQn7cS8YkXOy0BaaG5RsPwkgxVRAI2Yp3lz3ht4imLeYw3g8y9e6xHGFwDqO7H
         6HWHZWRxiyOqGEDbZtUOYLWzPyJZrtQFOCJGbny9/W38t/MYiFUkRsgwUlKfghWRFmXl
         9AmIwp0oFFPjsHgZPg14lf0oOELHzcCg1SmeDasicqYdXTm0zs+CvQt4/n//UmxGcvH+
         fW9uIjF/kxLvWBL5Rp/Fl4NZ5VnkmusyQIjrC9C+6clo3pfRIDxInfD9jdOfvhc8YQiY
         QijnureN9jlwWF8RaOEXad9SZGVB7xDkN7iDaHw3THWoYnVORyiLeDQBfptyoJsEPtmx
         YjSQ==
X-Gm-Message-State: AOJu0Yz5kczmOGDvsJ5eL1WLn+q5ABUzv0b1Qd4XDmdltvYcHL7aTddv
	4er42WLhQrdAP+RnWd1rOIM1/uJqQxfq8gmp4cw=
X-Google-Smtp-Source: AGHT+IGIYGYNaILDYg6nfCqYpRevWDCbo4e4c39ggc8YqYCNFvBaEcEMjzwrFwffKQKCyB+h1sGb+qWLnYYHmSM2kH8=
X-Received: by 2002:a17:902:f545:b0:1d0:9a64:e511 with SMTP id
 h5-20020a170902f54500b001d09a64e511mr1106028plf.73.1701643591576; Sun, 03 Dec
 2023 14:46:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231203222903.343711-1-andreas@kemnade.info> <20231203222903.343711-7-andreas@kemnade.info>
In-Reply-To: <20231203222903.343711-7-andreas@kemnade.info>
From: Adam Ford <aford173@gmail.com>
Date: Sun, 3 Dec 2023 16:46:20 -0600
Message-ID: <CAHCN7xKG6-vgnJ+mA8xt0aFK-jCBWOX-GkVmJGNERH43N0ikaw@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] ARM: dts: omap: gta04: standardize system-power-controller
To: Andreas Kemnade <andreas@kemnade.info>
Cc: lee@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, bcousson@baylibre.com, tony@atomide.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 3, 2023 at 4:29=E2=80=AFPM Andreas Kemnade <andreas@kemnade.inf=
o> wrote:
>
> Replace TI-specific property by generic one.
>
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
> cannot be applied independently of the other ones, so maybe simply delay
> it.
>
>  arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi b/arch/arm/boot/d=
ts/ti/omap/omap3-gta04.dtsi
> index 3661340009e7a..5001c4ea35658 100644
> --- a/arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/omap3-gta04.dtsi
> @@ -476,6 +476,7 @@ twl: twl@48 {
>                 reg =3D <0x48>;
>                 interrupts =3D <7>; /* SYS_NIRQ cascaded to intc */
>                 interrupt-parent =3D <&intc>;
> +               system-power-controller;

Could this go into the twl4030.dtsi file so we don't have every omap3
board with this part duplicating this line?

adam
>
>                 clocks =3D <&hfclk_26m>;
>                 clock-names =3D "fck";
> @@ -490,7 +491,6 @@ codec {
>
>                 twl_power: power {
>                         compatible =3D "ti,twl4030-power-idle";
> -                       ti,system-power-controller;
>                 };
>         };
>  };
> --
> 2.39.2
>
>

