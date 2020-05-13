Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3171C1D1F16
	for <lists+linux-omap@lfdr.de>; Wed, 13 May 2020 21:26:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390637AbgEMT03 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 13 May 2020 15:26:29 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:37772 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390336AbgEMT02 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 13 May 2020 15:26:28 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id E6F9C1C026E; Wed, 13 May 2020 21:26:26 +0200 (CEST)
Date:   Wed, 13 May 2020 21:26:26 +0200
From:   Pavel Machek <pavel@denx.de>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>, Rob Herring <robh@kernel.org>,
        Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
        Lee Jones <lee.jones@linaro.org>, Jiri Slaby <jslaby@suse.cz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Peter Hurley <peter@hurleysoftware.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH 3/6] dt-bindings: serdev: ngsm: Add binding for GNSS
 child node
Message-ID: <20200513192626.GA20994@duo.ucw.cz>
References: <20200512214713.40501-1-tony@atomide.com>
 <20200512214713.40501-4-tony@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="u3/rZRmxL6MmkK24"
Content-Disposition: inline
In-Reply-To: <20200512214713.40501-4-tony@atomide.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2020-05-12 14:47:10, Tony Lindgren wrote:
> For motorola modem case, we may have a GNSS device on channel 4.
> Let's add that to the binding and example.
>=20
> Signed-off-by: Tony Lindgren <tony@atomide.com>

Reviewed-by: Pavel Machek <pavel@ucw.cz>

BTW it looks like Alan's email address no longer works.

<gnomes@lxorguk.ukuu.org.uk>: host mail.llwyncelyn.cymru[82.70.14.225] said:
    550 5.1.1 <gnomes@lxorguk.ukuu.org.uk>... User unknown (in reply to RCP=
T TO

Best regards,
								Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--u3/rZRmxL6MmkK24
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXrxJ4gAKCRAw5/Bqldv6
8uQBAKCktXHQI9R0AOaYNbnocyrwvtXhqACguvWJPK6Zf5umTei7khuSQAPb9Hs=
=N2rc
-----END PGP SIGNATURE-----

--u3/rZRmxL6MmkK24--
