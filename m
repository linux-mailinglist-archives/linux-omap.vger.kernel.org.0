Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 104E1164C68
	for <lists+linux-omap@lfdr.de>; Wed, 19 Feb 2020 18:46:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726643AbgBSRqD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 19 Feb 2020 12:46:03 -0500
Received: from foss.arm.com ([217.140.110.172]:53604 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726638AbgBSRqD (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 19 Feb 2020 12:46:03 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B19E131B;
        Wed, 19 Feb 2020 09:46:02 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 35EC33F703;
        Wed, 19 Feb 2020 09:46:02 -0800 (PST)
Date:   Wed, 19 Feb 2020 17:46:00 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Sebastian Reichel <sebastian.reichel@collabora.com>,
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
Message-ID: <20200219174600.GH4488@sirena.org.uk>
References: <20200211181005.54008-1-tony@atomide.com>
 <ae2b7d9e-d05e-54ac-4f18-27cc8c4e81a0@ti.com>
 <20200212144620.GJ64767@atomide.com>
 <9a060430-5a3e-61e1-3d2c-f89819d9436f@ti.com>
 <20200217232325.GD35972@atomide.com>
 <8fc1dded-6d28-f5cd-f2f9-3a6810571119@ti.com>
 <20200218153211.GI35972@atomide.com>
 <20200218170628.r47xc3yydg6xx2yh@earth.universe>
 <20200218174258.GK4232@sirena.org.uk>
 <20200219173902.GA37466@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+Z7/5fzWRHDJ0o7Q"
Content-Disposition: inline
In-Reply-To: <20200219173902.GA37466@atomide.com>
X-Cookie: FORTH IF HONK THEN
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--+Z7/5fzWRHDJ0o7Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 19, 2020 at 09:39:02AM -0800, Tony Lindgren wrote:
> * Mark Brown <broonie@kernel.org> [200218 17:43]:

> > you to address for system enablement.  OTOH if you manage to get one of
> > the generic cards working well that'd be excellent!

> Well to me it seems that we just already have all the data needed with
> the graph binding and snd-soc-audio-graph-card + codec2codec support.

> I don't think we have cases where the cpcap codec is not the master,
> so as long as the cpcap codec knows what's going on then there
> may not be a need for machine driver.

> I guess the the bluetooth to modem path is the one to check to see
> what provides the clocks..

Usually in telephony cases it's the modem that's the clock master FWIW.

--+Z7/5fzWRHDJ0o7Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5NdFcACgkQJNaLcl1U
h9BHgQf/WmvIam0UASnfG1o54i1CWeWsvsmiCK7/+FWgq77+E+b2l7WNCZLeu/4r
g7DR1qjj+5Ogl5aUXofhX4nOIBziyJTk1uEjy4MNFr5fIzexu4zaV2hNPuzcJ8YF
21g7bpU3IrsVnaldU5zh4e6olPpVwfBsB7UboCb2fWidPqe3d525T2L+pj3l1HfZ
9TEr58a2UEpQh9f+33kJKhmMmNhwh1ycKm2A9bRrRGfNOneX3mw0CfDGby6QpAfU
F80CcEmoDlHYzrLcE7osxHLLWdIR+f2iMi1LXR4QfyM4oz7J8f2imPHKOZDXPqjB
Z43rTMLpES32bQjaMY/bDBxDi36EdQ==
=fNVj
-----END PGP SIGNATURE-----

--+Z7/5fzWRHDJ0o7Q--
