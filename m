Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3F431C1EA7
	for <lists+linux-omap@lfdr.de>; Fri,  1 May 2020 22:41:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbgEAUd5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 1 May 2020 16:33:57 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:56944 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbgEAUd4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 1 May 2020 16:33:56 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 631651C020D; Fri,  1 May 2020 22:33:54 +0200 (CEST)
Date:   Fri, 1 May 2020 22:33:54 +0200
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
Subject: Re: [PATCH 2/6] dt-bindings: serdev: ngsm: Add binding for
 serdev-ngsm
Message-ID: <20200501203354.GD6043@duo.ucw.cz>
References: <20200430174615.41185-1-tony@atomide.com>
 <20200430174615.41185-3-tony@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="IDYEmSnFhs3mNXr+"
Content-Disposition: inline
In-Reply-To: <20200430174615.41185-3-tony@atomide.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--IDYEmSnFhs3mNXr+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2020-04-30 10:46:11, Tony Lindgren wrote:
> Add a binding document for a generic serdev-ngsm driver that can be
> used to bring up TS 27.010 line discipline with Linux n_gsm support
> on a serial port.
>=20
> As the Motorola Mapphone modems require some custom handling, they
> are handled with a separate compatible.
>=20
> Let's also add vendor string for ETSI as we're using a ETSI 3GPP
> TS 27.010 standard.
>=20
> Signed-off-by: Tony Lindgren <tony@atomide.com>

Reviewed-by: Pavel Machek <pavel@ucw.cz>

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--IDYEmSnFhs3mNXr+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXqyHsgAKCRAw5/Bqldv6
8qpmAJ4u6QcwJrnIodEOCgLHz//7PFwN5ACggpNJzLdgXm9ONB5Rczrm99TWPxg=
=XuF9
-----END PGP SIGNATURE-----

--IDYEmSnFhs3mNXr+--
