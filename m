Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE09D2F0E3A
	for <lists+linux-omap@lfdr.de>; Mon, 11 Jan 2021 09:35:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727739AbhAKIeh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 11 Jan 2021 03:34:37 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:57440 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726611AbhAKIeh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 11 Jan 2021 03:34:37 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 2DE6C1C0B85; Mon, 11 Jan 2021 09:33:54 +0100 (CET)
Date:   Mon, 11 Jan 2021 09:33:53 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Carl Philipp Klemm <philipp@uvos.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>, ruleh <ruleh@gmx.de>,
        Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH 5/5] Input: omap4-keypad - implement errata check for
 lost key-up events
Message-ID: <20210111083353.GA23439@amd>
References: <20210110190529.46135-1-tony@atomide.com>
 <20210110190529.46135-6-tony@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Content-Disposition: inline
In-Reply-To: <20210110190529.46135-6-tony@atomide.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> We are still missing handling for errata i689 related issues for the
> case where we never see a key up interrupt for the last pressed key.
>=20
> To fix the issue, we must scan the key state again after the keyboard
> controller has idled to check if a key up event was missed. This is
> described in the omap4 silicon errata documentation for Errata ID i689
> "1.32 Keyboard Key Up Event Can Be Missed":
>=20
> "When a key is released for a time shorter than the debounce time,
>  in-between 2 key press (KP1 and KP2), the keyboard state machine will go
>  to idle mode and will never detect the key release (after KP1, and also
>  after KP2), and thus will never generate a new IRQ indicating the key
>  release."
>=20
> We can use PM runtime autosuspend features to check the keyboard state
> after it enters idle.

I thought about this and... is it reasonable?

Autosuspend is now required for correct operation. But autosuspend is
optional feature, configurable by user, and may not be available
depending on .config.

Do we need some other solution?
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl/8DXEACgkQMOfwapXb+vKtZACfd3NcNXkO1yKW1SP+TADKN1yG
4P4AniWJwRF37GaWLU1uCaVqN3ns6EGf
=OW9c
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--
