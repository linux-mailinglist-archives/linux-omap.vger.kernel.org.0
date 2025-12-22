Return-Path: <linux-omap+bounces-5242-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D60CD6736
	for <lists+linux-omap@lfdr.de>; Mon, 22 Dec 2025 15:59:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA8173075792
	for <lists+linux-omap@lfdr.de>; Mon, 22 Dec 2025 14:56:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5FAC32F74C;
	Mon, 22 Dec 2025 14:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DAB/Amyf"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC53632ED37
	for <linux-omap@vger.kernel.org>; Mon, 22 Dec 2025 14:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766414864; cv=none; b=QV7gx0gcseRz6HFyrWMX72DTPyR4UCCNyhjMo5GmgiRrweOnCGg6AvoHkJXSPBH3ZrcjEgfGb6wr9PEw/CMOW2uT/5tzs3Vp/GnzkAyKIy6xyTBSuAEoMXpDHuRRfK+28GOto14b9jqs4wdLKTMTG5GxQhIssna4MvDcFDq475A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766414864; c=relaxed/simple;
	bh=IwLjLCoIOYSxZJTADglHFhXYcy2He7W4GE2tlYf0bXA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xu9sHk3Vlt3hHcjpTcPD+JfK0NmTdOG6u4HKmKGbnuuX9XItZecM22deliDyIDffiNiuTuC4u8prz3282uk3qKJ1oyGoEIZSB89g2qPViZnt1awGmM0qlZwYZLype4Oa5eW5XyU32rQiLR/CommBT+Q2224eF4bfxWhdYOCn48E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DAB/Amyf; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5943b62c47dso4013247e87.1
        for <linux-omap@vger.kernel.org>; Mon, 22 Dec 2025 06:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766414860; x=1767019660; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lNpWj6TBvVji/fHBEAyDcOFnMWFot5zrE/hRwsxnXVY=;
        b=DAB/Amyf1kdMghWpvNsR5yNnMf+GdDvgb0bA4+59mA0CrIcjf0meQgWipWa4qgI0+u
         QzmXsaKh4CDGdPAVFemA6mB0PY7nYeYTfFKf08TKNBK7/79eZ+/5axG1Oj+c5gAmAFfg
         T6+CWEWvYf5iQFoFrZGr06kU0xwOi/gsXNB3kQcCCxDDaqnVlheA/H95h4OGQdIrQD1T
         DuSAeDBryQG0Va3VNcLhpD2f+qW6b93O1bCz7Ls5M2R8ZzuC60dez2dFPM0QaMrYu6X1
         4TJcc1dZY6C1qQanrLgSyh2HkvSgJUb+rXBU+gv3hnl/FjGW4kxTqLG3nbaKx9Smpezy
         zmVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766414860; x=1767019660;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lNpWj6TBvVji/fHBEAyDcOFnMWFot5zrE/hRwsxnXVY=;
        b=HZVo9w9i/BKGb3x1xgghdnUeXDsd3RvcbmNTGCoAA0NYA9S7EDw/y15HzZqkWRjI8o
         bxA6p15bf04vuGxpwJP1Jxw8J+XxZzEfozP04eRBEerLHmmoWnrGrEDWRoyhZo06HO0t
         slUWtsdG37chq+JIA8ojvx836Y7rbZReI9VXUE/S1ZrexzBppe2JTJ6AoikPW/IonGYX
         Bs2g2nn4fhoYC0B6f6s3+fTciFzD6qwNrty+Rut8OcybQFbugXNqHhaks/VcdQTOFmWh
         rN6HT46U05k9VC3m/uk843NG64upFlRFImAnN0Iu7CIhioPDqDVF2zpnjw3BMVHm7KtU
         va2Q==
X-Forwarded-Encrypted: i=1; AJvYcCW2qhHYWTWdcv3mjjFJvgCYTUWvVBDedU9nh1IfAuf1GhIFdDfjLBPjqVrXSYJXbeXH2NVfX/qpFXmO@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe1GOH8GaD0fWpmebRDmACEJRUOEVXklQyFOhV2/L4DmIMw1JD
	zw5RLjjS4rVkkc0DAgVAZGBPqdkJBSu8L4/gDV7rtbdd2fGiAwcPlksKnySEuJRZcUJP6vkrb1D
	TpXrBMknGOZy3uYlZ9x1Xp1/wvZtdCPC4yv3RD2TZYg==
X-Gm-Gg: AY/fxX6hwTeFQ2ezTOiEI4tGXg0vjMF5UGTIc7AQQAMFEF16t73hPdyhOJzuDcqfOuU
	HHIVqq0fDA4banWQvoptxuBPX/pDhlbIIEIQR/BsBH+Y8e9Gh4GNRXI039qCmlufVFg0UZlWwId
	WvmwO7Sp62yhjK68008YbAb2sYlygwVneVLgd7PPiSmxBoQYy16MCEFkVlANnuKWpsoK3VapawU
	dWh3ySw9px5sufIICLpGuLR+lpKa7hVwBqAjjnc+jgX4TqNlNV4+iqSKL9VtF+PIJUT/jYF
X-Google-Smtp-Source: AGHT+IEmZoekCpdFdxCX6++mG8wezcWmjXxPG5ogJ3p4YsZ2il+JIIqimrrt74JmCImmja/XHDzRdip0knGEk5MWYgo=
X-Received: by 2002:a05:6512:e9c:b0:598:faba:c8fa with SMTP id
 2adb3069b0e04-59a17d006e1mr4286628e87.10.1766414859977; Mon, 22 Dec 2025
 06:47:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251210-rz-sdio-mux-v3-0-ca628db56d60@solid-run.com>
 <20251210-rz-sdio-mux-v3-2-ca628db56d60@solid-run.com> <CAPDyKFoYd3WKGrjD3DEzZH8EfgZPmRkrqL=rdoKNuAADrvz3Eg@mail.gmail.com>
 <20f2128c-c6cb-4b13-aa08-b93e540f5bd9@solid-run.com>
In-Reply-To: <20f2128c-c6cb-4b13-aa08-b93e540f5bd9@solid-run.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 22 Dec 2025 15:47:03 +0100
X-Gm-Features: AQt7F2pGUIPrw4OqWueh78ppZDBGwQc_mhY3RygUrq6e1L74fXopGZ4K0V_QvZo
Message-ID: <CAPDyKFo2jsV02qSDBSZTewJjV09AMO8iETU5Uxqz+GBnd0JY6g@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] mux: Add helper functions for getting optional and
 selected mux-state
To: Josua Mayer <josua@solid-run.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Peter Rosin <peda@axentia.se>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Vignesh R <vigneshr@ti.com>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Mikhail Anikin <mikhail.anikin@solid-run.com>, Yazan Shhady <yazan.shhady@solid-run.com>, 
	Jon Nettleton <jon@solid-run.com>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-can@vger.kernel.org" <linux-can@vger.kernel.org>, 
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>, 
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 21 Dec 2025 at 11:38, Josua Mayer <josua@solid-run.com> wrote:
>
> Hi Ulf,
>
> Am 17.12.25 um 14:38 schrieb Ulf Hansson:
> > On Wed, 10 Dec 2025 at 18:39, Josua Mayer <josua@solid-run.com> wrote:
>
> cut
>
> >>  /*
> >>   * Using subsys_initcall instead of module_init here to try to ensure - for
> >>   * the non-modular case - that the subsystem is initialized when mux consumers
> >> diff --git a/include/linux/mux/consumer.h b/include/linux/mux/consumer.h
> >> index 2e25c838f8312..a5da2e33a45c0 100644
> >> --- a/include/linux/mux/consumer.h
> >> +++ b/include/linux/mux/consumer.h
> >> @@ -60,5 +60,9 @@ struct mux_control *devm_mux_control_get(struct device *dev,
> >>                                          const char *mux_name);
> >>  struct mux_state *devm_mux_state_get(struct device *dev,
> >>                                      const char *mux_name);
> >> +struct mux_state *devm_mux_state_get_optional(struct device *dev,
> >> +                                             const char *mux_name);
> >> +struct mux_state *devm_mux_state_get_optional_selected(struct device *dev,
> >> +                                                      const char *mux_name);
> > Seems like we need stub-functions of these too. Otherwise
> > subsystems/drivers need to have a "depends on MULTIPLEXER" in their
> > Kconfigs.
>
> Currently the drivers that can use a mux select MULTIPLEXER in Kconfig.

Yes, but that's not generally how we do this. The driver may not need
MULTIPLEXER for all platforms that driver is being used on.

>
> There already exist a few mux helpers both for mux-state and for mux-control,
> and they might all need stubs.

Correct. I think we should add subs for all of them.

>
> I'd prefer the restructuring of kconfig dependencies being independent from
> adding mux-state functionality to renesas sdhi driver.

I understand your point, but adding the stubs isn't really a big thing
- unless someone has some good arguments not to!?

Moreover, since the series changes the mux-core anyways - and
subsequent changes depend on it, I don't see an issue to fold in yet
another patch to add the stubs.

Kind regards
Uffe

