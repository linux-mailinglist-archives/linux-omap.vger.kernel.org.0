Return-Path: <linux-omap+bounces-1588-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3959178FA
	for <lists+linux-omap@lfdr.de>; Wed, 26 Jun 2024 08:31:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 098691C22EB2
	for <lists+linux-omap@lfdr.de>; Wed, 26 Jun 2024 06:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3B9C14F102;
	Wed, 26 Jun 2024 06:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Z1rejLuF"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF0414D29B
	for <linux-omap@vger.kernel.org>; Wed, 26 Jun 2024 06:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719383474; cv=none; b=nZF+prNoLbzt4k1xFU25NArbDWVXlJrScLEQ6c0TcEhxLp8XgZj2QRDvmqjIRKfjR+idUX0Me94xqQ0nST/A9ZM3L021K11ys9b9UZyxsDLBTJB2wlgi7kRhw+jEU+6zTO7q/ScQDxI8P6WP8hF1vJBjyeBXKjEGCOX4dZggKyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719383474; c=relaxed/simple;
	bh=EH4hGviqr0/bORSFiPHx3N/RT3DrX3NpA2DP9EybcUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nS9soKq5UfF5B0458ebafWoSR/uCHDPfEJNRn2MoFnqWiLjCnA6EdDaeg4YgyPQiTJ7JLi6x8ud6BWrzvkcBOp+QU3duO8KoS9as52hMHcBAQgIsvndCLLVRCz/RSIgV+I+gELDgPCy4fLpaXuqMKYg2Bi9GBNzs146Wh1v+RL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Z1rejLuF; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Q4te
	S3yscnq2tNQxZ5QUshTV02C3HQS4AqjpLU7JWNg=; b=Z1rejLuFI0lBcwB4ccm5
	LF/wy68cS8Yah2LLdBzLlTEATgf0AV5Y03gwEAxF0FC2snn5z39cXveOWTWjv6+w
	XhCO2QReNjepGXwUGVGzaUJuEiLhzg9UFgEQSUatO5QJS1KB8Cf2BrBcSXOQYvRi
	NRyu7mf6f/xVq9J7Ta3RQnR2mnKff1bVFR1GxKe5aXeNUwR8mf/C4sj7SbCEQNc0
	Cks3+H8u5WA5ISLxV/oLxFAU3iwcMTf7VGVhOcfxD0HUXoDfTctm9fBpk39zT1Vc
	2gLlVjeBc/VxiF/YZpckCQakj/KzosBpGnfOp8HAqDu7lcNe1cQooEhrmMOPgwtr
	2A==
Received: (qmail 464387 invoked from network); 26 Jun 2024 08:31:05 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Jun 2024 08:31:05 +0200
X-UD-Smtp-Session: l3s3148p1@7zSwKMUbKp0gAwDPX0AHAIitiwsdozO7
Date: Wed, 26 Jun 2024 08:31:05 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Allen Pais <allen.lkml@gmail.com>
Cc: Aubin Constans <aubin.constans@microchip.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Manuel Lauss <manuel.lauss@gmail.com>, =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Jaehoon Chung <jh80.chung@samsung.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Adrian Hunter <adrian.hunter@intel.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Alex Dubov <oakad@yahoo.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Bruce Chang <brucechang@via.com.tw>, Harald Welte <HaraldWelte@viatech.com>, 
	Pierre Ossman <pierre@ossman.eu>, Christian Loehle <christian.loehle@arm.com>, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4] mmc: Convert from tasklet to BH workqueue
Message-ID: <racc3a2kmhu5275xcb6bght5j2bbg5ujlowdbfqeiwputmygei@ckscwafglafl>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Allen Pais <allen.lkml@gmail.com>, Aubin Constans <aubin.constans@microchip.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Manuel Lauss <manuel.lauss@gmail.com>, =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Jaehoon Chung <jh80.chung@samsung.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Adrian Hunter <adrian.hunter@intel.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Alex Dubov <oakad@yahoo.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Bruce Chang <brucechang@via.com.tw>, Harald Welte <HaraldWelte@viatech.com>, 
	Pierre Ossman <pierre@ossman.eu>, Christian Loehle <christian.loehle@arm.com>, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20240625170938.2579372-1-allen.lkml@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tptttq4dprefebdu"
Content-Disposition: inline
In-Reply-To: <20240625170938.2579372-1-allen.lkml@gmail.com>


--tptttq4dprefebdu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Allen,

>    - dropped changes to renasas sdhci(dma_complete)
>    - Wolfram to send a patch for it.

It is still there.

>  drivers/mmc/host/renesas_sdhi_internal_dmac.c |  9 +--
>  drivers/mmc/host/renesas_sdhi_sys_dmac.c      |  9 +--

This...

>  drivers/mmc/host/tmio_mmc.h                   |  3 +-
>  drivers/mmc/host/tmio_mmc_core.c              |  4 +-

... and this needs to go. Dunno if you dropped other hunks accidently
instead.

Happy hacking,

   Wolfram


--tptttq4dprefebdu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZ7taQACgkQFA3kzBSg
KbaRrg//fjH0FCMt5B/Df6ZUf0c10XKmAkGrw5Wl+l+JUymfF7eb/UfAu8RyKwXS
+vZR9+SJ0JUcBckyisy/f//IIxLAc0WAYqD7Kq924rZKoOywnCbjvUcF1kWISm0v
yKAZbxcbD2205UfC3AzPBBeJDZN/GVNeLFEoSWJIGd+45aZWpHugO3cPTWq7AMQW
hZf6A/3BxExCjRGnkhN3kUNrHpBwxbJcdpU9srAMlfW9UqoPf7kcK6lfdtnzEUFK
HXo/FknV0xtgONoScw4ShzOBdwqyiYXkcrLGueWsPFjBxWBkGBE6fc9KanSv3oOB
lgfhvwvRYIqKj3Jw3xz42Z/ZXcErITqxUOSSaWx76AoN+ovPVyZGa8A4vdufCkeY
lAlKtf1aimG8Yw0odCNaPobazX7zIc5EW6nVIZKFKnnQBrqH84ZNIChd39nbKlUQ
/jFCuspSs5Hg0dJezg3QyXOEfDq2aQnjx4gpUKrEYfPiwQPaIe//JzzDIeNbU7jI
WbuejhDjN36I1RCjCSskc6TNwh/mqpjRhLhhM79Tkky9et2x4J0gsxd+wAOALkaA
XI2NjNim3L6JgUTX+aaTAWj2hGl8FBW6or1e+ykkTL896PSncNTrgzjnNL6nZYv9
feHV2wuiMMMB8wBN91/d48hAC09W/4hd4pQabxhGKoFpccRok24=
=e/ub
-----END PGP SIGNATURE-----

--tptttq4dprefebdu--

