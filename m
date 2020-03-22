Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2867718ECCF
	for <lists+linux-omap@lfdr.de>; Sun, 22 Mar 2020 23:09:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726816AbgCVWJG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 22 Mar 2020 18:09:06 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:52806 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726809AbgCVWJF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 22 Mar 2020 18:09:05 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id B5CD11C0325; Sun, 22 Mar 2020 23:09:03 +0100 (CET)
Date:   Sun, 22 Mar 2020 23:09:03 +0100
From:   Pavel Machek <pavel@denx.de>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
        Lee Jones <lee.jones@linaro.org>, Jiri Slaby <jslaby@suse.cz>,
        Johan Hovold <johan@kernel.org>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Peter Hurley <peter@hurleysoftware.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH 2/4] serdev: ngsm-motmdm: Add Motorola TS 27.010 serdev
 modem driver for droid4
Message-ID: <20200322220903.GA28082@amd>
References: <20200319173755.65082-1-tony@atomide.com>
 <20200319173755.65082-3-tony@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
Content-Disposition: inline
In-Reply-To: <20200319173755.65082-3-tony@atomide.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Many Motorola phones are controlling the modem using a custom variant
> of TS 27.010 serial line discipline. Devices on these modems have a
> dedicated TS 27.010 channel for features like audio mixer, GNSS, voice
> modem, SIM card reader and so on.

I get warning here while applying:

Applying: serdev: ngsm-motmdm: Add Motorola TS 27.010 serdev modem
driver for droid4
=2Egit/rebase-apply/patch:22: new blank line at EOF.
+

Best regards,
								Pavel

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl534f8ACgkQMOfwapXb+vLvXwCgid42BgC8fqXl5YAhK+fnnoyX
HpUAnj0u/6f88ygI64AyaymJ5MNfUIYC
=k89O
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--
