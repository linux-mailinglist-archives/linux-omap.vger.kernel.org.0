Return-Path: <linux-omap+bounces-5235-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAADCD5BC1
	for <lists+linux-omap@lfdr.de>; Mon, 22 Dec 2025 12:08:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2989A3012970
	for <lists+linux-omap@lfdr.de>; Mon, 22 Dec 2025 11:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97EF433374F;
	Mon, 22 Dec 2025 10:15:59 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A43333745
	for <linux-omap@vger.kernel.org>; Mon, 22 Dec 2025 10:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766398559; cv=none; b=k/a0q4oYQNdqWCFrrBEnmZPDJ4tTtAXXnt6ihirvZxJ4TDgfYrzG1V/KTtsjkso8B/OXmrm8822r3xesRXwSA4PJg1yvfNVuOulZAV7yPIbHe3tcJx74OwoFyAp8jXKTHlXnvS62LXP7hsPF37J2JL+RZPUPVlokSLLCU2pe9jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766398559; c=relaxed/simple;
	bh=pYxC0xGJLfaMlKM2nphME9JmmJ1biPNjHd+MZwrmnFM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ooveBTUhAuFYgirxyojN18HO+8urgpQ+H+zwyjUHWWY3aLLD0LMleB1BuNpBCJRl8c6LrMzCoByMsjSVQuNFpgPy4fQT8fDxRnGOqFYcuVAWpvULdJ7SQmZNonTnRjulMZxQGRleuXD9O4XKVG5L92TGK6Ts7D6SwBSAaHQ3X44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-3e83c40e9dfso2256743fac.1
        for <linux-omap@vger.kernel.org>; Mon, 22 Dec 2025 02:15:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766398557; x=1767003357;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VEzlntz/A3Digs4sjukIlKb5qv62LH8yawTgFzZ88fo=;
        b=m3QqsGYSsWeslk3pd/L5ZpHrBJGS1MPbn4Eejta20F1SBX3R2CcTHwTvKb42s8Km7n
         ZxqeqefWROnrYvX4PYzUUW/x//bx4itFCuCpK/fF//ukhRl71BiLCqGvL7vKDfM7qs2T
         hB6QaHQYYWCee286F47uaWRMBm/gC19Ky0yjESvK2SGRErj6J/wrqCd4p7o+gvgujDmr
         EeqBOt92xXsIi0T7VNSJGXWF87AE0E0FVAN7VXrMWAjLXG4hiFgs+7fJKIlRpl+RjXZZ
         J4FbrlfEcfC+YS0xZDS3mKBZZF9i1Uh2VSRSfH8KO9VITMhDXuDtIOyWkdy0YTPdxM1D
         szmw==
X-Forwarded-Encrypted: i=1; AJvYcCV0l7R9sYMhMnCktd7wu4r/HFmHBuCLXmkJ7rd3uihGygndMAzRVWVfQhZ5RbX3lK02rHDnPVZN+pdT@vger.kernel.org
X-Gm-Message-State: AOJu0YyC6TskYQSmPE53oB5UA2OlzuFa+HCirxd8jlS6QGJVZWa99spI
	zPaeWs67++AYJbuYux1NWFUw4RBGjQNglymCBSWyU5t5/i7/YNUyrILj1xbqTJtL
X-Gm-Gg: AY/fxX5tivT6TEJAag3cJgUpxz78iXOK6qq+8yynzhFHuHYr1iduzEsgHgfHbiqHsQm
	1uRNmTGuqdLyD4Rj4Q5y0mNJTdcH4g5EQ91O9g/st9KNmrtI4ob3wi5B3FXIAQmYjTbdaH2uil1
	cRfh7xjLWhr3+m0x7nwZFwWsZX6Z2eVZc+kBRWu6UtDFi754TZKmkNyLhfXyE2huyyiRp9mHTfj
	e1Udn6jQBC0snSMhlSLb8gPgzDoKPbAsFo+G1gE5S6FmI7unu5TdrTxeK7y0Xh8k5j1ahfTbaA9
	Auf27VDCfHmHb9N5JdXjtK5Nw1BxQwQYz1CNNq8gOGHhNxTBrL8p7cDq2fRAccCRyvFVdr+7qQE
	cuc600YwyAujpBozmp4M5BIUF0jJ+sFhwH/OXU90MtRhUoRtqTPC6EiNSAl07n0oiWjeyRzbpTY
	09oNKFe2tQ9Snb08zCy5hy+tedPaByZude6UtEuYNaWVt+lbO9
X-Google-Smtp-Source: AGHT+IFnyYNK0+gZUiEFiboRFlzQYRpNz7Qk0LjhYBCz7oVltfWpL45mAtbGSFfNOq2Z4SNMhr7uoA==
X-Received: by 2002:a05:6870:3307:b0:3e8:96c0:326b with SMTP id 586e51a60fabf-3fda588e3d6mr4579824fac.49.1766398556587;
        Mon, 22 Dec 2025 02:15:56 -0800 (PST)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com. [209.85.161.50])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3fdaab620b8sm6378857fac.14.2025.12.22.02.15.56
        for <linux-omap@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 02:15:56 -0800 (PST)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-65d1a094185so956764eaf.1
        for <linux-omap@vger.kernel.org>; Mon, 22 Dec 2025 02:15:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW7/wYOxc5KPDvX/h+QlzCPqHM5IIq49Rs8mNJ+5Jy0/cWAMWCKxNcNL/2RKAh6/+CbnGoDVdLUx4W6@vger.kernel.org
X-Received: by 2002:a05:6102:3a0e:b0:5d7:de89:8dc6 with SMTP id
 ada2fe7eead31-5eb1a616c74mr2760273137.6.1766398102025; Mon, 22 Dec 2025
 02:08:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251210-rz-sdio-mux-v3-0-ca628db56d60@solid-run.com> <20251210-rz-sdio-mux-v3-2-ca628db56d60@solid-run.com>
In-Reply-To: <20251210-rz-sdio-mux-v3-2-ca628db56d60@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Dec 2025 11:08:11 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXjAS6HOYy5=uxcK0RZL5X6agRoHG67QUw4xh5+ovZaJQ@mail.gmail.com>
X-Gm-Features: AQt7F2qgJlv5WWEn-8R7_EQWn45G6An5kBRt8R2C89e3bKVxcY7XZ_y43fEdjFs
Message-ID: <CAMuHMdXjAS6HOYy5=uxcK0RZL5X6agRoHG67QUw4xh5+ovZaJQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] mux: Add helper functions for getting optional and
 selected mux-state
To: Josua Mayer <josua@solid-run.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Peter Rosin <peda@axentia.se>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Vignesh R <vigneshr@ti.com>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Mikhail Anikin <mikhail.anikin@solid-run.com>, Yazan Shhady <yazan.shhady@solid-run.com>, 
	Jon Nettleton <jon@solid-run.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-can@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Josua,

On Wed, 10 Dec 2025 at 18:39, Josua Mayer <josua@solid-run.com> wrote:
> In-tree phy-can-transceiver driver has already implemented a local
> version of devm_mux_state_get_optional.
>
> The omap-i2c driver gets and selects an optional mux in its probe
> function without using any helper.
>
> Add new helper functions covering both aforementioned use-cases:
>
> - devm_mux_state_get_optional:
>   Get a mux-state if specified in dt, return NULL otherwise.
> - devm_mux_state_get_optional_selected:
>   Get and select a mux-state if specified in dt, return error or NULL.
>
> Existing mux_get helper function is changed to return -ENOENT in case dt
> did not specify a mux-state or -control matching given name (if valid).
> This matches of_parse_phandle_with_args semantics which also returns
> -ENOENT if the property does nto exists, or its value is zero.
>
> The new helper functions check for ENOENT to return NULL for optional
> muxes.
>
> Commit e153fdea9db04 ("phy: can-transceiver: Re-instate "mux-states"
> property presence check") noted that "mux_get() always prints an error
> message in case of an error, including when the property is not present,
> confusing the user."
>
> The first error message covers the case that a mux name is not matched
> in dt. This is removed as the returned error code (-ENOENT) is clear.
>
> The second error message is based on of_parse_phandle_with_args return
> value. In case mux description is missing from DT, it returns -ENOENT.
> Print error message only for other error codes.
>
> This ensures that the new helper functions will not confuse the user
> either.
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Thanks for your patch!

> --- a/drivers/mux/core.c
> +++ b/drivers/mux/core.c
> @@ -542,11 +542,8 @@ static struct mux_control *mux_get(struct device *dev, const char *mux_name,
>                 else
>                         index = of_property_match_string(np, "mux-control-names",
>                                                          mux_name);
> -               if (index < 0) {
> -                       dev_err(dev, "mux controller '%s' not found\n",
> -                               mux_name);
> -                       return ERR_PTR(index);
> -               }
> +               if (index < 0)
> +                       return ERR_PTR(-ENOENT);
>         }
>
>         if (state)
> @@ -558,8 +555,10 @@ static struct mux_control *mux_get(struct device *dev, const char *mux_name,
>                                                  "mux-controls", "#mux-control-cells",
>                                                  index, &args);
>         if (ret) {
> -               dev_err(dev, "%pOF: failed to get mux-%s %s(%i)\n",
> -                       np, state ? "state" : "control", mux_name ?: "", index);
> +               if (ret != -ENOENT)

I think the non-optional variant should still print an error message in
case of -ENOENT, else this has to be duplicated in all drivers using it.

This is typically handled by having a non-printing core helper function,
and having printing non-optional, and non-printing/ignoring optional wrappers
around the former.

> +                       dev_err(dev, "%pOF: failed to get mux-%s %s(%i)\n",
> +                               np, state ? "state" : "control",
> +                               mux_name ?: "", index);
>                 return ERR_PTR(ret);
>         }
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

