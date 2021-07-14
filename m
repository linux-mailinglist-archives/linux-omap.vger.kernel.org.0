Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5100B3C7F68
	for <lists+linux-omap@lfdr.de>; Wed, 14 Jul 2021 09:33:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238163AbhGNHgH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Jul 2021 03:36:07 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:11483 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238139AbhGNHgG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 14 Jul 2021 03:36:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1626247974;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=frxvPn/3DRth+yPvylduwkc8X0PJDf65B+98vS/70Xg=;
    b=ZndagKNz7g4Gi0NcO/UrgxtqKefxPP9S8RAAUKLfpUQ1qDIIpQI8szpFftUGPjCDsp
    Pr9EYfECFXE/XRgvIRFMewg1dBoWCNffoCGqD/6hq3snA4wPEGWZjZ8+uz5pkQS79ewN
    dwWPCj1rTGBPozSlBihN1My9VTtNobvjMJpP2z30ZgNLXDlcoaiXHDNhUhn3t44ghcBG
    1OAJl5+kFDFCMBcCT4RYfLrr1VfWgAoVfF8bFEHWi5C7RcV9jg1ShcuuVu3OYHB8VdlO
    +TkDN4/KQuWTGWQm9ZMeOJjdj3ZoSAKzzJjHk6aj1jbzdWSBXuZrIvEppy6NEGuU3i0B
    vZww==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHWElw43tlAA="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
    by smtp.strato.de (RZmta 47.28.1 DYNA|AUTH)
    with ESMTPSA id h06665x6E7WszQZ
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Wed, 14 Jul 2021 09:32:54 +0200 (CEST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH v2] omap5-board-common: remove not physically existing
 vdds_1v8_main fixed-regulator
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <e836d5d98b028bdbb8805bcf79489e0df28add6c.1625148021.git.hns@goldelico.com>
Date:   Wed, 14 Jul 2021 09:32:52 +0200
Cc:     linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        letux-kernel@openphoenux.org, kernel@pyra-handheld.com,
        devicetree@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <27948BF2-82E3-4140-A194-F938F3A64863@goldelico.com>
References: <e836d5d98b028bdbb8805bcf79489e0df28add6c.1625148021.git.hns@goldelico.com>
To:     Tony Lindgren <tony@atomide.com>,
        Graeme Gregory <gg@slimlogic.co.uk>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Nishanth Menon <nm@ti.com>,
        peter.ujfalusi@gmail.com,
        =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
X-Mailer: Apple Mail (2.3445.104.21)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Any comments?

> Am 01.07.2021 um 16:00 schrieb H. Nikolaus Schaller =
<hns@goldelico.com>:
>=20
> This device tree include file describes a fixed-regulator
> connecting smps7_reg output (1.8V) to some 1.8V rail and
> consumers (vdds_1v8_main).
>=20
> This regulator does not physically exist.
>=20
> I assume it was introduced as a wrapper around smps7_reg
> to provide a speaking signal name "vdds_1v8_main" as label.
>=20
> This fixed-regulator without real function was not an issue
> in driver code until
>=20
>  Commit 98e48cd9283d ("regulator: core: resolve supply for =
boot-on/always-on regulators")
>=20
> introduced a new check for regulator initialization which
> makes Palmas regulator registration fail:
>=20
> [    5.407712] ldo1: supplied by vsys_cobra
> [    5.412748] ldo2: supplied by vsys_cobra
> [    5.417603] palmas-pmic 48070000.i2c:palmas@48:palmas_pmic: failed =
to register 48070000.i2c:palmas@48:palmas_pmic regulator
>=20
> The reason is that the supply-chain of regulators is too
> long and goes from ldo3 through the virtual vdds_1v8_main
> regulator and then back to smps7. This adds a cross-dependency
> of probing Palmas regulators and the fixed-regulator which
> leads to probe deferral by the new check and is no longer
> resolved.
>=20
> Since we do not control what device tree files including this
> one reference (either &vdds_1v8_main or &smps7_reg or both)
> we keep both labels for smps7 for compatibility.
>=20
> Fixes: 98e48cd9283d ("regulator: core: resolve supply for =
boot-on/always-on regulators")
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
> arch/arm/boot/dts/omap5-board-common.dtsi | 9 +--------
> 1 file changed, 1 insertion(+), 8 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/omap5-board-common.dtsi =
b/arch/arm/boot/dts/omap5-board-common.dtsi
> index d8f13626cfd1..3a8f10231475 100644
> --- a/arch/arm/boot/dts/omap5-board-common.dtsi
> +++ b/arch/arm/boot/dts/omap5-board-common.dtsi
> @@ -30,14 +30,6 @@ vsys_cobra: fixedregulator-vsys_cobra {
> 		regulator-max-microvolt =3D <5000000>;
> 	};
>=20
> -	vdds_1v8_main: fixedregulator-vdds_1v8_main {
> -		compatible =3D "regulator-fixed";
> -		regulator-name =3D "vdds_1v8_main";
> -		vin-supply =3D <&smps7_reg>;
> -		regulator-min-microvolt =3D <1800000>;
> -		regulator-max-microvolt =3D <1800000>;
> -	};
> -
> 	vmmcsd_fixed: fixedregulator-mmcsd {
> 		compatible =3D "regulator-fixed";
> 		regulator-name =3D "vmmcsd_fixed";
> @@ -487,6 +479,7 @@ smps6_reg: smps6 {
> 					regulator-boot-on;
> 				};
>=20
> +				vdds_1v8_main:
> 				smps7_reg: smps7 {
> 					/* VDDS_1v8_OMAP over =
VDDS_1v8_MAIN */
> 					regulator-name =3D "smps7";
> --=20
> 2.31.1
>=20

