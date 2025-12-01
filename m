Return-Path: <linux-omap+bounces-5087-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B65D1C97338
	for <lists+linux-omap@lfdr.de>; Mon, 01 Dec 2025 13:19:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 19BA84E05F7
	for <lists+linux-omap@lfdr.de>; Mon,  1 Dec 2025 12:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE87D30BF4E;
	Mon,  1 Dec 2025 12:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kEQ25sfC"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8070330BBA0;
	Mon,  1 Dec 2025 12:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764591557; cv=none; b=jNVfxCridJq1T7fxhvtZjLrttGDw7nphCqxpYp8Oa8IQvjBp51Qgy0ll1pKAkrUomK7mt3NmZy/Hl9rJ5925jgkidrhL5egacD3nmhDsXNk1BM1/3oYoEJgLf0oNNtr5N9HckY0FXFnHjm8LIpgD0VexwCqpmkz7bZQtOOMxa6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764591557; c=relaxed/simple;
	bh=PRYjFV8SHETTnMKwmzUG2vc8g7wmpPzgBzE8JIuEUA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FIAK8CKm8HtloXamvzScjkgU64Udbn7j+bBrrynq9tfJmkR9zliiSzFWT9hH9jLHxXzrbsFQ9X7ycyK9EBJgUONx0Et00d3+pxHReNrCxFr71prjC58OwHhcttqMuQtN7DnmjSVcFbANmNsCYInwPhyazHnmPtwnLiJmEsawywg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kEQ25sfC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B6CCC4CEF1;
	Mon,  1 Dec 2025 12:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764591557;
	bh=PRYjFV8SHETTnMKwmzUG2vc8g7wmpPzgBzE8JIuEUA0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kEQ25sfCzW5cu4fv661BYqLgdnJiE5tAJOlLDJ78I7PY0ovKCW0QUNWlp3c4SsMnw
	 ZwhoZqbA8Mk/wU3rR1IrmxYgcpQlOhG8yKr2DzXh0I73gFgeraErEv9yeXkhKLSSno
	 qniImL74mlL8ORGbgR+fjXNrMknlFRrwZ2YP6EYFF4qKHX4n6qe5oTSKPkXgNF64u5
	 hG5ljdKkp/S+jIbwtwtHAuTyAfg2nOmW7Svz0uRj92yCUN1eq5pUyUWiQB93T+cHBb
	 XjGWF56izj15HwK7lnIp1BLo8i6nI/UTDuuYNiW+bqbN1yqVXGEcqpLWbXIVpS6iYR
	 SPVlxrNrYQT3w==
Date: Mon, 1 Dec 2025 12:19:10 +0000
From: Mark Brown <broonie@kernel.org>
To: Richard Weinberger <richard@nod.at>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-omap <linux-omap@vger.kernel.org>,
	devicetree <devicetree@vger.kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
	dakr <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	tony <tony@atomide.com>, rogerq <rogerq@kernel.org>,
	khilman <khilman@baylibre.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	aaro koskinen <aaro.koskinen@iki.fi>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, robh <robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: Document new common property:
 has-inaccessible-regs
Message-ID: <bcfc82fd-3aad-47fa-8477-abb5245758f0@sirena.org.uk>
References: <20251129142042.344359-1-richard@nod.at>
 <20251129142042.344359-2-richard@nod.at>
 <7d9fcf24-5ad5-48cf-b36d-83025976f3aa@kernel.org>
 <771947541.4509.1764430418744.JavaMail.zimbra@nod.at>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9l46fMSoVqi+A7ZX"
Content-Disposition: inline
In-Reply-To: <771947541.4509.1764430418744.JavaMail.zimbra@nod.at>
X-Cookie: Mene, mene, tekel, upharsen.


--9l46fMSoVqi+A7ZX
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 29, 2025 at 04:33:38PM +0100, Richard Weinberger wrote:
> ----- Urspr=FCngliche Mail -----

> > Binding cannot help here at all.

> The driver does not expose them via sysfs, it's the regmap framework via =
debugfs.

regmap exposes the registers that the driver told it about, it won't
expose anything without the driver telling it about the register.

--9l46fMSoVqi+A7ZX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkth74ACgkQJNaLcl1U
h9D+Pgf+NQs4lscEQn+729/0J/zDdGKmw9/8pO8X5b2uxFwp1+BjpeS157r6mfQ7
ZBph1aqD/gJAcAAkLLB+w2LLtVKtABW18mSgU2/UR6KhVI7TmcO3H7A4/m3VMVvr
j1hwZhcHWFfkg3LyAbl56JKVGpE3OjctHxQXRSwwfH5WVcq4bdLUQRfsxX5khw2P
iM5uNeYVCgGZrR6s/mOJcKTk5L40CqbLKHQu8v4OruUGcaG+E8QYUWvfoLAfwA9K
/jOt7nm36ZpDX+t5iadyWKcDdR7ELuK/c0akwDMOI5RTi8/GxfqWOAzSNPKeTP/+
obkaKes5EAAoM95UV99YaNTGK1Z68w==
=4KBU
-----END PGP SIGNATURE-----

--9l46fMSoVqi+A7ZX--

