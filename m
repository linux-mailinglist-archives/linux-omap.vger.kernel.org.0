Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 936B915D7A5
	for <lists+linux-omap@lfdr.de>; Fri, 14 Feb 2020 13:49:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728557AbgBNMtX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 14 Feb 2020 07:49:23 -0500
Received: from foss.arm.com ([217.140.110.172]:60950 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728062AbgBNMtX (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 14 Feb 2020 07:49:23 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9BF1E1FB;
        Fri, 14 Feb 2020 04:49:22 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1E29E3F68F;
        Fri, 14 Feb 2020 04:49:21 -0800 (PST)
Date:   Fri, 14 Feb 2020 12:49:20 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        "Arthur D ." <spinal.by@gmail.com>,
        Jarkko Nikula <jarkko.nikula@bitmer.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH] ASoC: ti: Allocate dais dynamically for TDM and audio
 graph card
Message-ID: <20200214124920.GH4827@sirena.org.uk>
References: <20200211171645.41990-1-tony@atomide.com>
 <cd46c6ec-80e3-332f-4922-e58a3acbfc61@ti.com>
 <20200212143543.GI64767@atomide.com>
 <346dfd2b-23f8-87e0-6f45-27a5099b1066@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bpVaumkpfGNUagdU"
Content-Disposition: inline
In-Reply-To: <346dfd2b-23f8-87e0-6f45-27a5099b1066@ti.com>
X-Cookie: Shipping not included.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--bpVaumkpfGNUagdU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 14, 2020 at 02:41:30PM +0200, Peter Ujfalusi wrote:
> On 12/02/2020 16.35, Tony Lindgren wrote:

> > Oops, that's not good. So should we just keep the old naming if there's
> > only one endpoint?

> That's an option, yes, if we really need extra dummy McBSP DAIs at all,
> again, let's hear from Morimoto-san or Mark.

We really shouldn't need dummy DAIs at all I think, if we do it feels
like there's a problem.  It's quite possible that there is actually a
problem here though...

--bpVaumkpfGNUagdU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5Gl08ACgkQJNaLcl1U
h9AGSgf/WC1rD+oEYoImv2NX+F1kZLeDZ1n+50cMMhVxzUM8Wc/oD6BZAF7BSo5I
Pd0iBQQd9PStwHOvnWEdTzohUmiK/7iRVPKYYYpv47/9g4v4tT7BDe7tNRNolBGR
xYV/sJiD+U0DlpSUOYuwd4xxQVLAcEXUp7SSjvHAoYEiJlZ055K1opwl3avKwYR0
7d2vQr0nQrc9wD49QxxD9fGMhv/o+sVx6rpkayuiOpcE3QRxSJIgxnVdPwlKSjxU
YIe91JG0GI4BGwWy3fi21D4tiMNLIPrwubI91PuPhBFaUkJVSW+8njfpLK+SrHrJ
uaRh/PD/nMhNE7bNAr7JbguqB70QRA==
=s0ru
-----END PGP SIGNATURE-----

--bpVaumkpfGNUagdU--
