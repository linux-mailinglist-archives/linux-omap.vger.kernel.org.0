Return-Path: <linux-omap+bounces-1494-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F918FF42E
	for <lists+linux-omap@lfdr.de>; Thu,  6 Jun 2024 20:02:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 557DF1C25ECD
	for <lists+linux-omap@lfdr.de>; Thu,  6 Jun 2024 18:02:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D62E81991D3;
	Thu,  6 Jun 2024 18:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UIpCVqph"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719952110E;
	Thu,  6 Jun 2024 18:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717696915; cv=none; b=tNITr5Ogr49lrmmkGjeRctutbCj7CTaWq8e8aaGjacITdKydY2srkEXVn/m+qSNiNOJTxSN7GIEXmwuldbBiU6fNVsQf6ODsP8gnP0Hu5AnWP0rGAmVxbY965VQS1Zpe/uZfZGW3GOzZ09XG0AxW0bWjb/NNMiFjDYCRK7QnKkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717696915; c=relaxed/simple;
	bh=rLHR1mdRF8Q7kTfSQyHdMtwG40Yu6O42W8bLyqZDcxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R2vQzPC3ueP771WEFZNlSeOtAFF6Nm0mffrApzgDZHkhimSBWE5nm6HiNa14GbsAhyTNiVsQn0Zb5SRcEhflpONVJxCXY9av0ZtL5plXAnFVjA3JjmZvTjHdDiebFx9twenrVNtR6GabkSSIoGVXgrZCaUH4mHbr3jysX8nLn4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UIpCVqph; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7F93C2BD10;
	Thu,  6 Jun 2024 18:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717696915;
	bh=rLHR1mdRF8Q7kTfSQyHdMtwG40Yu6O42W8bLyqZDcxI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UIpCVqphcYjSEj+73lmEvNqoYnS/NNAicw0VJZPiKYDgV82T0Pbn+StfgQkcLIDOf
	 itAC+fMT6O4Tj8YbFgI65olho7G6t9v0pFikZkNybUhJrznUYAIpNlo5+ghpWHN0Ed
	 erwy4JHmQb2wY904gfPFd5F//tsoESm5pBhpbZ6tJTsi/jsSHs6uSCsiHQd5gAnuTt
	 UPu332a1kyODyFB2YiXBR32IjZja5nTHf8SUEsxHDkdwx8SMph64RAkPNdBA3/4JOn
	 38xYriHsoWTnvViR34Z+5gCm9a4Eeg1B/84EpEl98Vgnx0IcJOSmVzqP3LT+nfM0nB
	 T1nmu3iQLBSig==
Date: Thu, 6 Jun 2024 19:01:49 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@gmail.com>
Cc: Primoz Fiser <primoz.fiser@norik.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: Re: [PATCH] ASoC: ti: omap-hdmi: Fix too long driver name
Message-ID: <71d7754e-f72c-4a04-b03e-a0ee0e24c9e0@sirena.org.uk>
References: <20240606070645.3519459-1-primoz.fiser@norik.com>
 <dac7fba4-c7e3-4be9-8072-625d723e6cf5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r1jMZGoX0bjt5dhf"
Content-Disposition: inline
In-Reply-To: <dac7fba4-c7e3-4be9-8072-625d723e6cf5@gmail.com>
X-Cookie: Simulated picture.


--r1jMZGoX0bjt5dhf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 06, 2024 at 09:00:47PM +0300, P=E9ter Ujfalusi wrote:
> On 6/6/24 10:06 AM, Primoz Fiser wrote:

> > -	card->name =3D devm_kasprintf(dev, GFP_KERNEL,
> > -				    "HDMI %s", dev_name(ad->dssdev));
> > -	if (!card->name)
> > -		return -ENOMEM;
> > -
> > +	card->name =3D DRV_NAME;

> I think it would be better to name is simply "HDMI" instead

That does seem a bit more user friendly.

--r1jMZGoX0bjt5dhf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZh+YwACgkQJNaLcl1U
h9DkCAf+JXtwlhN6eFOr73JPv20Yks83kzwet2NPTrWQDbj97XD+8BI81dHoMB9+
gR3bo5kQMZ3x9SlEzXM20YpMhdZP5YCduTPywx3AHXflTkdxE52dDVpsSy8O9THq
uZzS/OMFKUmX+0YNa14dc2W9dFAsH52PT8c5G5sejFRVhNzj3/7cZCEj8RoeGlHc
AeI9toTJD2SqJlICBEibE4//YPE1A0YB92zAznfE4dOJUeuSVcc3aBP0II2u90K3
xPUY6j6y6fb2rhzjLgDyo7uOjgCiDbzOfypL1tjbuLsX1ekrZSXpnBGuEx8Pi1pn
Dhg7QZQfMWDw0C8KZScwu6XN//zwWg==
=OOLJ
-----END PGP SIGNATURE-----

--r1jMZGoX0bjt5dhf--

