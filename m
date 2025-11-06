Return-Path: <linux-omap+bounces-4871-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4736FC3CD7A
	for <lists+linux-omap@lfdr.de>; Thu, 06 Nov 2025 18:29:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 91C0C4EC888
	for <lists+linux-omap@lfdr.de>; Thu,  6 Nov 2025 17:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C82D334F27F;
	Thu,  6 Nov 2025 17:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EgU6LJL0"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5966A34F248;
	Thu,  6 Nov 2025 17:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762449958; cv=none; b=dwUzK/zeksmiXvGYZyQZLg0J1rERKK5Gp9SS9Jy6SCdkhcaLv3/QXPGu6zypQduvQVdLoXToxQUsPgwZHxI7oqobfrM0RstLB8aQ1Rt7ioZyUBmDCBNlCuQsvtrvG8ElLr4k7kwbtnndtYgFAuITk8PaQh6slUL7qL5miSvvVC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762449958; c=relaxed/simple;
	bh=ScwVdgvdng90WoLSpbFsZHNRiDkbdTNyqhdv18rYXuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KvxdYJaQsTeu2nUqTT79PLxmBdDD6MP7oBmjMTtXOu/3W7tuKh2ZXBsZuEC8f/AR3VqrtOMyM1Q/ps04c1BJiQwujTGxl85s2CgrwXEG2ufVTbV6LMilYdC6FhTvxxqj/cOuLFKCHoEcsU5vLBaI+Ezxr1CZr6Cf23vYpK/eSh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EgU6LJL0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73FFDC4CEFB;
	Thu,  6 Nov 2025 17:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762449957;
	bh=ScwVdgvdng90WoLSpbFsZHNRiDkbdTNyqhdv18rYXuI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EgU6LJL0G2zSlzLPyZ3ReiCQaQvhcXD5AmFPX04imUz7VfL/5IC2ZJLmXHPAZdmp3
	 gsVWUm8t28MMbb0QwKq1SXLEbM3MtLa/s4fLAnmJMWRjLYHXc+Hggp14crp49XD7uO
	 nkYl6mSNF4IbhJhrB5XaqvYlCWK640HYgrP6F0GZcjU+gEqz82y95AYuxA8JT4qVjt
	 kMTGYc2FST9p5Xtq3VRGUh+ZZeYV46Qp0unBEgPd76ByWsB3ofS6h6P6XO0z73MMKm
	 MJnxU3gcg4I0HiJXe+oZ5KzGeugZvHQwjuiNxyTcT3xsayvVkRl79JZ9CQfaRvcBUr
	 JnFu6RZaH3Wqw==
Date: Thu, 6 Nov 2025 17:25:53 +0000
From: Conor Dooley <conor@kernel.org>
To: akemnade@kernel.org
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andreas Kemnade <andreas@kemnade.info>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Tony Lindgren <tony@atomide.com>, Kevin Hilman <khilman@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: mfd: twl: enable power button also
 for twl603x
Message-ID: <20251106-smartly-backfield-e3aee602c162@spud>
References: <20251106-twl6030-button-v4-0-fdf1aa6e1e9a@kernel.org>
 <20251106-twl6030-button-v4-1-fdf1aa6e1e9a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uECYSKdxnXD7ywxL"
Content-Disposition: inline
In-Reply-To: <20251106-twl6030-button-v4-1-fdf1aa6e1e9a@kernel.org>


--uECYSKdxnXD7ywxL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--uECYSKdxnXD7ywxL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQzaIAAKCRB4tDGHoIJi
0svcAQC/DuPcwBfhvpbkg+X4cYMYLcgFbzJYFdDoPCPVQaAQSAD/U/66saScGfgZ
DoU9xtpqPUf0AVp8I5ufIgeyWQDSjgs=
=yrc1
-----END PGP SIGNATURE-----

--uECYSKdxnXD7ywxL--

