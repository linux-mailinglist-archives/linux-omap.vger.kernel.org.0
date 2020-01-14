Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D73513AF8F
	for <lists+linux-omap@lfdr.de>; Tue, 14 Jan 2020 17:37:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726523AbgANQht (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 14 Jan 2020 11:37:49 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:8014 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726195AbgANQhs (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 14 Jan 2020 11:37:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1579019866;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=2f9VKmggQSptyUsWFRV7uBDsVukpOAFK7KrbKTr5wFA=;
        b=jSJ0QUzYrxipHWTf68EjR6nxNiSAqcuxrFq0LwYYX0GB3FnSedCMpVdDDE/7ELHlYP
        mnc6oBBMEb97pJXieVXLQWoB6KU1yiA5GBL5a/eET5oBUsmiZVvNxYLENgQ+wiLK0uUj
        YrJeRT+aOUuPZaVJcSKbpEZ64VAJvu9g9Yp+Dfs5VT646die6VMy+rIRZ03lScxkB1zx
        xorK5MQ/2vcsMS/KmDdjtBeKU24QvDVz37HyZs7YYtRwlKks3JGMHhk32Ml2VDIFTBIF
        gi6wxAZ2BZDHrWhcOlqZ6B1A5EG9EXEc4PRvfnsk9PfQDY3P8rdJDIEyNZu+ADYurTb7
        cjRA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Qpw97WFDlaYXA4FNWc="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.1.4 DYNA|AUTH)
        with ESMTPSA id c04ea5w0EGbePaA
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Tue, 14 Jan 2020 17:37:40 +0100 (CET)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH] ARM: dts: Configure omap5 AESS
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200114150937.18304-1-tony@atomide.com>
Date:   Tue, 14 Jan 2020 17:37:40 +0100
Cc:     linux-omap@vger.kernel.org,
        =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org,
        Matthijs van Duin <matthijsvanduin@gmail.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Tero Kristo <t-kristo@ti.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <52905C15-A2D1-4372-9781-D602D0B274B6@goldelico.com>
References: <20200114150937.18304-1-tony@atomide.com>
To:     Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

> Am 14.01.2020 um 16:09 schrieb Tony Lindgren <tony@atomide.com>:
>=20
> We are missing AESS for omap5. Looks like it's similar to what we have
> for omap4, and this gets ti-sysc interconnect target module driver to
> detect it properly.
>=20
> Note that we currently have no child device driver available for it.

What I have is a non-working and no more compiling driver originally =
written by
Peter Ujfalusi and reworked by Andrej Utkin. We did have it almost =
running on
v4.14 or so except problems with firmware versions and headers...

There we used classical hwmods and I could revert them now to try your =
new patches.
Unfortunately, I could only compile-test your two patches but nothing =
with AESS.

We had tried to follow kernel API changes in the sound subsystem but =
today it is
not even compiling any more :(

So getting a working device driver is an even bigger task than SGX was.

>=20
> Cc: H. Nikolaus Schaller <hns@goldelico.com>
> Cc: Matthijs van Duin <matthijsvanduin@gmail.com>
> Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
> Cc: Tero Kristo <t-kristo@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>=20
> Note that this depends on "[PATCH] clk: ti: omap5: Add missing AESS =
clock".
>=20
> arch/arm/boot/dts/omap5-l4-abe.dtsi | 16 ++++++++++++++--
> 1 file changed, 14 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/omap5-l4-abe.dtsi =
b/arch/arm/boot/dts/omap5-l4-abe.dtsi
> --- a/arch/arm/boot/dts/omap5-l4-abe.dtsi
> +++ b/arch/arm/boot/dts/omap5-l4-abe.dtsi
> @@ -426,8 +426,20 @@ target-module@c0000 {			/* =
0x401c0000, ap 30 1e.0 */
> 		};
>=20
> 		target-module@f1000 {			/* 0x401f1000, =
ap 32 20.0 */

Here its may be good to have an "aess" label.

> -			compatible =3D "ti,sysc";
> -			status =3D "disabled";
> +			compatible =3D "ti,sysc-omap4", "ti,sysc";
> +			reg =3D <0xf1000 0x4>,
> +			      <0xf1010 0x4>;
> +			reg-names =3D "rev", "sysc";
> +			ti,sysc-midle =3D <SYSC_IDLE_FORCE>,
> +					<SYSC_IDLE_NO>,
> +					<SYSC_IDLE_SMART>,
> +					<SYSC_IDLE_SMART_WKUP>;
> +			ti,sysc-sidle =3D <SYSC_IDLE_FORCE>,
> +					<SYSC_IDLE_NO>,
> +					<SYSC_IDLE_SMART>;
> +			/* Domains (V, P, C): iva, abe_pwrdm, abe_clkdm =
*/
> +			clocks =3D <&abe_clkctrl OMAP5_AESS_CLKCTRL 0>;
> +			clock-names =3D "fck";
> 			#address-cells =3D <1>;
> 			#size-cells =3D <1>;
> 			ranges =3D <0x0 0xf1000 0x1000>,
> --=20
> 2.24.1

BR and thanks,
Nikolaus=
