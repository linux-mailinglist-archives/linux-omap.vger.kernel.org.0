Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EED342B3898
	for <lists+linux-omap@lfdr.de>; Sun, 15 Nov 2020 20:25:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727460AbgKOTZC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 15 Nov 2020 14:25:02 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:42834 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726923AbgKOTZB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 15 Nov 2020 14:25:01 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 5AD2E1C0BD1; Sun, 15 Nov 2020 20:24:58 +0100 (CET)
Date:   Sun, 15 Nov 2020 20:24:58 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Tony Lindgren <tony@atomide.com>
Cc:     kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, sre@kernel.org, nekit1000@gmail.com,
        mpartap@gmx.net, merlijn@wizzup.org, martin_rysavy@centrum.cz
Subject: Re: v5.10-rc3 vs. Droid 4
Message-ID: <20201115192458.GA19769@duo.ucw.cz>
References: <20201114205744.GA7436@duo.ucw.cz>
 <20201115083126.GX26857@atomide.com>
 <20201115174909.GB32085@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Content-Disposition: inline
In-Reply-To: <20201115174909.GB32085@duo.ucw.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2020-11-15 18:49:09, Pavel Machek wrote:
> Hi!
> > >=20
> > > Does anyone have Droid 4 working with 5.10-rc3?
> > >=20
> > > I tried it with the original config; I got message about culomb
> > > counter calibration done scrolling (and boot progressing very slowly
> > > or not at all) . So ... I disabled cpcap battery & charger
> > > support. But init still drops me to emergency shell.
> > >=20
> > > I may try some more, but if someone know what is going on, let me
> > > know.
> >=20
> > I ran into this too, sorry I thought I added you to Cc but looks like n=
ot.
> > See the fix here:
> >=20
> > https://lore.kernel.org/lkml/20201111170613.46057-1-tony@atomide.com/
>=20
> You did (thank you!) but I failed to realize importance of that
> email. I have tested it and the culomb counter messages are gone.
>=20
> Good.
>=20
> But it looks like my mmcblk interfaces got re-numbered, from mmcblk0 &
> mmcblk1 to mmcblk0 & mmcblk2. ... which breaks my startup. If someone
> knows what is going on there, please tell me :-).

It seems like my wireless card sabotages the mmc? If I disable mmc3
completely, I'm back to working system. (Those omap3 changes are
probably not needed).

Best regards,
									Pavel


diff --git a/arch/arm/boot/dts/motorola-mapphone-common.dtsi b/arch/arm/boo=
t/dts/motorola-mapphone-common.dtsi
index ae4c0f7c7383..21a5375f1e66 100644
--- a/arch/arm/boot/dts/motorola-mapphone-common.dtsi
+++ b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
@@ -394,6 +394,7 @@
 	ti,non-removable;
 };
=20
+#if 0
 &mmc3 {
 	pinctrl-names =3D "default";
 	pinctrl-0 =3D <&mmc3_pins>;
@@ -420,6 +421,7 @@
 		tcxo-clock-frequency =3D <26000000>;
 	};
 };
+#endif
=20
 &i2c1 {
 	led-controller@38 {
diff --git a/arch/arm/boot/dts/omap3-n900.dts b/arch/arm/boot/dts/omap3-n90=
0.dts
index 1fed802175fc..60eb3ebdc6b8 100644
--- a/arch/arm/boot/dts/omap3-n900.dts
+++ b/arch/arm/boot/dts/omap3-n900.dts
@@ -866,9 +866,11 @@
 	no-sd;
 };
=20
+#if 0
 &mmc3 {
 	status =3D "disabled";
 };
+#endif
=20
 &gpmc {
 	ranges =3D <0 0 0x01000000 0x01000000>,	/* 16 MB for OneNAND */
diff --git a/arch/arm/boot/dts/omap3-n950-n9.dtsi b/arch/arm/boot/dts/omap3=
-n950-n9.dtsi
index 8601e5ab85b8..704e4c7149ed 100644
--- a/arch/arm/boot/dts/omap3-n950-n9.dtsi
+++ b/arch/arm/boot/dts/omap3-n950-n9.dtsi
@@ -563,9 +563,11 @@
 	ti,non-removable;
 };
=20
+#if 0
 &mmc3 {
 	status =3D "disabled";
 };
+#endif
=20
 /* RNG not directly accessible on N950/N9. */
 &rng_target {
diff --git a/arch/arm/boot/dts/omap3.dtsi b/arch/arm/boot/dts/omap3.dtsi
index 9dcae1f2bc99..ba575e76b75a 100644
--- a/arch/arm/boot/dts/omap3.dtsi
+++ b/arch/arm/boot/dts/omap3.dtsi
@@ -532,6 +532,7 @@
 			dma-names =3D "tx", "rx";
 		};
=20
+#if 0
 		mmc3: mmc@480ad000 {
 			compatible =3D "ti,omap3-hsmmc";
 			reg =3D <0x480ad000 0x200>;
@@ -540,6 +541,7 @@
 			dmas =3D <&sdma 77>, <&sdma 78>;
 			dma-names =3D "tx", "rx";
 		};
+#endif
=20
 		mmu_isp: mmu@480bd400 {
 			#iommu-cells =3D <0>;
diff --git a/arch/arm/boot/dts/omap4-l4.dtsi b/arch/arm/boot/dts/omap4-l4.d=
tsi
index de742bf84efb..477246f8d5c1 100644
--- a/arch/arm/boot/dts/omap4-l4.dtsi
+++ b/arch/arm/boot/dts/omap4-l4.dtsi
@@ -2214,6 +2214,7 @@
 			ranges =3D <0x0 0xa8000 0x4000>;
 		};
=20
+#if 0
 		target-module@ad000 {			/* 0x480ad000, ap 63 50.0 */
 			compatible =3D "ti,sysc-omap4", "ti,sysc";
 			reg =3D <0xad000 0x4>,
@@ -2245,6 +2246,7 @@
 				dma-names =3D "tx", "rx";
 			};
 		};
+#endif	=09
=20
 		target-module@b0000 {			/* 0x480b0000, ap 47 40.0 */
 			compatible =3D "ti,sysc";




--=20
http://www.livejournal.com/~pavelmachek

--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX7GAigAKCRAw5/Bqldv6
8txgAJ9Y7QnrBw7OULCr5tdWTq7HqbSk1QCfUhxwOb6RhA3EczXsCYFcR4m48K8=
=hbgn
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--
