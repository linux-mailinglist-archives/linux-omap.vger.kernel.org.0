Return-Path: <linux-omap+bounces-2993-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC271A02601
	for <lists+linux-omap@lfdr.de>; Mon,  6 Jan 2025 13:52:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 063AE3A585E
	for <lists+linux-omap@lfdr.de>; Mon,  6 Jan 2025 12:51:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D98C1DA109;
	Mon,  6 Jan 2025 12:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mUrR1IPa"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D07B8F6D;
	Mon,  6 Jan 2025 12:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736167751; cv=none; b=TGl+2zJ9WHSQkeTHwr3L3akI+gDxWTGY3rizCfbvQGpOMzUvXg4/Gs5U6GY1E5gAzj8GkQ+6YYqPredddT11cDmhbezBTIFJmLrFjactJCcL//y+AZMiDPEc6I1OkoImQTgGcywQHywI4tCKZHo3zWz8qPfLVmbceT5LeOk97oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736167751; c=relaxed/simple;
	bh=L/DmcaY6fYi9UmqR02I9I25wq9RHQzwUz9qs+0Bb64Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CWTlFSbg/r1wuThQlkW+aMBnzsTHolkF4cMQv9KPdFO5yIUWnDUUpBIcqd6gB47p9KX/oMXJmx/K5l4p1c8Ct83CB4v05EGaTu/VsJ2w4tu9/XXTirj/xsxFSE0mVp4hK03E1jJOuEcJ6bXDwLavYHC6fYtMVHb/f3NgR3bfB1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mUrR1IPa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EC0DC4CED2;
	Mon,  6 Jan 2025 12:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736167750;
	bh=L/DmcaY6fYi9UmqR02I9I25wq9RHQzwUz9qs+0Bb64Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mUrR1IPaY3QK09AhdUhGMX8BKGFpdQLOuKDIandMJRKfeXwAQPIwXro7L3QSobMEu
	 KX80zMdDw9wQc+MdtvidqaPKkCt807hGkvhDYabb+iLT+cAo8aVsXy+7WZ0DKnQkt2
	 446kO42f3hLd8Tk+Z3HB3KYojbXPW2tNcdSaTXhOnwKBdVBkcauVzvspzyro1pe6Tb
	 ien027DHaxZ3grFBNAZTpWcCo4aJvPMJ3DetPryYuOaeoKqHr+Zo6mmFt9wmnCTI9M
	 WZ76wPia+u61S+XkB3nLmKPajGrFsQCbaE8GHWnnYMisPeMBbF+TnJYW4FUkf0FhnG
	 FB4DDU71DX5QQ==
Date: Mon, 6 Jan 2025 12:49:06 +0000
From: Mark Brown <broonie@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-usb@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: omap: Use devm_regulator_get_optional()
Message-ID: <c6925d52-d662-42b3-8ca6-f238c77736a4@sirena.org.uk>
References: <20241231164456.262581-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fmIUCIpewOZyBBpT"
Content-Disposition: inline
In-Reply-To: <20241231164456.262581-1-robh@kernel.org>
X-Cookie: Do not pick the flowers.


--fmIUCIpewOZyBBpT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 31, 2024 at 10:44:56AM -0600, Rob Herring (Arm) wrote:
> The 'vbus-supply' regulator is optional, so use
> devm_regulator_get_optional() instead of checking for property presence
> first.

Is it actually optional?  The name suggests it's likely to be
required...

--fmIUCIpewOZyBBpT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmd70UEACgkQJNaLcl1U
h9D+Owf+N8G6o2AjREzuYioYppfaN7F6nLhmZbtrbSqov24LoaSSFrO4LaoJNnOP
rEtz5ct7hBj/c8dvMGI7IsLr1oiU1Mk3WpCmoc3WImNKrC5P3lP0u+wxz7WBkjsa
9KEIg9j0hT2JoWnQOt8rhGEvUopEYPrkMRrDNjtGPe0Vi63BGTmQFZ6Q+bZ3fUsA
Hv0aRWbkmBYU1kdNnMbM1p5z6AOpra3EG6yDthRZWyF/gYZKh4KI9jQWFLmcJoak
0Fscck5k0hPJuShSOSIJM8lCAjrd9xAgNXVN0gahnXXH4ce39BAjrrdTfyEU6Vhm
BKqJ7mocdBTWVnXs02Bh8UrNsz+Xyg==
=oUfN
-----END PGP SIGNATURE-----

--fmIUCIpewOZyBBpT--

