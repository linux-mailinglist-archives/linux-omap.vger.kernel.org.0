Return-Path: <linux-omap+bounces-4583-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE9EB46602
	for <lists+linux-omap@lfdr.de>; Fri,  5 Sep 2025 23:45:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6DB93B190B
	for <lists+linux-omap@lfdr.de>; Fri,  5 Sep 2025 21:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 914EB307AE1;
	Fri,  5 Sep 2025 21:40:08 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820D62FF66E
	for <linux-omap@vger.kernel.org>; Fri,  5 Sep 2025 21:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757108408; cv=none; b=Q8plw5Lz5nALphz1YMdwVTeB1rkF3F2Jxkz1ZvHKCznmlAJGYGo9XQvLfFRXie+c2YiEDdzcoDsgP5fJw+Ik/V20bnyKp1HmlToo9utO1ZO3tCMDpbnWCp1Nl+yVyWAgFl5bzkCJZl/H/ew7W5hp3aKDptHCZZn6/iFGyWJycvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757108408; c=relaxed/simple;
	bh=EuwPVtHyZtk0Y1lc41SsIpHNM6KNvdVwwJODJaVH/gM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pkzjmKiR9kgBsKbbrBRcMbj1xz0n3Xr+FZQYl0Wm3bSnzokEOBtlCPypBbDBzlUoGhsQ5mwhqt8Jn3UUWPTti5XJPSgj1L8WBTDcjXnbbNrNzrLPu39n40C871SHiLr1uzVPFwSxpW206PGafSC0U1p7uxEyg47kIma1Zq/zAiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=baylibre.com; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-24456ce0b96so27836895ad.0
        for <linux-omap@vger.kernel.org>; Fri, 05 Sep 2025 14:40:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757108406; x=1757713206;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xirptwLPscOOrD6MjERvQR7+JKo3MLBeTIYrgAFmkYE=;
        b=AQhM2x1rFMNvbS6zt3jgUy44LuvyG+sLAkXA3YnP6GHa1hD+r78rBRN27UrVWXvO3R
         Yem5Ej+1yn5CQwPT7sm0/4pSkjUOsg5/37AelXAA/gmBpEox9GQI+bgkOZpZWFvVcp6T
         gJrmISdnUkKidLfKoEw4Ki9U5ET5UlhgUUOrWGxOwyFYwI2oH1yt6IZBGfhwXrkQTp3v
         6Ifw/O6ITKU7JfiS72Zv29D+7kbwLzG9vknlop24lNtjb2NuAylIQ2AuJ6LajeAupX1S
         ZHZg3C83AYT4NdB8pKA86vlcwxoCKvl2y8fqQMoIvyT7WgV77Nj72xTScx2cQMSxYE/t
         rBeA==
X-Forwarded-Encrypted: i=1; AJvYcCUcSH50gnUJCVb/EAIrU3WR9MkncLjkDbr+SROx9PHd3lPeWiKR4NJdLBVF/u3wT+p5wc8PpXQmRB4e@vger.kernel.org
X-Gm-Message-State: AOJu0YzPQ3rR1F9rZ6oV8BF8yio1IKNpMRguY5Moc2vc3OWEAcSpxmkg
	6rNdc1OblWenVpq/S+S5k6J3bJpJX2TUKk0fsKp/xdLR83aKv2ZZTpa8L60K/+SYxKE=
X-Gm-Gg: ASbGncurGTYOhrnSQ8qmC2V+lfJqU4uq3Nbe9VOf4PxZHhEVnTCx9JKsYLjx82MZPW6
	M/nucr+ImF8r6m919sdLMe2BjMuKlhBvDJqTYhLVJ//0BS1b+XwuElTVA5Q9maWOBKzrNiDw/qz
	dyYwbwAzSXTtLdsL7OmZUZN/C1NLY3u5pwat8c+tq70bPGRKEilAw/Hnh+X+ndYaHUuZSN7chEi
	wJ3U5YkcHHsJ8+OjxF3dV2IW4EDb5D745j7SVZr5P5AhJa2+L5z0eY/KUWaRkBazpUam9YItqw7
	sPWA0X3pSlgBTmHax+ERjhJTVdeoDSXv4NXonQrFJ4UyAuy6mx3Q+Fz1izsSV1pyj9h1D6UqwWI
	AoDlszEgSolgrY2yROxD1
X-Google-Smtp-Source: AGHT+IFw9MwANXAgB0eCLMrfpT9FSIah/S2jHqgdaTFzPWLL5Scc72YKTjtxBqxKZTvx50aR9gsoUA==
X-Received: by 2002:a17:903:1c2:b0:24c:affd:6f00 with SMTP id d9443c01a7336-24cef52790fmr57400485ad.14.1757108405639;
        Fri, 05 Sep 2025 14:40:05 -0700 (PDT)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24c9df827besm74488265ad.152.2025.09.05.14.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 14:40:05 -0700 (PDT)
From: Kevin Hilman <khilman@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>, Tero Kristo
 <kristo@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>
Cc: Matthias Schiffer <matthias.schiffer@tq-group.com>,
 linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexander Stein
 <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 1/1] clk: ti: am33xx: keep WKUP_DEBUGSS_CLKCTRL enabled
In-Reply-To: <20250825140812.2222185-1-alexander.stein@ew.tq-group.com>
References: <20250825140812.2222185-1-alexander.stein@ew.tq-group.com>
Date: Fri, 05 Sep 2025 14:40:04 -0700
Message-ID: <7hms78a897.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Alexander Stein <alexander.stein@ew.tq-group.com> writes:

> From: Matthias Schiffer <matthias.schiffer@tq-group.com>
>
> As described in AM335x Errata Advisory 1.0.42, WKUP_DEBUGSS_CLKCTRL
> can't be disabled - the clock module will just be stuck in transitioning
> state forever, resulting in the following warning message after the wait
> loop times out:
>
>     l3-aon-clkctrl:0000:0: failed to disable
>
> Just add the clock to enable_init_clks, so no attempt is made to disable
> it.
>
> Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Acked-by: Kevin Hilman <khilman@baylibre.com>

> ---
>  drivers/clk/ti/clk-33xx.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/clk/ti/clk-33xx.c b/drivers/clk/ti/clk-33xx.c
> index 85c50ea39e6da..9269e6a0db6a4 100644
> --- a/drivers/clk/ti/clk-33xx.c
> +++ b/drivers/clk/ti/clk-33xx.c
> @@ -258,6 +258,8 @@ static const char *enable_init_clks[] = {
>  	"dpll_ddr_m2_ck",
>  	"dpll_mpu_m2_ck",
>  	"l3_gclk",
> +	/* WKUP_DEBUGSS_CLKCTRL - disable fails, AM335x Errata Advisory 1.0.42 */
> +	"l3-aon-clkctrl:0000:0",
>  	/* AM3_L3_L3_MAIN_CLKCTRL, needed during suspend */
>  	"l3-clkctrl:00bc:0",
>  	"l4hs_gclk",
> -- 
> 2.43.0

