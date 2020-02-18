Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 070BE162D35
	for <lists+linux-omap@lfdr.de>; Tue, 18 Feb 2020 18:43:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbgBRRnB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 18 Feb 2020 12:43:01 -0500
Received: from foss.arm.com ([217.140.110.172]:57216 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726403AbgBRRnA (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 18 Feb 2020 12:43:00 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 74FC431B;
        Tue, 18 Feb 2020 09:43:00 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC5F53F703;
        Tue, 18 Feb 2020 09:42:59 -0800 (PST)
Date:   Tue, 18 Feb 2020 17:42:58 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        "Arthur D ." <spinal.by@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Jarkko Nikula <jarkko.nikula@bitmer.com>
Subject: Re: [PATCH] ASoC: cpcap: Implement set_tdm_slot for voice call
 support
Message-ID: <20200218174258.GK4232@sirena.org.uk>
References: <20200211181005.54008-1-tony@atomide.com>
 <ae2b7d9e-d05e-54ac-4f18-27cc8c4e81a0@ti.com>
 <20200212144620.GJ64767@atomide.com>
 <9a060430-5a3e-61e1-3d2c-f89819d9436f@ti.com>
 <20200217232325.GD35972@atomide.com>
 <8fc1dded-6d28-f5cd-f2f9-3a6810571119@ti.com>
 <20200218153211.GI35972@atomide.com>
 <20200218170628.r47xc3yydg6xx2yh@earth.universe>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="opg8F0UgoHELSI+9"
Content-Disposition: inline
In-Reply-To: <20200218170628.r47xc3yydg6xx2yh@earth.universe>
X-Cookie: No alcohol, dogs or horses.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--opg8F0UgoHELSI+9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 18, 2020 at 06:06:28PM +0100, Sebastian Reichel wrote:

> simple-graph-card is the current machine driver. We might have to
> introduce a Droid 4 specific driver instead. I used simple(-graph)-card
> instead of introducing a new driver, since the setup was simple enough
> without modem and bluetooth. The simple card was perfect to test the CPCAP
> codec driver. The TDM things might be complex enough to create
> a new machine driver (as I mentioned in the original patchset
> adding CPCAP codec support).

I tend to agree here, phones are generally one of the most complicated
classes of system for clocking and interconnects and the CODECs they use
often the most complex too so they're really stretching the generic
cards.  It'd be nice to be able to handle things with generic cards but
it's likely you'll run into issues that it'd be unreasonable to force
you to address for system enablement.  OTOH if you manage to get one of
the generic cards working well that'd be excellent!

--opg8F0UgoHELSI+9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5MIiEACgkQJNaLcl1U
h9D6Wgf+KODCNr6XeqdBCSDh3Rzl0aYLJntwETttXe5OX9SV2VAbUhheJKFsmhmK
UN8bsVZNmhwC8qIAXznxkbwp+9BPnM72lmIuniA8KqRiNHGdMwHUYRqw4g9c53qX
p2U5E9eZ35ilwDKYpb7SXn4r9pL02zAN7LqfcNs+v4CQ0LuGN/1xxsVKz7MlZ+t1
J8iizIybXeDxYCIWEHOSQn9+Hq0kdzqziJKLnApzilqRqtB51QWUK/vU1nPtQBfd
WPaGdaIa3qIh+R2PuhThKlJnQPaD/RRyM6TTApWjYrq8OfvfSvAC7f9r3P5yo3K3
lT8+OH3w5S8ZHUAE2G1tfHCaNIRiuw==
=tBdt
-----END PGP SIGNATURE-----

--opg8F0UgoHELSI+9--
