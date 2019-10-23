Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BB0BE1998
	for <lists+linux-omap@lfdr.de>; Wed, 23 Oct 2019 14:06:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391144AbfJWMGb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 23 Oct 2019 08:06:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:55572 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388063AbfJWMGb (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 23 Oct 2019 08:06:31 -0400
Received: from earth.universe (monacowifi.monaco.mc [82.113.13.92])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 57DCE20640;
        Wed, 23 Oct 2019 12:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571832389;
        bh=+a9nfhoSteckAEw+dh3luF4u8UgaH0zuYkDdjBqJdpo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SYuVD9gOMYo8HSbVPZnjlZwBZbw6N0hnVg90r+ge9zuaQXMSWC2FX7XPBKxJnsKi3
         hUzAUp4AtvuESpWl5Ug59M/JDWdaa8MdGOQkMoJVaViiZrtlid6iB7//nIuioX/6nF
         eTZAjQM9Qg5Koh6xS2b7xev0XF2pCb7qtE02QPKU=
Received: by earth.universe (Postfix, from userid 1000)
        id 2D7473C09B2; Wed, 23 Oct 2019 14:06:23 +0200 (CEST)
Date:   Wed, 23 Oct 2019 14:06:23 +0200
From:   Sebastian Reichel <sre@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Marcel Holtmann <marcel@holtmann.org>,
        Adam Ford <aford173@gmail.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        linux-bluetooth@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCHv2 0/4] Convert all btwilink users to hci_ll and drop
 btwilink
Message-ID: <20191023120623.gxuxm53tdcvo7biu@earth.universe>
References: <20191003134147.9458-1-sre@kernel.org>
 <20191008143116.GF5610@atomide.com>
 <20191020203352.rh3n6qpagiyift7d@earth.universe>
 <20191022160111.GP5610@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="kqi4wz7ug3lodin7"
Content-Disposition: inline
In-Reply-To: <20191022160111.GP5610@atomide.com>
User-Agent: NeoMutt/20180716
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--kqi4wz7ug3lodin7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Oct 22, 2019 at 09:01:11AM -0700, Tony Lindgren wrote:
> * Sebastian Reichel <sre@kernel.org> [191020 20:34]:
> > On Tue, Oct 08, 2019 at 07:31:16AM -0700, Tony Lindgren wrote:
> > > * Sebastian Reichel <sre@kernel.org> [191003 06:42]:
> > > > This moves the remaining users of btwilink to the "new" serdev base=
d hci_ll
> > > > driver and drops the btwilink driver afterwards. The patches were o=
nly compile
> > > > tested by me, but Enric tested the IGEP platform and Adam will test=
 the LogicPD
> > > > platform.
> > > >=20
> > > > I kept the TI_ST driver for now, since I plan to send a second patc=
hset for the
> > > > FM radio driver. Once the FM driver has been converted to also use =
hci_ll, we
> > > > can remove TI_ST completly.
> > > >=20
> > > > My suggestion is for the patch handling is, that everything simply =
goes through
> > > > Tony's tree.
> > >=20
> > > Sounds good to me, good to see kim gone with patch 3/4 :)
> > >=20
> > > Marcel, care to ack the old driver removal patch?
> >=20
> > Looks like Marcel missed the extra messages and merged the 4th
> > patch, so I guess you can just merge patches 1-3. Technically that
> > might lead to temporarily missing BT support on those two devices
> > when the BT tree is merged before ARM tree during the merge window.
> > Not a big issue I guess.
>=20
> Sure no problem. Applying dts changes into omap-for-v5.5/dt
> and the pdata quirk removal to omap-for-v5.5/soc.

Thanks.

> I guess ti_wilink_st.h will need some follow-up patch to
> remove unused platform data, but best to wait on that.

The header will receive a cleanup in the patchset moving the FM
driver from TI_ST to serdev based bluetooth driver. After that
patchset most of the ti_wilink_st.h content can be removed.

-- Sebastian

--kqi4wz7ug3lodin7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl2wQjsACgkQ2O7X88g7
+prBfxAAjpFCamhjBDtV/91EgED/tFuRdEnoinyCfwtkvetGj6ljLv6H0IFFGGbu
ZSkbuRndI0qzeOXV5MeY2750pIGaL7rNlHXME5oDfPPgg65ucWpBc9CKQjY0n68s
Rg3SlkNH/24toPFqJ383aeErCa6VjV/KXUfTG4zVzDB7BOaJKy6u146WoscCsZtn
x84vtolpNSupyuk0TrQnDKTWObhT0/gIXYR4TOQ8W77GST7kUWotluJao3/w/m0I
j07dObLoZKvdRaWWUO16lSbbmlximfSIuhK0rutZfLU8LS0RIkrO7AytF4+NtlqT
L18y1eUaIZronA+8gNNTLgHAHIMVhn0AegIwJ4zpudlzLop0KC7DWLs5g7/9FifX
SQ2KNuZ9IiW2mel1q/Qinh3j0c7eW5faIZB9Zy6xOpwqSwzKLtabh8bIOLdjQBgA
gC870bXSa3+du/651t662SmRdYsrJRANoTIaTVgpyLpVmuANebHvs910ASvoRX5j
WBSSne3TPN2yA47m54Lf9swkGG8iP2dy/ytpDqmFTOGrumbBXorYGlj9NzotIUpZ
UQtgJ9PpQTFP4zkLYO1/MDPmXod2+puyLPjMJDaiUpc9AKgwLwYrDKmLT1TOMIja
NLZ7ae+8J0Qd3HIqGU/rf9bqrBB/gnxNGOlR1OLWkDy2hTDNG60=
=AWMy
-----END PGP SIGNATURE-----

--kqi4wz7ug3lodin7--
