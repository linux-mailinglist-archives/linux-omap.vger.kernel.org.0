Return-Path: <linux-omap+bounces-4218-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B64B25AB6
	for <lists+linux-omap@lfdr.de>; Thu, 14 Aug 2025 07:13:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DECB35A8269
	for <lists+linux-omap@lfdr.de>; Thu, 14 Aug 2025 05:13:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD1CB21FF25;
	Thu, 14 Aug 2025 05:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="FCjjvweP"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D309217734
	for <linux-omap@vger.kernel.org>; Thu, 14 Aug 2025 05:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755148399; cv=none; b=OO3YUuvyT8tAnEa3EdoVOggdR6b1g9xPFNYrsZ9chyT2o0vFJNF7wJMoPHrDec4xQaXh2rXWVK9DRm4PL9WKakpI44YVFo2q5suII7FLrCFcM+JgSZZRVnk1o6DNPBPSwtRIYgO9ihLv+DH+iLyuJaZ4bBpHAWimSFLUel3j5Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755148399; c=relaxed/simple;
	bh=k7BQOJKsWTRVbsTyj8wE27+ReeJC9Y/WsWlZgzIGoO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c9zZGEJQv1OTGTsmDkbyvo2QdLoWEq0wP0rBw12aca6Q1SSTVwlUUUTqScsxnXiuLAxxCAGO/DoQ49MzToPt/7l4GFLNo/KfVGZjgyVPPnUzTvgYFoPM8ACCydtJmxs6hhB6A3hP53mgmqn58fO/FFMCpw7hWtSOOW8TjIS1X2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=FCjjvweP; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-afcb7a0442bso92022766b.2
        for <linux-omap@vger.kernel.org>; Wed, 13 Aug 2025 22:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1755148395; x=1755753195; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zOs+Ja2LywqReJC9686EhsUnOQ6QzXRLXHcqfrYvThc=;
        b=FCjjvwePwZ2mhuucScjnjn68NRhkzBNKMlIdyRf5y6AxrjHQUi07I1Or7rMDz+zQHl
         jtVNBrD4S+gB74F5wnu2qtSXOPExGCbb+JTxot53WZTiSMl0aS0WTISMK/737/1s4344
         xMJAtGWsBw/vBV4QjVmMShPS0soDQ/7rKSWug8TIliJ0cMj7vDiLWxqq2mkoOIQhd/YX
         wqdTBzMA7LIrUJJu5+7JHw+BJTjHlKzDBhM7LX/KgcqEOnbkDPvzzm1E7T51W2+1+klq
         4p5v4M6q/mPGhfGMHjiu1XCHNkaOMpfZecn63KrJpGzcEyHFs57aE4uINI4xt33IfwZG
         ZwGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755148395; x=1755753195;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zOs+Ja2LywqReJC9686EhsUnOQ6QzXRLXHcqfrYvThc=;
        b=WwUclvEX5UO2HtOTG0zAPlwsUjZHhX8ueb3NNSWjtL84F1uwpMFBY0u5FXu6PWl5sr
         j6mhsZcWuexGQHrlH1m6DA7QY8nQ7MiOccYBBaK3rYRzAHACwLyCEnncQhCEqJS5tYvi
         HIS59gbIEaA0psPlI2Od65JOBPHVe7SgXtawNk8cwTwHQOonZ/mqTG1WzZBCXO/NbEVo
         VYZE6UvP4IO/dWi23XChTcIx5ev7gTb0OqLHXHTyPHLmAE0BzCvbm0Z4lufoUEdYEu30
         oWnk6Lcbl1mhOQFuU//deMpObaxpK3NdT+kpQoClsygZ36H69Q7Z+Dd64rXcbNrEmo+b
         zEkw==
X-Forwarded-Encrypted: i=1; AJvYcCWCi254hDOSTHeIlF2qLzSMPYCYO3liX7exDR1IjsRIIlj7/SHO3HDbpIlU93faQvoqevvXmj2YufNV@vger.kernel.org
X-Gm-Message-State: AOJu0YwonhVyrNRMafbqklueBCOX3Kah7pzCvQXP0hDc3Mi6ZrU3oS8n
	RCwhz0Sm4LQm7qx5eCZz/S2XEF0q9sY4Lt18zTJqpr595QZgsKTeFSnvELhRzq6dtLE=
X-Gm-Gg: ASbGncuk9CaZbOiwY/hiChOMOJyvRm/Fv8WVlwMsTRBOH1jobu4Xe7of2PQ7iqYDnsu
	TMCSFAULia0h/x5zxzfOOL0yDRw6lc6krvq46MHAwKOZHyUeLoOABPHR/hGVYolyHlYsuZr4Q7m
	Za8DruIpU2nj+GP50dIJD80WdGpe/5SOwv4l0uSXNWcZ4NJYRL54rf6qzM+cpvI3eNOgo+yc/IR
	wzXH/y+9WZ9TkvYDizBjh698dSX+HCXUAqjkIS2TwqqEPg4Cbh9CaBTCDbdUwUzWUBsogh4LMv9
	4bDA1/6qckX9cyKK5wSx1sa99q1m7sQ5JTjbxydoUN/P21xY5nWXCJuBejVrWOSlimL8Z2dYt4F
	xvZN+q0LjAhHCMdH/ejcb9fSk9Dc=
X-Google-Smtp-Source: AGHT+IE21Fscsduu8A2gVWCDMuP+3BFd0qyr2OthVuaxd9+6x6FL4+ivV3/eWrrrt5/okGohfJQ1Gg==
X-Received: by 2002:a17:907:7243:b0:afa:97:55e9 with SMTP id a640c23a62f3a-afcb98c0441mr149870466b.36.1755148394806;
        Wed, 13 Aug 2025 22:13:14 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-af91a078a28sm2533359966b.3.2025.08.13.22.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 22:13:14 -0700 (PDT)
Date: Thu, 14 Aug 2025 07:13:12 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Dominik Brodowski <linux@dominikbrodowski.net>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Kevin Hilman <khilman@baylibre.com>, linux-omap@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 resend] pcmcia: omap_cf: Mark driver struct with
 __refdata to prevent section mismatch
Message-ID: <c5agcvxca6z7fb6eqwlrqq4232toncpfuu5frds3ebsbht7tyz@7lpkvzl4lyxi>
References: <4937807c9d70644fae705459f36574bd24846d31.1755099931.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xpccwvq7aahfhfvt"
Content-Disposition: inline
In-Reply-To: <4937807c9d70644fae705459f36574bd24846d31.1755099931.git.geert+renesas@glider.be>


--xpccwvq7aahfhfvt
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 resend] pcmcia: omap_cf: Mark driver struct with
 __refdata to prevent section mismatch
MIME-Version: 1.0

Hello Geert,

On Wed, Aug 13, 2025 at 05:50:14PM +0200, Geert Uytterhoeven wrote:
> As described in the added code comment, a reference to .exit.text is ok
> for drivers registered via platform_driver_probe().  Make this explicit
> to prevent the following section mismatch warning
>=20
>     WARNING: modpost: drivers/pcmcia/omap_cf: section mismatch in referen=
ce: omap_cf_driver+0x4 (section: .data) -> omap_cf_remove (section: .exit.t=
ext)
>=20
> that triggers on an omap1_defconfig + CONFIG_OMAP_CF=3Dm build.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Aaro Koskinen <aaro.koskinen@iki.fi>

Reviewed-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

--xpccwvq7aahfhfvt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmidcGUACgkQj4D7WH0S
/k4qSQf+N2OQhVnGMcoElMAvBwKbRCYoXFuMOt9VpW03suQ+ZcmFQ0WmQou3haZQ
IN7houqborh6Ue1EGpUzlzDurVsTzGE+yD4buFiPzbUpJmjg9Cr6OUeC/GXqLQOg
Gs00rX2Xe1norafY8hDLFSbZHW3qENC7bRrRFkTCN2Gc0FaBiGNWNllE989SBoqT
cwn8PzptDWqd7o8clOUBxZkTQG4j94H8WMgHHNDVbtWVra5Da4i57HyqWSCRbDZ2
EBIwnC9shX0y8FwwQGwVQYteqIzn8ThU+C7vuoZ5+mV/L+E4o0Amc0xSzCs8fIZB
S4Ho9JpdVDD8G2HV/ezYADHoQIBWfw==
=su2q
-----END PGP SIGNATURE-----

--xpccwvq7aahfhfvt--

