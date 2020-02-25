Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A48316F3DF
	for <lists+linux-omap@lfdr.de>; Wed, 26 Feb 2020 00:52:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729586AbgBYXws (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 25 Feb 2020 18:52:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:47496 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729277AbgBYXwq (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 25 Feb 2020 18:52:46 -0500
Received: from earth.universe (unknown [185.62.205.105])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8F5A82467A;
        Tue, 25 Feb 2020 23:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582674765;
        bh=wKBCNSbyYVBJJwkuzCWN2duSTMywEgXG/EXJhIhpDcc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=yHG/9vLmvz9nSxA3M/e93dJxrc+U8EWmTE/Im27WUNj8eI2rkeMipWpXEVig16mhT
         pC4V5U0MJU+ihWDPSnDNzgTvEo94NoySJOozCzGXQCOk9whzd6ToS9WWgem+D8uMdw
         vCuaNsjMot8yUwkLZ9oMm3Edn/2wtvXC2x2MLsYE=
Received: by earth.universe (Postfix, from userid 1000)
        id 1F2F83C0C83; Wed, 26 Feb 2020 00:52:43 +0100 (CET)
Date:   Wed, 26 Feb 2020 00:52:43 +0100
From:   Sebastian Reichel <sre@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Rob Herring <robh@kernel.org>, linux-omap@vger.kernel.org,
        dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCHv2 00/56] drm/omap: Convert DSI code to use drm_mipi_dsi
 and drm_panel
Message-ID: <20200225235243.dr2apisbxzugj34u@earth.universe>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
 <20200225001011.GF37466@atomide.com>
 <20200225022822.wh7omykthv7skojy@earth.universe>
 <20200225154237.GH37466@atomide.com>
 <20200225230124.fkt35ihyjnokb2ng@earth.universe>
 <20200225230937.GL37466@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6payldeld37nof6m"
Content-Disposition: inline
In-Reply-To: <20200225230937.GL37466@atomide.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--6payldeld37nof6m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Feb 25, 2020 at 03:09:37PM -0800, Tony Lindgren wrote:
> * Sebastian Reichel <sre@kernel.org> [200225 23:03]:
> > Hi,
> >=20
> > On Tue, Feb 25, 2020 at 07:42:37AM -0800, Tony Lindgren wrote:
> > > * Sebastian Reichel <sre@kernel.org> [200225 02:29]:
> > > > On Mon, Feb 24, 2020 at 04:10:11PM -0800, Tony Lindgren wrote:
> > > > > BTW, I think there's also some refcount issue in general where
> > > > > the omapdrm related modules cannot be unloaded any longer?
> > > >=20
> > > > I wouldn't be too surprised. The dependencies are quite interesting
> > > > at the moment with omapdss registering omapdrm and then omapdrm
> > > > registers the drm_device, which references the encoders from
> > > > omapdss. I think this is something to look at once Laurent's and
> > > > my branch have been merged to avoid increasing the complexity.
> > > > Technically it should be possible to link everything into one
> > > > module.
> > >=20
> > > Well the DSS is really DOSSI for Display Output SubSystem
> > > Interconnect :) The devices on the interconnect are mostly
> > > independent and ideally the toplevel dss driver would just
> > > provide Linux generic resources to dispc and various output
> > > drivers. So probably not a good idea to try to build it all
> > > into a single module.
> >=20
> > All the output drivers and dispc are already in a single module:
> > omapdss.ko. There is omapdss-base.ko, omapdss.ko and omapdrm.ko
> > module. omapdss-base.ko contains a few helpers, omapdss.ko contains
> > dispc and all output encoders, omapdrm has the tiler code and
> > wraps some of the custom DSS APIs to DRM APIs. I think the best
> > way forward is to eliminate the custom API and use common DRM
> > APIs directly. Then merge all 3 modules into one module.
> >=20
> > In theory one could add modules for each encoder, but practically
> > this only increases complexity. DRM cannnot hotplug encoders, so
> > removing any module results in complete loss of DRM. Also during
> > probe we need to load all modules, since something might be
> > connected. So having extra modules is not really useful?
>=20
> Well my main concern here is that we should use generic
> Linux frameworks between the devices within DSS where possible.

Ack.

> I can see a single driver pile of code quickly turn into a
> spaghetti of internal calls instead.

I was only talking about generating a single module, it contains
multiple drivers. And we already have the spaghetti of internal
calls between omapdrm and omapdss. With the modules it only means,
that functions are either exported or accessed via callbacks.

> Also each devices on the DSS interconnect needs to do
> pm_runtime_get for it's struct device naturally.

Sure, but you are talking about things that are already part of a
single module (omapdss.ko). omapdss-base.ko and omapdrm.ko do not
directly access hardware.

> If you can avoid the issues above, then I have no objections
> of just having one module.

Well for now let's get Laurent's and my series forward. I think
the next step would be to get rid of omap_encoder by moving the
encoder init into the DSS output code. Technically we are already
merging omapdrm and omapdss, e.g. omap_connector is gone from
omapdrm after the series.

-- Sebastian

--6payldeld37nof6m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl5Vs0cACgkQ2O7X88g7
+pqQNQ//WtYUISiPc3FG3Q4LaljgfiXLE8KccPv2sGH0s5rjJidc7ICmrAPMic7a
B5Ve2bH86DLOKqGaTje0y5rwedBAb80d7SnbhtZAnuFwJ5R0QrPZUa7uSNAo/qDn
7Qggc2qlorvUMNIQi/uTxRCGYkoW4sP60hDRcxEFzLd1OHfjPhsNkGL7a5G+EaCp
szARh3bT7i63jZ3CqNPAU89GFkX/E4leiGlHYVXiBn4oE46aL+WvMZClleaZhcvL
2xp8xokJm/NRXTNOaMClIJvuUmr0YYmmTWviiGDFCSi0DzSzyBqJcZm1AmUnsSmM
SslC4rwscB7t9E4i4eg6F2ze+GBSlB6Y3M7SdbNoZgiIwtKMKyEr1mgTMSpIl0Di
ZjptIyoeocI24OAolaIuPipAWdN0L+A6hw+S4TgTHG0HkWwziM20f0DRddPy/4vc
wKfzGzBYJ3Z0oHwzi0q97OhA/GhvczCHMv30HibWD2ZGw/YcAHe2dOaQRrZqGCHt
mTIfHww0AtY+/YkUAq6aBwQCH7w6/rHPOReJYXpNKNpB4EYH22crRZdL4E/f5a1Q
L42kz1F038WULvDvuxrCYUrJHTwFpwmAjzUzrTjoSDpUn+HVvBXoLlz86fNs2lc4
7rypyRebwyMtshZfqZIpo0nPbFb6qCWaQcMNq7cxfhNy+mB5scE=
=gdcA
-----END PGP SIGNATURE-----

--6payldeld37nof6m--
