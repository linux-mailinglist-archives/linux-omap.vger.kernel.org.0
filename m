Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46F63260E15
	for <lists+linux-omap@lfdr.de>; Tue,  8 Sep 2020 10:52:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729351AbgIHIw1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Sep 2020 04:52:27 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:54814 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729831AbgIHIwZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Sep 2020 04:52:25 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id F0CA21C0B7F; Tue,  8 Sep 2020 10:52:20 +0200 (CEST)
Date:   Tue, 8 Sep 2020 10:52:20 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Sebastian Reichel <sre@kernel.org>, ruleh <ruleh@gmx.de>
Subject: Re: [PATCHv3 0/3] Lost key-up interrupt handling for omap4-keypad
Message-ID: <20200908085220.GA31790@duo.ucw.cz>
References: <20200318225727.29327-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="bp/iNruPH9dso1Pn"
Content-Disposition: inline
In-Reply-To: <20200318225727.29327-1-tony@atomide.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> This series updates omap4-keypad to disable unused long interrupts, and
> implements the missing parts for the lost key-up interrupt quirk as
> described in the silicon errata pdf.

I do not see this in 5.9-rc4; problem is real, could we get this
merged?

Best regards,
								Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--bp/iNruPH9dso1Pn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX1dGRAAKCRAw5/Bqldv6
8mhuAJ0bd0adr/q5qzqRpWKN76Rv7KHL3QCgv6h/HnTSYDg2UPC1NWKtXP8ISAs=
=4jTF
-----END PGP SIGNATURE-----

--bp/iNruPH9dso1Pn--
