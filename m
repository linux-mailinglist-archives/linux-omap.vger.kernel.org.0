Return-Path: <linux-omap+bounces-5201-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C01CC8459
	for <lists+linux-omap@lfdr.de>; Wed, 17 Dec 2025 15:47:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8574E31A60B5
	for <lists+linux-omap@lfdr.de>; Wed, 17 Dec 2025 14:39:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C26F36BCFA;
	Wed, 17 Dec 2025 13:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bvtATVvg"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C0936BCF8
	for <linux-omap@vger.kernel.org>; Wed, 17 Dec 2025 13:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765978765; cv=none; b=YcJXFqQoLGn/wNgPf4pOFDHEuPsnJH2ToVwCEOe/zKJDPckE5NryCioWJOaHBJ40B82obALE4JhtH0AOwIy27srY04GAlaWuXgEM7uLz1Ca1sOkvNi0ZQYnpCQCoIAAh3IHoLeKGqCdDBMxFDpAguLaI1WNYpciNMtQenXkWgOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765978765; c=relaxed/simple;
	bh=KDM8RdJKqX77XlrKz+5UWU+q4lTsJFU4kb4mBFZZggY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E97adXRlIlYHtpY/Va5fx+zbcTvSBhNMtZ2QrlzyEzelskRuoE9pzgarBtxE6/nwCK43ifgUuKLIifG5X1Un9jNkgy/9AzVS2iwsBNFBTJTAzqvboBn91kliSrA5jUILLaGQjCpD6i7tyGUgo1WwM1w6/bceLGVFxzYlhfxQogo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bvtATVvg; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-37bac34346dso42034741fa.2
        for <linux-omap@vger.kernel.org>; Wed, 17 Dec 2025 05:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765978761; x=1766583561; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bnJOOseUNu5bo56mXUg+bkHSCvAL77RptqMYnGxiRP8=;
        b=bvtATVvgQQUFTTN6CIbZXpjv/7ItgwJnWg4DyfKbxDN5jH9WtzcR4E1aM2patKl7SM
         mAeCuXIk/5jTTjHK0JJR4MrDmLdtf3xVDwsqPLNuSh3NxDD/tSf5vN9RZ8yvHJkuQRN5
         YTMscFdaVmBKNEpT/aC/UzmcHCMs8R6AvH02l7fwnuNK20EkSs0B9PCtiA/OdZpmm+CF
         ynMFI196o2DguNsaXScxvOTpz0kywV5XgfxGdz5CFVYmNSFz5W3pW5HnWXCrMDSpsncJ
         UlzPdphpUsHlIcuoWAc19k8vLCTel1RCQKapFFaqyO2UgYZUSbNa7DZGbNFLlrHqpav5
         qtOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765978761; x=1766583561;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bnJOOseUNu5bo56mXUg+bkHSCvAL77RptqMYnGxiRP8=;
        b=k1dmYel8XZo3VaNa8x0BlF4K9SWSkpLcVrIKb2q1Oxf7z8W1DRmROA0GVVG97ZhTyQ
         jswuBjvY2Yb+WtMm5XF4x6sXrTsSAOCnNdLys+CsTbxUGmAXCj9MkluveJoTrvXSEf+c
         BGeC1I0eRMF+N9yS0ovyeO16Z3sgvKZdYLQNUHkoOTP9dsaCeHOvjAPFX9jnW1pPbR/Z
         qfIwrL7hfM8mCQFkD5pvzAzYSKJOzl8ikkMI5HHb2U38rteTI6TVnGWv4RpBt57mwHrZ
         AUd5wF1DrYsqApY0v8aeSzlDYbCQaQPykQg8t1LCqFmK//1KydwuzwAV7TO9fqgOom+P
         97dg==
X-Forwarded-Encrypted: i=1; AJvYcCWuiGCGOP98x3wbHDA2G1joYw1kGZY9mIKwEuhcnw3UYhYmUJss4VnbQc0Fi1PEvcgHJ/hV8z5tnVl5@vger.kernel.org
X-Gm-Message-State: AOJu0YyG1K4ArRDtdykCmKwh1vEbgGJC4xeP6Xo2GoCemn47VE8bedBc
	cBrZFeGtkooCYz7swkst5wKXxj8pWHC8k7JPZPzwqWg4S3z1Jy53Ke42ucCN0JI9DwcK7alzujQ
	baqHwfiCbPS6OkEHAAkWqQlXTZlcjZPLsTgi2z6zMVA==
X-Gm-Gg: AY/fxX5OQd5TpqO5OlPjtXZuClq+VDmteKo6SfGX4H8RLDfeIuw8lzDyNV50U/H5ffg
	gyxYhlpyzLsil8ch3jXAbyALNda9Oam+cJvBtc7+AdwOOEys0jZ3/d87wJFeswTUqEEb5KOe7vs
	8f/Lw5eKkSTHRgHp5SNdo3i9RlKQ/29QB4hp8HsnaSaeaFKpEGEoJcoFATyM1tQEV9TlVIBe6wQ
	Xd60dHWZNGmJp2z98Q95s1Wvwniz3QNByNYtet9kt4/gJp0hi2jJMHguq81WvsnLPWkku0=
X-Google-Smtp-Source: AGHT+IE2DrQoKBO7Um5lmI2G8HeKrmSb1aJ3PKObeClJFdA7DTUpv5Z7rJEzp4iMrT0Jn0x5gpN5DVmp8SJGVUL+/c0=
X-Received: by 2002:a2e:8f88:0:b0:37a:5990:2ba8 with SMTP id
 38308e7fff4ca-37fd0877fc9mr48143241fa.23.1765978760510; Wed, 17 Dec 2025
 05:39:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251210-rz-sdio-mux-v3-0-ca628db56d60@solid-run.com> <20251210-rz-sdio-mux-v3-2-ca628db56d60@solid-run.com>
In-Reply-To: <20251210-rz-sdio-mux-v3-2-ca628db56d60@solid-run.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 17 Dec 2025 14:38:43 +0100
X-Gm-Features: AQt7F2ritzE1FtCn3rFBAb957an6eyRlRiUWdpCCK7X4DKkbiNs7zTdDOI9qhxU
Message-ID: <CAPDyKFoYd3WKGrjD3DEzZH8EfgZPmRkrqL=rdoKNuAADrvz3Eg@mail.gmail.com>
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
	Jon Nettleton <jon@solid-run.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-can@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 10 Dec 2025 at 18:39, Josua Mayer <josua@solid-run.com> wrote:
>
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
> ---
>  drivers/mux/core.c           | 67 +++++++++++++++++++++++++++++++++++++++-----
>  include/linux/mux/consumer.h |  4 +++
>  2 files changed, 64 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/mux/core.c b/drivers/mux/core.c
> index a3840fe0995fe..130ca47a8be37 100644
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
> +                       dev_err(dev, "%pOF: failed to get mux-%s %s(%i)\n",
> +                               np, state ? "state" : "control",
> +                               mux_name ?: "", index);
>                 return ERR_PTR(ret);
>         }
>
> @@ -745,6 +744,60 @@ struct mux_state *devm_mux_state_get(struct device *dev,
>  }
>  EXPORT_SYMBOL_GPL(devm_mux_state_get);
>
> +/**
> + * devm_mux_state_get_optional() - Get the optional mux-state for a device,
> + *                                with resource management.
> + * @dev: The device that needs a mux-state.
> + * @mux_name: The name identifying the mux-state.
> + *
> + * Return: Pointer to the mux-state, or an ERR_PTR with a negative errno.
> + */
> +struct mux_state *devm_mux_state_get_optional(struct device *dev,
> +                                             const char *mux_name)
> +{
> +       struct mux_state *mux_state = devm_mux_state_get(dev, mux_name);
> +
> +       if (IS_ERR(mux_state) && PTR_ERR(mux_state) == -ENOENT)
> +               return NULL;
> +
> +       return mux_state;
> +}
> +EXPORT_SYMBOL_GPL(devm_mux_state_get_optional);
> +
> +/**
> + * devm_mux_state_get_optional_selected() - Get the optional mux-state for
> + *                                         a device, with resource management.
> + * @dev: The device that needs a mux-state.
> + * @mux_name: The name identifying the mux-state.
> + *
> + * Return: Pointer to the mux-state, or an ERR_PTR with a negative errno.
> + *
> + * The returned mux-state (if valid) is already selected.
> + */
> +struct mux_state *devm_mux_state_get_optional_selected(struct device *dev,
> +                                                      const char *mux_name)
> +{
> +       struct mux_state *mux_state;
> +       int ret;
> +
> +       mux_state = devm_mux_state_get_optional(dev, mux_name);
> +       if (IS_ERR_OR_NULL(mux_state))
> +               return mux_state;
> +
> +       ret = mux_state_select(mux_state);
> +       if (ret) {
> +               if (ret != -EPROBE_DEFER)
> +                       dev_err(dev, "failed to select mux-state %s: %d\n",
> +                               mux_name ?: "", ret);
> +
> +               mux_state_put(mux_state);
> +               return ERR_PTR(ret);
> +       }
> +
> +       return mux_state;
> +}
> +EXPORT_SYMBOL_GPL(devm_mux_state_get_optional_selected);
> +
>  /*
>   * Using subsys_initcall instead of module_init here to try to ensure - for
>   * the non-modular case - that the subsystem is initialized when mux consumers
> diff --git a/include/linux/mux/consumer.h b/include/linux/mux/consumer.h
> index 2e25c838f8312..a5da2e33a45c0 100644
> --- a/include/linux/mux/consumer.h
> +++ b/include/linux/mux/consumer.h
> @@ -60,5 +60,9 @@ struct mux_control *devm_mux_control_get(struct device *dev,
>                                          const char *mux_name);
>  struct mux_state *devm_mux_state_get(struct device *dev,
>                                      const char *mux_name);
> +struct mux_state *devm_mux_state_get_optional(struct device *dev,
> +                                             const char *mux_name);
> +struct mux_state *devm_mux_state_get_optional_selected(struct device *dev,
> +                                                      const char *mux_name);

Seems like we need stub-functions of these too. Otherwise
subsystems/drivers need to have a "depends on MULTIPLEXER" in their
Kconfigs.

Kind regards
Uffe

