Return-Path: <linux-omap+bounces-5086-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B04C972C2
	for <lists+linux-omap@lfdr.de>; Mon, 01 Dec 2025 13:04:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6527B4E18C3
	for <lists+linux-omap@lfdr.de>; Mon,  1 Dec 2025 12:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A87B93090D5;
	Mon,  1 Dec 2025 12:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f2Te497I"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FD4308F39;
	Mon,  1 Dec 2025 12:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764590639; cv=none; b=LRjHAhXTBViihaFeFxNUj5lbK8tIMzuTL+12CTrt7k4BaxLJLzhCx+VopiuL8PQ/EwVhxR+4uYGDLbl/Lt0dFrFfy2dQxt0K+N/ToTTqukf/sz7/M5WewWhtAUfYk+dajKVE0JSZxrKIjW51Qy71dxl72+cHKArEoc30r8hcnRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764590639; c=relaxed/simple;
	bh=HsnxspOP0ytJTgvmrETEMOyHpUyWsOGGK66P/iykhuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DMj2YJLv8KucG+p7hS3WLzreaplJ/AkqGsaoWDE8pKWuB22PmOYpuabYl8OrHWohywvASyqqccRCp1PGqS8bTH+13uFe17oCh3SJgPd7v8hoLqZ0Gwlj7FzMvN+fXOGDNH6UHWa1OGIUgdoGcMbg7vthVLgn8aDtFEQqTEnoHFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f2Te497I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2218CC4CEF1;
	Mon,  1 Dec 2025 12:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764590638;
	bh=HsnxspOP0ytJTgvmrETEMOyHpUyWsOGGK66P/iykhuE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f2Te497ID6w+uIqP9p3fwxKaPIfANNSf8PQPccECG4jw/DxNZS6c+MgjtJdfNmKzy
	 d1FcsgjCmE3FJLe439Y9PjH6/G5eSd93sCsWaG009xLnZ9EcGPP5d/9Rxp5zxagVtO
	 Mp0SZ3fYV8qxFBEmrvy4BhGDUcRaKqYZp48K+Hh9B5tVYS3yHAx4IubxOU4aRIHzC7
	 TwruhXwB5JigcsqiKRKqYZvI4TQmHNNNpCdo97/BEOisr22i/5w6s+7z0l8RP7Lw2H
	 +ELi8FAnIAn/iuUjunvKmbKO3EMfZOVC2nJiPlX+kZK/qOo9S5Txy4dbk4tMWwAU6h
	 KR+a5vFQBmoXA==
Date: Mon, 1 Dec 2025 12:03:45 +0000
From: Mark Brown <broonie@kernel.org>
To: Richard Weinberger <richard@nod.at>
Cc: linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org, arnd@arndb.de, lee@kernel.org,
	dakr@kernel.org, rafael@kernel.org, gregkh@linuxfoundation.org,
	tony@atomide.com, rogerq@kernel.org, khilman@baylibre.com,
	andreas@kemnade.info, aaro.koskinen@iki.fi, conor+dt@kernel.org,
	krzk+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH 2/4] regmap: Allow disabling debugfs via regmap_config
Message-ID: <7e44c326-1b5d-46fc-a5b2-8845ebbb32d5@sirena.org.uk>
References: <20251129142042.344359-1-richard@nod.at>
 <20251129142042.344359-3-richard@nod.at>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FSPOjhEldnzgd6PE"
Content-Disposition: inline
In-Reply-To: <20251129142042.344359-3-richard@nod.at>
X-Cookie: Mene, mene, tekel, upharsen.


--FSPOjhEldnzgd6PE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Nov 29, 2025 at 03:20:40PM +0100, Richard Weinberger wrote:
> Regmap already disables register access via debugfs as soon as a register
> map is used without taking locks.
> Go a step further and allow disabling debugfs via regmap_config such that
> device drivers can decide on their own whether uncontrolled register access
> via debugfs is harmful.

What's the use case for this?  Drivers can already mark registers as
unreadable and precious to stop spurious reads.

--FSPOjhEldnzgd6PE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkthCAACgkQJNaLcl1U
h9A/qQf/QMnnBvIv3N7Hn8beIIL1Dxq/r/nnN377G5ybwMvQpVVf9ilnNjzVw3aH
OWJWek4Bw8hLCt3Asa2bTsVL8FqcMEJUvCRM7gamVk/cB+bjMy2YKINQRSPZfZ2a
WjB0UfpMYkUysrYWmVsyPzkhXIIuTqLn7mHl7OkiVpfsNgbb4rpjPOwgFBgPe/9h
v0afunPnk7EeyNPLoKf1R4W03ptkrqOa8ysufF7YWXWpobRLY53X9wKRXeQMpmBD
lRVg3tFBju9n4JMpw6rpxmq9xLvmWzDNw4x8ZyVAAvml1Y7rS8IK3eqvQEKqOP3u
fh2Cst8DTPWu1F7O+ED8EK1IDP7gxA==
=ey46
-----END PGP SIGNATURE-----

--FSPOjhEldnzgd6PE--

