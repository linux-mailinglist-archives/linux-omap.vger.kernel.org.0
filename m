Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 219AC162AE6
	for <lists+linux-omap@lfdr.de>; Tue, 18 Feb 2020 17:44:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726475AbgBRQo2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 18 Feb 2020 11:44:28 -0500
Received: from foss.arm.com ([217.140.110.172]:55538 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726399AbgBRQo1 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 18 Feb 2020 11:44:27 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 80A2830E;
        Tue, 18 Feb 2020 08:44:27 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0338D3F68F;
        Tue, 18 Feb 2020 08:44:26 -0800 (PST)
Date:   Tue, 18 Feb 2020 16:44:25 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        "Arthur D ." <spinal.by@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>,
        Jarkko Nikula <jarkko.nikula@bitmer.com>
Subject: Re: [PATCH] ASoC: cpcap: Implement set_tdm_slot for voice call
 support
Message-ID: <20200218164425.GJ4232@sirena.org.uk>
References: <20200211181005.54008-1-tony@atomide.com>
 <ae2b7d9e-d05e-54ac-4f18-27cc8c4e81a0@ti.com>
 <20200212144620.GJ64767@atomide.com>
 <9a060430-5a3e-61e1-3d2c-f89819d9436f@ti.com>
 <20200217232325.GD35972@atomide.com>
 <8fc1dded-6d28-f5cd-f2f9-3a6810571119@ti.com>
 <20200218153211.GI35972@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4vpci17Ql0Nrbul2"
Content-Disposition: inline
In-Reply-To: <20200218153211.GI35972@atomide.com>
X-Cookie: No alcohol, dogs or horses.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--4vpci17Ql0Nrbul2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 18, 2020 at 07:32:11AM -0800, Tony Lindgren wrote:
> * Peter Ujfalusi <peter.ujfalusi@ti.com> [200218 15:16]:

> > > Hmm does set_sysclk called from modem codec know that cpcap codec
> > > is the clock master based on bitclock-master and set the rate
> > > for cpcap codec?

> > Neither component should call set_sysclk, set_tdm_slots. The machine
> > driver should as it is the only one who know how things are wired...

> OK, but so what's the machine driver part in this case?

The machine driver is responsible for saying how everything is glued
together, both where the wires run and any policy decisions about how
the clocking tree should be arranged or TDM used.

--4vpci17Ql0Nrbul2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5MFGgACgkQJNaLcl1U
h9BWigf9HfGg6QYgwXFW+UiKeanYp+tlVmrtYAk5vKqT+qhhZaUphuoL0k1AjEar
fhxVZBAyq6Xum6S6U8dTncKMled15zqe6RzRqXf/3MrmiX+nF/UsNhJkRbDPIZhH
8a/RIeMIaPpfB46mB0VWQIFqsHSpCIhuWxIKIKW1yqqpobWatjHG2kLHWxGZZ3k6
ajFkE6B/+1HYORI8eOtDBFM4GldmmVWM/Lfo7DadnRpCnoyte2n+dVsEidhYmxJv
biw9pG50kKZmeJth2GMVcvlBdrYM32WKJv8iZKt2NF3qJEMgMDuekj+L3Slz3Ev8
r8/i+/DRJeHwCwifLyfgg/VZjjqZAg==
=sLmb
-----END PGP SIGNATURE-----

--4vpci17Ql0Nrbul2--
