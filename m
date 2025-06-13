Return-Path: <linux-omap+bounces-3879-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFD7AD9677
	for <lists+linux-omap@lfdr.de>; Fri, 13 Jun 2025 22:36:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 956143BEA6B
	for <lists+linux-omap@lfdr.de>; Fri, 13 Jun 2025 20:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 848C2255E23;
	Fri, 13 Jun 2025 20:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lzbgB4Mx"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6CA1EEA47;
	Fri, 13 Jun 2025 20:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749846844; cv=none; b=U8Z4J6znRndRqPYDik7aheWfu7qojD8p2yaeBvGLWfblOYAHvCTTIKj6OyTQtWF+P7suNa2+4PSazWfJpVczx8/WiuENeZw+17umfz2U1MpU3ttJx6kfjNXkWuEZHKMb8HLqDVX3+1u4/kJMMoFmTFtOOCB1QGjl26vEI7JcEbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749846844; c=relaxed/simple;
	bh=GjmeWGozjU5PBF3nnlHdsu1xTqGagkXhadEOEtnYZcQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kG7wskdVBK/f+/0JWegN8LJeA7/FZOgnyuB5w5gqPUQV23mxdt7Pfy1GiGeLwfbF3koTgU0JfnpMN5M8ok+BMdgs0R5Md5YDS78OPJB1tTD/ZgvXAC0qvDn5APxLbjgJDYO3bVuTfpStLzfcKjKn9P61dorXInuzONYGpIYN2Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lzbgB4Mx; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2e95f0b6cb7so657958fac.3;
        Fri, 13 Jun 2025 13:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749846841; x=1750451641; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lopa9dsU00PWCWa6IyKFnmzc4njXABC4sgMfKLOvRko=;
        b=lzbgB4MxAWSA0JA1qHN/tr4s0BAGqr4AC+/mZnqNanVHv8EoR4IN/Pid2nYMUw+rQ3
         8SvWO0aru0W+ucwrOCNnvgsWZLBmTtFsIC+8apoeXxotA+JYNzu5Ge/hRTDKHHJD/j9s
         9hMQKZrMdiTdF90OzmMSn7hphBa2laCOs5m/5DZ3HOogW6TWhWzpo8u3toz9gnZvNXpt
         xGoRCvgdmgi9a71eHEE4gslZ/9ZEh3gRB0Tb+XyRdyu12/g2NmqLBY8TMBMJqI8rmRMj
         +Jf83EAgavdpX20q4FvIEuKdv/vJn3mp8ACFeTsENzR9GJKP7h2gRtSh7u+Ah0WwhXWp
         iJnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749846841; x=1750451641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lopa9dsU00PWCWa6IyKFnmzc4njXABC4sgMfKLOvRko=;
        b=pbK54U4fUfDFxc7aTVk+y41lnUPd/MJvaVwbwdX0UtNL+QmBw3J5pwktoFkXB+XhUp
         pTR1tCh2B+3m+VTEr70QISUWMfLXQvPYoT2OYXn8Nd+oqbCveSo5CtwmraYECo67R7P4
         wNbMZAJIxWC/VOuiA4IC6/mwkKr4ibFJXav+aja277fvXUCelhjN1ul2/hksrgUxEf0k
         TpLrJJb63bYFbo0MXvQiCR0k7v+N8JlrDuQBUOSlgLdHuuxwDkefl7HzZmixeHRVxvMU
         SwbJXzQHywuO/9vCG3PFzMqyJag5TcEIZHQTBJdTCdsI0U/EbsvhFvOFAclR+5jr2kag
         xRFg==
X-Forwarded-Encrypted: i=1; AJvYcCVQHo1u/JBs8anMEwwMJRFcqFFfJAf3BU34AcWoHgk5EtVnba8VVT8lvhSOGNk1TbMO6eHEKOLAOXidTA==@vger.kernel.org, AJvYcCW2zjAKHKzZJYWL4rbw/eQQhIouOKrj2rAGtfLG+zmuDaGn0dfS6cfAnIJ8V1xSfBktmOevo3pa22AR8vmO@vger.kernel.org, AJvYcCWaRFY3P90g0bDimV/vA+rE8x2NIJz8bBZhvoNuvjTGX2sPnXh0pt4GkzyZDFeZUEs4iIrxZibKsCL7@vger.kernel.org
X-Gm-Message-State: AOJu0YxHbCR6CtxcuPs2TCNFtNtYjA0rVnRDethqbOi1k1nEnXplpYuD
	k0oumfGUVmVrWkp6ys96o/gdQ4LjsYXTH5XN/VWwrExbdhl+PxAwz/tn5c8UPM/RRE33rk9SkCp
	sz3gDroVqoY6vkM8wov2MArRETDk/OTIgCZ2hvRE=
X-Gm-Gg: ASbGncvGcY7stFt+r5dTilw1afBGeY8vho2nLaaZDwXDRrj/geHVQYeVWdBFxUp2sK6
	/L+DwSyjqZe05OJ6X1mMmucCHq0v4CPS5Rg9NWW78O+rJRELaQdXB6f3/O3jmNB8fvqOZzG/+4J
	jwtyNiGJSty7bQsfS+kmGG4Rlpl7ABHMPFMaww1T707XyEqv0KmE86XBND+NiW4s60DANd2PGDP
	sLe
X-Google-Smtp-Source: AGHT+IHzsOYqNWBAmSJpeza6535H9+LjTdLCISm3FP5IepVgKDbx1c4zlFhkhrUOQVgDuoMTlLRtGOvFXzQwa+xbuIg=
X-Received: by 2002:a05:6870:ed8e:b0:2d5:a360:7df9 with SMTP id
 586e51a60fabf-2eaf0836064mr754389fac.5.1749846841154; Fri, 13 Jun 2025
 13:34:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613-bbg-v3-0-514cdc768448@bootlin.com> <20250613-bbg-v3-2-514cdc768448@bootlin.com>
In-Reply-To: <20250613-bbg-v3-2-514cdc768448@bootlin.com>
From: Jason Kridner <jkridner@gmail.com>
Date: Fri, 13 Jun 2025 15:33:50 -0500
X-Gm-Features: AX0GCFth-gZNYPrnl9VNVFIFYlCNPCH1OPJqknA_Pge_SpOnzoBQeeMxwvLcRMQ
Message-ID: <CA+T6QP=yHO-FoGkVxZJzT8OyO7i8K5G5uazqk6qHQ5QzWSicGA@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] ARM: dts: omap: Remove incorrect compatible
 strings from device trees
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Paul Barker <paul.barker@sancloud.com>, 
	Marc Murphy <marc.murphy@sancloud.com>, Andrew Davis <afd@ti.com>, 
	Bajjuri Praneeth <praneeth@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 10:49=E2=80=AFAM Kory Maincent
<kory.maincent@bootlin.com> wrote:
>
> Several device trees incorrectly included extraneous compatible strings
> in their compatible property lists. The policy is to only describe the
> specific board name and SoC name to avoid confusion.
>
> Remove these incorrect compatible strings to fix the inconsistency.
>
> Also fix board vendor prefixes for BeagleBoard variants that were
> incorrectly using "ti" instead of "beagle" or "seeed".
>
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>
> Changes in v3:
> - Remove extraneous compatible strings.
> - Replace BeagleBone board name vendor.
>
> Changes in v2:
> - New patch
> ---
>  arch/arm/boot/dts/ti/omap/am335x-base0033.dts                   | 2 +-
>  arch/arm/boot/dts/ti/omap/am335x-bone.dts                       | 4 ++--
>  arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dts         | 4 ++--
>  arch/arm/boot/dts/ti/omap/am335x-boneblack.dts                  | 4 ++--
>  arch/arm/boot/dts/ti/omap/am335x-boneblue.dts                   | 4 ++--
>  arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts         | 4 ++--
>  arch/arm/boot/dts/ti/omap/am335x-bonegreen.dts                  | 4 ++--
>  arch/arm/boot/dts/ti/omap/am335x-chiliboard.dts                 | 3 +--
>  arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts               | 2 +-
>  arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts             | 2 +-
>  arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts               | 4 ++--
>  arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dts | 5 +---=
-
>  arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dts          | 5 +---=
-
>  arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dts               | 2 +-
>  arch/arm/boot/dts/ti/omap/am335x-shc.dts                        | 2 +-
>  15 files changed, 22 insertions(+), 29 deletions(-)
>
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-base0033.dts b/arch/arm/boo=
t/dts/ti/omap/am335x-base0033.dts
> index 46078af4b7a3..176de29de2a6 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-base0033.dts
> +++ b/arch/arm/boot/dts/ti/omap/am335x-base0033.dts
> @@ -9,7 +9,7 @@
>
>  / {
>         model =3D "IGEP COM AM335x on AQUILA Expansion";
> -       compatible =3D "isee,am335x-base0033", "isee,am335x-igep0033", "t=
i,am33xx";
> +       compatible =3D "isee,am335x-base0033", "ti,am33xx";
>
>         hdmi {
>                 compatible =3D "ti,tilcdc,slave";
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-bone.dts b/arch/arm/boot/dt=
s/ti/omap/am335x-bone.dts
> index b5d85ef51a02..2790c0c5a473 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-bone.dts
> +++ b/arch/arm/boot/dts/ti/omap/am335x-bone.dts
> @@ -8,8 +8,8 @@
>  #include "am335x-bone-common.dtsi"
>
>  / {
> -       model =3D "TI AM335x BeagleBone";
> -       compatible =3D "ti,am335x-bone", "ti,am33xx";
> +       model =3D "AM335x BeagleBone";

We have software that looks at these in running systems, so I=E2=80=99d be =
ok
not to change. If changing, why not =E2=80=9CBeagleBoard.org BeagleBone=E2=
=80=9D? Not
sure of the convention to mention the SoC, but AM335x is not part of
the product name.

> +       compatible =3D "beagle,am335x-bone", "ti,am33xx";
>  };
>
>  &ldo3_reg {
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dts b/ar=
ch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dts
> index b4b4b80df08c..d78b6427b8f2 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dts
> +++ b/arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dts
> @@ -11,8 +11,8 @@
>  #include <dt-bindings/interrupt-controller/irq.h>
>
>  / {
> -       model =3D "TI AM335x BeagleBone Black Wireless";
> -       compatible =3D "ti,am335x-bone-black-wireless", "ti,am335x-bone-b=
lack", "ti,am335x-bone", "ti,am33xx";
> +       model =3D "AM335x BeagleBone Black Wireless";
> +       compatible =3D "beagle,am335x-bone-black-wireless", "ti,am33xx";
>
>         wlan_en_reg: fixedregulator@2 {
>                 compatible =3D "regulator-fixed";
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-boneblack.dts b/arch/arm/bo=
ot/dts/ti/omap/am335x-boneblack.dts
> index 16b567e3cb47..70c26d090ecb 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-boneblack.dts
> +++ b/arch/arm/boot/dts/ti/omap/am335x-boneblack.dts
> @@ -10,8 +10,8 @@
>  #include "am335x-boneblack-hdmi.dtsi"
>
>  / {
> -       model =3D "TI AM335x BeagleBone Black";
> -       compatible =3D "ti,am335x-bone-black", "ti,am335x-bone", "ti,am33=
xx";
> +       model =3D "AM335x BeagleBone Black";
> +       compatible =3D "beagle,am335x-bone-black", "ti,am33xx";
>  };
>
>  &cpu0_opp_table {
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-boneblue.dts b/arch/arm/boo=
t/dts/ti/omap/am335x-boneblue.dts
> index f579df4c2c54..779e74218b57 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-boneblue.dts
> +++ b/arch/arm/boot/dts/ti/omap/am335x-boneblue.dts
> @@ -9,8 +9,8 @@
>  #include <dt-bindings/interrupt-controller/irq.h>
>
>  / {
> -       model =3D "TI AM335x BeagleBone Blue";
> -       compatible =3D "ti,am335x-bone-blue", "ti,am33xx";
> +       model =3D "AM335x BeagleBone Blue";
> +       compatible =3D "beagle,am335x-bone-blue", "ti,am33xx";
>
>         chosen {
>                 stdout-path =3D &uart0;
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts b/ar=
ch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts
> index a4f5b5262645..ee92abf43175 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts
> +++ b/arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dts
> @@ -10,8 +10,8 @@
>  #include <dt-bindings/interrupt-controller/irq.h>
>
>  / {
> -       model =3D "TI AM335x BeagleBone Green Wireless";
> -       compatible =3D "ti,am335x-bone-green-wireless", "ti,am335x-bone-g=
reen", "ti,am335x-bone-black", "ti,am335x-bone", "ti,am33xx";
> +       model =3D "Seeed AM335x BeagleBone Green Wireless";
> +       compatible =3D "seeed,am335x-bone-green-wireless", "ti,am33xx";
>
>         wlan_en_reg: fixedregulator@2 {
>                 compatible =3D "regulator-fixed";
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-bonegreen.dts b/arch/arm/bo=
ot/dts/ti/omap/am335x-bonegreen.dts
> index 18cc0f49e999..3d771721dcb8 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-bonegreen.dts
> +++ b/arch/arm/boot/dts/ti/omap/am335x-bonegreen.dts
> @@ -9,6 +9,6 @@
>  #include "am335x-bonegreen-common.dtsi"
>
>  / {
> -       model =3D "TI AM335x BeagleBone Green";
> -       compatible =3D "ti,am335x-bone-green", "ti,am335x-bone-black", "t=
i,am335x-bone", "ti,am33xx";
> +       model =3D "Seeed AM335x BeagleBone Green";
> +       compatible =3D "seeed,am335x-bone-green", "ti,am33xx";
>  };
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-chiliboard.dts b/arch/arm/b=
oot/dts/ti/omap/am335x-chiliboard.dts
> index 648e97fe1dfd..224095304ef3 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-chiliboard.dts
> +++ b/arch/arm/boot/dts/ti/omap/am335x-chiliboard.dts
> @@ -8,8 +8,7 @@
>
>  / {
>         model =3D "AM335x Chiliboard";
> -       compatible =3D "grinn,am335x-chiliboard", "grinn,am335x-chilisom"=
,
> -                    "ti,am33xx";
> +       compatible =3D "grinn,am335x-chiliboard", "ti,am33xx";
>
>         chosen {
>                 stdout-path =3D &uart0;
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts b/arch/arm=
/boot/dts/ti/omap/am335x-myirtech-myd.dts
> index fd91a3c01a63..55a454f51148 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts
> +++ b/arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts
> @@ -12,7 +12,7 @@
>
>  / {
>         model =3D "MYIR MYD-AM335X";
> -       compatible =3D "myir,myd-am335x", "myir,myc-am335x", "ti,am33xx";
> +       compatible =3D "myir,myd-am335x", "ti,am33xx";
>
>         chosen {
>                 stdout-path =3D &uart0;
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts b/arch/a=
rm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts
> index d28d39728847..d87ac31a16a9 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts
> +++ b/arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dts
> @@ -16,7 +16,7 @@
>
>  / {
>         model =3D "Octavo Systems OSD3358-SM-RED";
> -       compatible =3D "oct,osd3358-sm-refdesign", "ti,am335x-bone-black"=
, "ti,am335x-bone", "ti,am33xx";
> +       compatible =3D "oct,osd3358-sm-refdesign", "ti,am33xx";
>  };
>
>  &ldo3_reg {
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts b/arch/arm=
/boot/dts/ti/omap/am335x-pocketbeagle.dts
> index 78ce860e59b3..c2f26687790c 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts
> +++ b/arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dts
> @@ -11,8 +11,8 @@
>  #include <dt-bindings/leds/common.h>
>
>  / {
> -       model =3D "TI AM335x PocketBeagle";
> -       compatible =3D "ti,am335x-pocketbeagle", "ti,am335x-bone", "ti,am=
33xx";
> +       model =3D "AM335x PocketBeagle";
> +       compatible =3D "beagle,am335x-pocketbeagle", "ti,am33xx";
>
>         chosen {
>                 stdout-path =3D &uart0;
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.=
dts b/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dts
> index 7c9f65126c63..61210f975542 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dts
> +++ b/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dts
> @@ -13,10 +13,7 @@
>
>  / {
>         model =3D "SanCloud BeagleBone Enhanced Extended WiFi";
> -       compatible =3D "sancloud,am335x-boneenhanced",
> -                    "ti,am335x-bone-black",
> -                    "ti,am335x-bone",
> -                    "ti,am33xx";
> +       compatible =3D "sancloud,am335x-boneenhanced", "ti,am33xx";
>
>         wlan_en_reg: fixedregulator@2 {
>                 compatible =3D "regulator-fixed";
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dts b/arc=
h/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dts
> index c6c96f6182a8..10488b55689c 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dts
> +++ b/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dts
> @@ -12,10 +12,7 @@
>
>  / {
>         model =3D "SanCloud BeagleBone Enhanced Lite";
> -       compatible =3D "sancloud,am335x-boneenhanced",
> -                    "ti,am335x-bone-black",
> -                    "ti,am335x-bone",
> -                    "ti,am33xx";
> +       compatible =3D "sancloud,am335x-boneenhanced", "ti,am33xx";
>  };
>
>  &am33xx_pinmux {
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dts b/arch/arm=
/boot/dts/ti/omap/am335x-sancloud-bbe.dts
> index 32669346cefe..f1bdbf053fb2 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dts
> +++ b/arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dts
> @@ -13,7 +13,7 @@
>
>  / {
>         model =3D "SanCloud BeagleBone Enhanced";
> -       compatible =3D "sancloud,am335x-boneenhanced", "ti,am335x-bone-bl=
ack", "ti,am335x-bone", "ti,am33xx";
> +       compatible =3D "sancloud,am335x-boneenhanced", "ti,am33xx";
>  };
>
>  &am33xx_pinmux {
> diff --git a/arch/arm/boot/dts/ti/omap/am335x-shc.dts b/arch/arm/boot/dts=
/ti/omap/am335x-shc.dts
> index 597482822608..f2393ff3f4d7 100644
> --- a/arch/arm/boot/dts/ti/omap/am335x-shc.dts
> +++ b/arch/arm/boot/dts/ti/omap/am335x-shc.dts
> @@ -12,7 +12,7 @@
>
>  / {
>         model =3D "Bosch SHC";
> -       compatible =3D "ti,am335x-shc", "ti,am335x-bone", "ti,am33xx";
> +       compatible =3D "ti,am335x-shc", "ti,am33xx";
>
>         aliases {
>                 mmcblk0 =3D &mmc1;
>
> --
> 2.43.0
>


--=20
Learn about me and setup a meeting at
https://beagleboard.org/about/jkridner - a 501c3 non-profit educating
around open hardware computing

