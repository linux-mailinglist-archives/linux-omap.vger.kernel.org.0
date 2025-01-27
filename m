Return-Path: <linux-omap+bounces-3232-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B7639A1D6E8
	for <lists+linux-omap@lfdr.de>; Mon, 27 Jan 2025 14:35:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A39A165665
	for <lists+linux-omap@lfdr.de>; Mon, 27 Jan 2025 13:34:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7D36200110;
	Mon, 27 Jan 2025 13:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gyEJ7sXU"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A17F1FFC63;
	Mon, 27 Jan 2025 13:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737984866; cv=none; b=XVen3gSQwmPuz7IGve1pYMhEBhNj2qKPTxmLE1PYahwLL9qjzIwfVmRU1W/C18P39r7dcg0XXIJc9CB6seOYp2N3hPooXlxKRjs3N8qdn0wJANo2Pted7Roz9ZJfCKOPweZIml6KN1boVEQqqozLwKPUfSWHLbQVf9aqkVh4qQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737984866; c=relaxed/simple;
	bh=8GFFgNVaClpSXODaY2TeaAq6suTF74nUb8dYDHUkUSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HvTXKNV3Wjx7WYDp9jQ7iwv2JAee2ogQUkam7ijpQUA6KO4xP/xnu4uBvAlGevC5QEagk/4fJrPLglt/rcWDQZ/pHC3BQWoPpNOqAotkoyPrqGqA2g7RpL0nIUSsERLAtKP2Qdsb1kn2o9J4lfUF9Kssp8lOpQaDRez5F0ktmXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gyEJ7sXU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ED36C4CED2;
	Mon, 27 Jan 2025 13:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737984866;
	bh=8GFFgNVaClpSXODaY2TeaAq6suTF74nUb8dYDHUkUSE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gyEJ7sXUckBx8Y6Z5hIaZt67gi8veOibwPUFljmsKcUM5TRDWt3DH43WeFdGsKDp1
	 G7dsQKKhbqHmto/+4bPrM1vL6l5hK90ht1Y/8oKoLrWZfh/8KFJ2q/CRZVIcceiv3c
	 ziEd8NeIko+DOhOY8I94MDI6cLVaNrZN/PD59zL48OOVPwj7TwDaHnXD6Zp9+qfUJ1
	 kKiRizH8qfbUx/hUc+ds6Enm7l9gNAhEgLYoCurTol2jaPC/AfDH7OvO0wh3EouJtK
	 GL3ZJkAHbEjZpDMSo50vBXOGLc0p1HtB+yENozkEieADVovs577B65sawVeIyGdkeG
	 WZ1NVQXRNoQhw==
Date: Mon, 27 Jan 2025 13:34:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 3/5] dt-bindings: mfd: motorola-cpcap: Document
 audio-codec interrupts
Message-ID: <026c4c9c-bab6-4a28-ad3a-77b9daf5eb72@sirena.org.uk>
References: <20250122164129.807247-1-ivo.g.dimitrov.75@gmail.com>
 <20250122164129.807247-4-ivo.g.dimitrov.75@gmail.com>
 <a60f468e-857a-4f4c-b3d9-3ee8faf6602a@sirena.org.uk>
 <20250127132725.GC1440743@google.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bNORB6210QAchGdN"
Content-Disposition: inline
In-Reply-To: <20250127132725.GC1440743@google.com>
X-Cookie: Printed on recycled paper.


--bNORB6210QAchGdN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 27, 2025 at 01:27:25PM +0000, Lee Jones wrote:
> On Thu, 23 Jan 2025, Mark Brown wrote:

> > On Wed, Jan 22, 2025 at 06:41:27PM +0200, Ivaylo Dimitrov wrote:
> > > Add DT binding for the audio-codec headset detection interrupts.

> > Lee, would it be OK to merge this via ASoC?

> I'm not sure why you would want to and it may make subsequent changes
> more challenging to merge, but if you really want to ...

It's the binding documentation for the ASoC change in the final patch.

--bNORB6210QAchGdN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeXi1wACgkQJNaLcl1U
h9Cpvwf+OldwpK3Lu+wk4SHda0N8nLT4no7CICKdvX0vA7bFN54hw4GlboGkd8xf
RvTjBfJZQ9vOx9ohlN5e0N/2DiV/U6xDkD7zpBUBF+5nKDShg0pTgRFhg3iBhk9P
oye/FOlYRtpN0WI+yhqtoO94ByiXoPMb3wNU/rcctf6dX7QHRjnHl/AhLlUG820M
mMhaY9PX3Lk/FHr74Syj5K0MBI98eQ1kiHQtY9eCRG1dCQDdjLFT9IiIxhrOTNp3
rjWGlMGxl2It4gh2mOpcHngF+kMVT6QXYFxjmdm0TV4Uy0SMnFBv6mfFzPw6X1uN
Cj0R7iM6P2m43NJJiGjkU0YxXuli9w==
=R03O
-----END PGP SIGNATURE-----

--bNORB6210QAchGdN--

