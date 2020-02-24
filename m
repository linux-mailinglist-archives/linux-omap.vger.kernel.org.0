Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EE4016B615
	for <lists+linux-omap@lfdr.de>; Tue, 25 Feb 2020 00:57:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728087AbgBXX5d (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Feb 2020 18:57:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:35284 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726651AbgBXX5d (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 24 Feb 2020 18:57:33 -0500
Received: from earth.universe (unknown [185.62.205.105])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1122520700;
        Mon, 24 Feb 2020 23:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582588652;
        bh=ECLu5BtxL6SR6COPqDEWNXKi20pGb/wTJBZEfJDcvxo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=axze48/IW15CZqw1/jnK0r4Jv9FUia/w9olf1wsrqM+iKLiuO+BsKr7OMa+cd+zEj
         ugeZBhxmHFOZREgdVQPdI2PRiZhjDb45dRXSsg0iL4krFE3vFcBmjGEeHej+IwIV6g
         tMy83BQJZ8FQVitrTAlsHt5oEOFnlaNXhRyzngQc=
Received: by earth.universe (Postfix, from userid 1000)
        id A34DF3C0C82; Tue, 25 Feb 2020 00:57:29 +0100 (CET)
Date:   Tue, 25 Feb 2020 00:57:29 +0100
From:   Sebastian Reichel <sre@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Rob Herring <robh@kernel.org>, linux-omap@vger.kernel.org,
        dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCHv2 02/56] ARM: dts: omap4-droid4: add panel compatible
Message-ID: <20200224235729.7q4im5jed6k7nyil@earth.universe>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
 <20200224232126.3385250-3-sebastian.reichel@collabora.com>
 <20200224233708.GG16163@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rsa4gp7ags76xtw4"
Content-Disposition: inline
In-Reply-To: <20200224233708.GG16163@pendragon.ideasonboard.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--rsa4gp7ags76xtw4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

On Tue, Feb 25, 2020 at 01:37:08AM +0200, Laurent Pinchart wrote:
> Hi Sebastian,
>=20
> Thank you for the patch.

Thanks for the review.

> On Tue, Feb 25, 2020 at 12:20:32AM +0100, Sebastian Reichel wrote:
> > Add Droid 4 specific compatible value in addition to the
> > generic one, so that we have the ability to add panel
> > specific quirks in the future.
>=20
> We need to document this compatible string in DT bindings, I don't think
> this is included in this series.

Correct, right now none of the extra compatible strings are
documented in the binding file. E.g. "tpo,taal" is used by
omap4-sdp and in the example section of the DT bindings.

> Furthermore, could we use a compatible string that actually
> matches the panel vendor and model, instead of the device name ?

We don't know the Droid 4 panel vendor and/or model. For
N950 "nokia,himalaya" is used, which is obviously also
not the real vendor. But for N950 there is a good reason
to use a N950 specific compatible anyways, since some
pixels are covered by plastic.

Maybe this can just be handled when the bindings file is
converted to YAML?

-- Sebastian

>=20
> > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > ---
> >  arch/arm/boot/dts/motorola-mapphone-common.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/arch/arm/boot/dts/motorola-mapphone-common.dtsi b/arch/arm=
/boot/dts/motorola-mapphone-common.dtsi
> > index a5e4ba7c8dab..622383ec6a75 100644
> > --- a/arch/arm/boot/dts/motorola-mapphone-common.dtsi
> > +++ b/arch/arm/boot/dts/motorola-mapphone-common.dtsi
> > @@ -200,7 +200,7 @@ dsi1_out_ep: endpoint {
> >  	};
> > =20
> >  	lcd0: panel@0 {
> > -		compatible =3D "panel-dsi-cm";
> > +		compatible =3D "motorola,droid4-panel", "panel-dsi-cm";
> >  		reg =3D <0>;
> >  		label =3D "lcd0";
> >  		vddi-supply =3D <&lcd_regulator>;
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart

--rsa4gp7ags76xtw4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl5UYuYACgkQ2O7X88g7
+pqCVQ/8DtV3mDyqUTUivxXkxLr9eNb7io2Dz6pZtOfyLG9OO6K7Ons8ftUzR/qh
SEzI6gEoWVUgREhyOKdQDlBtHpxIrV7x9pRQXQuXeEMFTw7YBLzNx0JMMNCVc7vH
dzNS6T+2Rf4skByMAOPnWFBHVZAGgZis8ecAQ2JgB7UzY+esWmDepyy8ja9Gp8Kf
moF4VzOBb7G7RjfcKkoRfpFMizZ94Lg8cfLfT/r5fQ1mDkfsityt8VkEP++xuneN
oGc/Q7dYlIWbnr6JonIv3U3PnlwavxZ+zglsAuWvJNkT8/WLnFDP1LMkkGZEg3nB
VjMSmo3oLUs+UykH2S0hgK/rqjn3Qhzq66P50r3BEIYZ0kw6oaPmET86rOf5ZsQ2
Q0JFmyrnLyTh1V6kkmBmDoIdLQDi8MccvAw4osSZO8JyGkulODSXq5hRmMbpYsNL
guaAMd5GRuQWKbuebp1t7rK+QFFhZRROlnApU8m3js3xMyIaudSVKiSLTS2zuA+z
v/VxjKXmSqHC4JDZCAz04GHBMr6NRlSQWLWUh5U6KtXe/umsVKVLQM6qiqdwxBvT
R5XZPNgBDBUQumuF/U2NtJ0rjfuenma30JCuhWZJjTUZTAmItpeLJRstNGJ8W2Ra
QgA2Cju/E+j44xg1S35M6AQ42892BZZ4zHBiKwdUCBK/MCzWbyk=
=WrVB
-----END PGP SIGNATURE-----

--rsa4gp7ags76xtw4--
