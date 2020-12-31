Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56B772E7F53
	for <lists+linux-omap@lfdr.de>; Thu, 31 Dec 2020 11:17:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726218AbgLaKRO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 31 Dec 2020 05:17:14 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.218]:15818 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726155AbgLaKRO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 31 Dec 2020 05:17:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1609409601;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:From:
        Subject:Sender;
        bh=qzQ+GS3/plja56EfSfDaVpNIH/FFQzPqKUfj1vP4nTM=;
        b=ooFbk29x2RUCXgmh49nXjIbPpn1bXjFes2TJ/VCsCdSeTtEW0Hdrrw9wRYbvpJ3sSH
        PBGjUk54IYKH53PIhMekGF+Wt8IanIuNC6WSna0rPq1pMUD21eWHIaUNCrmdMeBsE0wb
        Wxl25h7ahOEkKS23Ny1i6/g4M4BU8ejy6MjSnfFvvqep3Lp/jZ4uKqgycu6CfHHa8TKB
        U8sVl5DwNb2dbj65eZwMOYvKeSVjgZXnaj8ZF9WK0qA+VUKNqHW+zhusgTGZLv8XY0XL
        0sxtHmy+mqyRYRZOo53UqNueg0ZEFwSEq2BtqJZlghUnYj6GJs+RFN6HFsQKiSL2P1jj
        LTMQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/vvwDepDQ=="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 47.10.7 DYNA|AUTH)
        with ESMTPSA id 003539wBVADEGyn
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Thu, 31 Dec 2020 11:13:14 +0100 (CET)
Subject: Re: [PATCH  v2 1/1] ARM: dts: omap443x: Correct sgx clock to 307.2MHz as used on motorola vendor kernel
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20201231110040.bdbb9788abd1723d68b67df0@uvos.xyz>
Date:   Thu, 31 Dec 2020 11:13:14 +0100
Cc:     tony@atomide.com, bcousson@baylibre.com, robh+dt@kernel.org,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <05FC1BDC-044B-42E9-95AE-A602E149FD38@goldelico.com>
References: <20201231110040.bdbb9788abd1723d68b67df0@uvos.xyz>
To:     Carl Philipp Klemm <philipp@uvos.xyz>
X-Mailer: Apple Mail (2.3124)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Am 31.12.2020 um 11:00 schrieb Carl Philipp Klemm <philipp@uvos.xyz>:
>=20
> The Android vendor kernel uses 307.2MHz or a devider ratio of /5 while =
active=20

s/devider/divider/

> 153600000 or /10 is only used when the sgx core is inactive.
>=20
> Signed-off-by: Carl Philipp Klemm <philipp@uvos.xyz>
> ---
> arch/arm/boot/dts/omap443x.dtsi | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/omap443x.dtsi =
b/arch/arm/boot/dts/omap443x.dtsi
> index dd8ef58cbaed..8466161197ae 100644
> --- a/arch/arm/boot/dts/omap443x.dtsi
> +++ b/arch/arm/boot/dts/omap443x.dtsi
> @@ -78,11 +78,11 @@ &cpu_thermal {
> /include/ "omap443x-clocks.dtsi"
>=20
> /*
> - * Use dpll_per for sgx at 153.6MHz like droid4 stock v3.0.8 Android =
kernel
> + * Use dpll_per for sgx at 307.2MHz like droid4 stock v3.0.8 Android =
kernel
>  */
> &sgx_module {
> 	assigned-clocks =3D <&l3_gfx_clkctrl OMAP4_GPU_CLKCTRL 24>,
> 			  <&dpll_per_m7x2_ck>;
> -	assigned-clock-rates =3D <0>, <153600000>;
> +	assigned-clock-rates =3D <0>, <307200000>;
> 	assigned-clock-parents =3D <&dpll_per_m7x2_ck>;
> };
> --=20
> 2.29.2
>=20

