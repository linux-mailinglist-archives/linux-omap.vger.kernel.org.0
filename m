Return-Path: <linux-omap+bounces-4091-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E6FB032E9
	for <lists+linux-omap@lfdr.de>; Sun, 13 Jul 2025 22:35:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F06E188BB17
	for <lists+linux-omap@lfdr.de>; Sun, 13 Jul 2025 20:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C7CE27A93A;
	Sun, 13 Jul 2025 20:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c8fjL7Y/"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375AC2E36FA;
	Sun, 13 Jul 2025 20:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752438912; cv=none; b=A+nVLbcpRw4pyUy9KgtOzBiBx8UGIwTlg5lFgncdN2fFYW+64n9Aw9J6XZFld3CZ0T9egApNIT+1xkZTSdLFj5tfj3QcXXzZSMmxiUDzGbIHt2VvYd8LXc0GyXWrxt+RkFIsRMSUPw79s0BFVSHY9s1xhVVdduhIiIxP9Mw0044=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752438912; c=relaxed/simple;
	bh=Oyp7ETxjQXZYtgRVAn6gElLiMnFAOy4hYoB4qOBothY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ivmt+Kg361VCS/LX86LL0yhrx8NZzFGuMircrLyAZ7rE903KQqSSP0wdsNXZFkqBr1XYn3ZQzeoCZi7D5LGXPRnkbExWilbl8N9LICgMD+XRNwmDEQZg/wiO5XAW7IDfV5Q77XiMGyqKy7R1LKb0AI2l2ik9UcjurQVE1BgiA6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c8fjL7Y/; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-455fdfb5d04so7889155e9.2;
        Sun, 13 Jul 2025 13:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752438909; x=1753043709; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RQ6idt8wXYfGLyA4P/4xIcoRSI8FZxbhnZ/aUjNlza8=;
        b=c8fjL7Y/vT9TRAvy8h2orfXsVSUZSzLFsDeUHfXTeMaeR4ztTwhbqWWPk/2G1BRQy2
         GiTb8qmwcjtriKi1dfqa38AQ6QpLdOg0rqofsD8BDV7G7WpSG7LbTgeXCdH+j3hM3BT0
         4BAr9CExV6TSXFCW5OgBQYQZlL12m6nFPeWx5w9a6vpYktjAw1kKjyovvVMWGCBRFal4
         /eXTgR2m0Ur/RR2Tvh8gRkM8syDFYePrCA3bjJap3qXgyvnVXwues4tmxd9yUO10f4JL
         LUYb4UWjHEgS5QHRsLfcZtHwT2xDSQ2fere1ze8pFnYY+1X4VD/pn0/AaHX604asJ8fl
         6bgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752438909; x=1753043709;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RQ6idt8wXYfGLyA4P/4xIcoRSI8FZxbhnZ/aUjNlza8=;
        b=rUrSJg0b3SDv1cPOvrCJSc3ePDUSOtQ7HYQMXpD+tmN2xddvmp0dfMPJZnlvPExp/2
         uL1prtZWhLPGKPpGF1ySPmR7qEZ7JO3LsjeyR2X3etsE/8wlg4ROaeiK6VDerz9ZuhpW
         kOSAJJf9YpamAP8A5n/Thha55ycCsFjnYlPPJ527gzBjnf+8qnb+YzTHMzlAIsRyhoN2
         tuA0cPz/ozevGBs3uoblgQ2LBo/hqCuZyMBCs1NX544hFSEhwREpdJvwPeKoRcC6zkqg
         P7DBetY3AOkFnLBXROkbe07dOW1b4Fbj2IyL4FsrwoKoPAGLPV5yRLw6Ez6OhQ1rNV89
         FDYw==
X-Forwarded-Encrypted: i=1; AJvYcCVHy9Mam+0vGTqatbRnHr+PPewKrACh3wnrFZ0z00FGDm914ZEwFMkE9u4pn2hTVDSaPASmG0wjCB7Tz4s=@vger.kernel.org, AJvYcCXD8JbSWcsfS2YvUZUX9o4TdajCFhBldYR0up9qT5zdBpt/63yQncIIIYIZZYogojbHcDhNLUB3TrPWYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWiic6CXEtFBhz2u1cASJOVZQbd3BrXYDHhmFOT50V9MUwR1PE
	5QYpPulQti9eHIIlJvTCtvmocg/obsRDiBvj+wkXJ3cHPT71DbLMXTAL
X-Gm-Gg: ASbGncs6XuQWYMFkwc07ocpKysy44q3Awq2ANtQlkFG7Ec51C3l5ioj0KYg0UK1oUu/
	NPPpFyN8oDc+McukPCmwUlewuY0KCdtgZOzUMRbFiVGRqWOoLiJotIKs2AtfhGkBGCuSLUwXVR2
	VMpmVURXN7nzPwyQggubZXK09zVKy2Rhx0Kretj2xgYr6ET9Z3FfC996XnGfXVhxT0nZg1mZOI9
	MTZ0bapao5wg8TUr8/PENBUxqiHcAe6Cjm6eHClXaJ4ZH/YIzQ4XIVJRrSaKo3snR/79fVC+bFL
	6uT1HZAYFTMb5av+fTBHV8vyoYICb/JyisLKIFTR/r/1CetJckiSkmxiH3Wg8ZQeRd5H09F1Fqz
	hXDBLE8cLGXdBNYXAQipxDtRFWF66otx6lyiAwFm/qTJRWxBz95Kb/UOOfHmGpE9JmQheF/TOT8
	NFVkZSxMUslk0oAbfam3q1eNE=
X-Google-Smtp-Source: AGHT+IH4AVDkH02c07HSfsSSYjsNFz8Gnpusc8AYfW7vNFYqCGsRW7lQ5eG2tpWiRi0fKTIFLEfChA==
X-Received: by 2002:a05:600c:4ed0:b0:456:1a41:f932 with SMTP id 5b1f17b1804b1-4561a41fd79mr11636015e9.22.1752438909101;
        Sun, 13 Jul 2025 13:35:09 -0700 (PDT)
Received: from dell.localnet (2a01-114f-400e-9dc0-0000-0000-0000-0540.ea.ipv6.supernova.orange.pl. [2a01:114f:400e:9dc0::540])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc22a8sm10793602f8f.34.2025.07.13.13.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 13:35:08 -0700 (PDT)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Brian Masney <bmasney@redhat.com>
Subject:
 Re: [PATCH 1/3] ARM: OMAP1: clock: convert from round_rate() to
 determine_rate()
Date: Sun, 13 Jul 2025 22:35:06 +0200
Message-ID: <6172340.lOV4Wx5bFT@dell>
In-Reply-To: <20250710-arm32-clk-round-rate-v1-1-a9146b77aca9@redhat.com>
References:
 <20250710-arm32-clk-round-rate-v1-0-a9146b77aca9@redhat.com>
 <20250710-arm32-clk-round-rate-v1-1-a9146b77aca9@redhat.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5023095.31r3eYUQgx";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart5023095.31r3eYUQgx
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Date: Sun, 13 Jul 2025 22:35:06 +0200
Message-ID: <6172340.lOV4Wx5bFT@dell>
MIME-Version: 1.0

On Friday, 11 July 2025 01:42:16 CEST Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Acked-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>

> ---
>  arch/arm/mach-omap1/clock.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/mach-omap1/clock.c b/arch/arm/mach-omap1/clock.c
> index 83381e23fab983522ca01b8feffb861b02fee730..afc6404f62d39c4ddbac6f1ee04d889be6c47186 100644
> --- a/arch/arm/mach-omap1/clock.c
> +++ b/arch/arm/mach-omap1/clock.c
> @@ -705,14 +705,21 @@ static unsigned long omap1_clk_recalc_rate(struct clk_hw *hw, unsigned long p_ra
>  	return clk->rate;
>  }
>  
> -static long omap1_clk_round_rate(struct clk_hw *hw, unsigned long rate, unsigned long *p_rate)
> +static int omap1_clk_determine_rate(struct clk_hw *hw,
> +				    struct clk_rate_request *req)
>  {
>  	struct omap1_clk *clk = to_omap1_clk(hw);
>  
> -	if (clk->round_rate != NULL)
> -		return clk->round_rate(clk, rate, p_rate);
> +	if (clk->round_rate != NULL) {
> +		req->rate = clk->round_rate(clk, req->rate,
> +					    &req->best_parent_rate);
>  
> -	return omap1_clk_recalc_rate(hw, *p_rate);
> +		return 0;
> +	}
> +
> +	req->rate = omap1_clk_recalc_rate(hw, req->best_parent_rate);
> +
> +	return 0;
>  }
>  
>  static int omap1_clk_set_rate(struct clk_hw *hw, unsigned long rate, unsigned long p_rate)
> @@ -771,7 +778,7 @@ const struct clk_ops omap1_clk_gate_ops = {
>  
>  const struct clk_ops omap1_clk_rate_ops = {
>  	.recalc_rate	= omap1_clk_recalc_rate,
> -	.round_rate	= omap1_clk_round_rate,
> +	.determine_rate = omap1_clk_determine_rate,
>  	.set_rate	= omap1_clk_set_rate,
>  	.init		= omap1_clk_init_op,
>  };
> @@ -784,7 +791,7 @@ const struct clk_ops omap1_clk_full_ops = {
>  	.disable_unused	= omap1_clk_disable_unused,
>  #endif
>  	.recalc_rate	= omap1_clk_recalc_rate,
> -	.round_rate	= omap1_clk_round_rate,
> +	.determine_rate = omap1_clk_determine_rate,
>  	.set_rate	= omap1_clk_set_rate,
>  	.init		= omap1_clk_init_op,
>  };
> 
> 


--nextPart5023095.31r3eYUQgx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEnyr6IsGnTYAeAkHJ2WqSnltsjBoFAmh0GHoACgkQ2WqSnlts
jBr2jAf/bEu29PFvQWChV00x7wXHruop7Es3gHolRxKbv8LxnEtWZm4kkGIk36p2
FQMQZxPbpRfn3zanPLBWAsmiXy+nvWrk9zBu/OEEY8r8QsVLZwU9VV81SAI6rNrz
Tp89RkhQV8FsCoXVKZAIdvj1WOzpxVTeYJP3ds0IzQ49+Fpg+nWLSiaNH+awHky8
Xqms5mXh/SP9almdFvaZKmeAVTPUQpxsUmGMCSxWuEoWaDHKxpDa6FcaZMGetg2C
M7ZW3GznaKmZt906lQdvj2YcjonHirbjX3TULqMaDc16h/7h6BUWXr4Xt06VWTm6
LLLhsNUuQjG59V9d6+CFawQ+CzteNw==
=7sdR
-----END PGP SIGNATURE-----

--nextPart5023095.31r3eYUQgx--




