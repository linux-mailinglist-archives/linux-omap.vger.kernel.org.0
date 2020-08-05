Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDC9223D124
	for <lists+linux-omap@lfdr.de>; Wed,  5 Aug 2020 21:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728667AbgHET5A (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 5 Aug 2020 15:57:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728004AbgHEQoM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 5 Aug 2020 12:44:12 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE9F7C061A15
        for <linux-omap@vger.kernel.org>; Wed,  5 Aug 2020 04:07:25 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 3A063296BA6
Received: by earth.universe (Postfix, from userid 1000)
        id 5CF5D3C0C80; Wed,  5 Aug 2020 13:07:18 +0200 (CEST)
Date:   Wed, 5 Aug 2020 13:07:18 +0200
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Jyri Sarha <jsarha@ti.com>, kernel@pyra-handheld.com,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, David Shah <dave@ds0.me>
Subject: Re: module_mipi_dsi_driver panel with omapdrm?
Message-ID: <20200805110718.zvjbmv3ftgpcudly@earth.universe>
References: <20200706143613.GS37466@atomide.com>
 <E4616E3C-2519-4421-BC75-87A5CA2BB9EF@goldelico.com>
 <20200707180115.GB5849@atomide.com>
 <ECE29C41-DFE5-4A50-9206-6FB3183824C3@goldelico.com>
 <6E0A9415-9AB5-48D9-9E61-12D20655D04D@goldelico.com>
 <EE54FB82-C18E-4B81-AB38-E9453A32406B@goldelico.com>
 <20200724012411.GJ21353@pendragon.ideasonboard.com>
 <7023EB05-DC29-4D42-84C8-F0D14B50467D@goldelico.com>
 <e4caecb9-59d9-942c-0996-5906617d2604@ti.com>
 <3326D023-8D7D-4B97-90B3-E05392A187DC@goldelico.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nrp2o7orvviodf7g"
Content-Disposition: inline
In-Reply-To: <3326D023-8D7D-4B97-90B3-E05392A187DC@goldelico.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--nrp2o7orvviodf7g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Aug 05, 2020 at 11:25:58AM +0200, H. Nikolaus Schaller wrote:
> > Am 04.08.2020 um 14:43 schrieb Tomi Valkeinen <tomi.valkeinen@ti.com>:
> > On 01/08/2020 16:43, H. Nikolaus Schaller wrote:
> >> Fortunately David did fix the broken "reboot" for OMAP5 (when using ti=
mer8).
> >> Now I could run an unattended bisect session for the MIPI DSI panel dr=
iver
> >> to find as the first bad commit:
> >>=20
> >> commit e7e67d9a2f1dd2f938adcc219b3769f5cc3f0df7
> >> Author: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >> Date:   Wed Feb 26 13:24:59 2020 +0200
> >>=20
> >>   drm/omap: Switch the HDMI and VENC outputs to drm_bridge
> >>=20
> >> This was merged through v5.7-rc1. The problem persists since then up
> >> to v5.8-rc7 and likely also to v5.9.
> >>=20
> >> What I guess from the change hunks is that this is the critical one:
> >>=20
> >> diff --git a/drivers/gpu/drm/omapdrm/dss/output.c b/drivers/gpu/drm/om=
apdrm/dss/output.c
> >> index 9ba7cc8539a1..ce21c798cca6 100644
> >> --- a/drivers/gpu/drm/omapdrm/dss/output.c
> >> +++ b/drivers/gpu/drm/omapdrm/dss/output.c
> >> @@ -60,6 +60,11 @@ int omapdss_device_init_output(struct omap_dss_devi=
ce *out,
> >> 	}
> >>=20
> >> 	if (local_bridge) {
> >> +		if (!out->bridge) {
> >> +			ret =3D -EPROBE_DEFER;
> >> +			goto error;
> >> +		}
> >> +
> >> 		out->next_bridge =3D out->bridge;
> >> 		out->bridge =3D local_bridge;
> >> 	}
> >>=20
> >> Since I have not seen a reference to an omap DSI bridge driver in upst=
ream kernels
> >> I would assume that out->bridge is NULL and therefore probing is defer=
red forever
> >> and the old MIPI DSI driver (which is still there) is no longer operat=
ional.
> >>=20
> >> This is consistent with that our (old omapdrm) panel driver is no long=
er probed.
> >=20
> > What happens? Do you get any displays? Or no displays at all? Do
> > you get an error print?
> >=20
> > As Sebastian said, this shouldn't prevent DSI from probing. I
> > don't see anything in the commit that might affect DSI.
>=20
> Yes, that is indeed strange. The only potential direct reason I could ima=
gine is the
> additional test for out-bridge, but with Sebastian's explanation it is not
> even called for DSI.
>=20
> Maybe it is a false report by git bisect because this patch enables a cha=
nge somewhere
> else for the first time, which affects the DSI setup indirectly.
>=20
> I have seen that there now is a similar, but not identical report for the=
 N900 panel.

Note, that the N900 has an SDI panel, which is different from DSI.

> > Does the board have other display outputs? HDMI? If yes, could
> > you try with HDMI disabled, e.g. set its status to "disabled" in
> > the .dts.
>=20
> My good/bad indicator is that there is no /dev/fb0 created any more. I ha=
ve not
> checked for HDMI but it is likely also missing then. Basically it stopped=
 working
> with v5.7-rc1 (as the basis where we add our private panel driver, some P=
MU/charger
> driver, DTS on top) and bisect did report this commit.
>=20
> Unfortunately I currently can't do tests on real hardware and play around=
 with printk
> in the code for the next weeks. Or partially reverting the patch step by =
step to see
> which change has an influence.

So it might be HDMI (or VENC) not probing successfully and
then resulting in -EPROBE_DEFER for omapdrm with no connection to
DSI at all. I suggest to disable all non-DSI video devices in
devicetree and check if this results in DSI panel coming up.

-- Sebastian

--nrp2o7orvviodf7g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl8qkuMACgkQ2O7X88g7
+pqQuxAApKhSuuUzl1J7Tc/dmjgUcKt4W9Y+0A/Kkr4M4BUVKJtfqfoj3J5+7e1a
5pwjpUEML5qBucQVu1GNsiOyccwpP6hq+gGywnC5gWWBXd60KHYUhjPP8xIfofxD
xEVlibOWEI23tZJK53j4qcz2mr2lDAkTGEW+bh1QQ9j3wFQ76JJF1c28TlsSBaMK
n/afPANev1JLJ8MytnHEFFArJp+0nge3bOZ8gP0j4qiX+EhGz9dGfijhtjyt+LjJ
MeS5hfD7/6v4ZgEjMSp3dlAawb8f12W5SGQAriOMwPuCAi7bChhZjnOLgGLq3lvW
d4ZaLJz2gLcR1vk627JbP3KM0ynEVjWJ2EV3bKAXqZSod2pL5+zT2q3i642e12vh
4VPf3ZqJE0WRfAOsBeBb5km6ZD9+VJaGSo22FDa8KOPQX2MLWGee+nd6e/BFRI5x
geEryLMjWf+HwpGTRYkNhDIMLFiXo1mbXBG6jsde+RosSsiEv91dSSJcGV3ueWOs
d77wS7LZDeaBfoZYkfKTx1987gnO182wKgAxkCY16xPjlUjiTyTS51FrUyd/Nbry
2Rc+vXXBA0OjF8fnyh1G3kSdj8jyt8dThxg8wPdotuhvbCjX0jkddUsWZlJ1nVk7
CCKrrPIrZgkrMGbfQ4PXbFa6bg8U8kt1cRIsmWw35Ue3NfbZpN0=
=yrQS
-----END PGP SIGNATURE-----

--nrp2o7orvviodf7g--
