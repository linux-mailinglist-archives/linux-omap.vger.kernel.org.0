Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71C091C1ECD
	for <lists+linux-omap@lfdr.de>; Fri,  1 May 2020 22:47:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726384AbgEAUpV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 1 May 2020 16:45:21 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:58106 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbgEAUpU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 1 May 2020 16:45:20 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id E316E1C020C; Fri,  1 May 2020 22:45:18 +0200 (CEST)
Date:   Fri, 1 May 2020 22:45:18 +0200
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
Subject: Re: [PATCH 4/6] dt-bindings: gnss: Add binding for Motorola Mapphone
 MDM6600 GNSS
Message-ID: <20200501204518.GF6043@duo.ucw.cz>
References: <20200430174615.41185-1-tony@atomide.com>
 <20200430174615.41185-5-tony@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="7mxbaLlpDEyR1+x6"
Content-Disposition: inline
In-Reply-To: <20200430174615.41185-5-tony@atomide.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--7mxbaLlpDEyR1+x6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 2020-04-30 10:46:13, Tony Lindgren wrote:
> Add a binding document for Motorola Mapphone MDM6600 GNSS driver that
> can be used with phones such as droid4.

-> Droid 4.

> Signed-off-by: Tony Lindgren <tony@atomide.com>

Reviewed-by: Pavel Machek <pavel@ucw.cz>
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--7mxbaLlpDEyR1+x6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXqyKXgAKCRAw5/Bqldv6
8pUAAJ9VCXdeP12jHU/+L3hENJu3XqbIxgCfapGMsM9emO71ihgPyX7MZurxz8s=
=GZcg
-----END PGP SIGNATURE-----

--7mxbaLlpDEyR1+x6--
