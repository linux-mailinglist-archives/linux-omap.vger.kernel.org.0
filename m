Return-Path: <linux-omap+bounces-5572-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F55D3C4D5
	for <lists+linux-omap@lfdr.de>; Tue, 20 Jan 2026 11:16:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BF062567F14
	for <lists+linux-omap@lfdr.de>; Tue, 20 Jan 2026 09:53:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A6F53D2FF0;
	Tue, 20 Jan 2026 09:52:22 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D83365A00
	for <linux-omap@vger.kernel.org>; Tue, 20 Jan 2026 09:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768902741; cv=none; b=ipgLjnh1uTcMmsNinRyIF6NsVjcuZKpR7JTVRwgFpQaKNxPQ1kt6UT5mCL/VEP4AoRiMyKHD/H7jQS8Cp/XPuOLUSfri7R6ehHzpk0ZdvTWWewPhbHoLn1X123KqyWa9GB9gdl2ulD1yfXaRedzPxAlsamzz7R5ZrTsbiK67VrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768902741; c=relaxed/simple;
	bh=Y2e+JbZ5geFsLrIwdXvR6J7aoCBZ+QeMG1PGfBHkwC8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=meDS4RjfHBZS2BO5Qq6mkEeX4Uoz82m9sR4UK1Lox5LhJIFSk9rVSKdlpLShPPGheRkkARytYL5InLy+IufZkE6+P9aBoT/pWRwGceXdPlkm0zbkzgzu8++yxgzJEunqnmatFJBpWYZzIyM8auwmbMwZUYMM3Zx87HTZyXkqlIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-502b0aa36feso25165701cf.1
        for <linux-omap@vger.kernel.org>; Tue, 20 Jan 2026 01:52:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768902736; x=1769507536;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l18hDtqu7l45yo1vlmek39RB1c0Zv/I56SgfcgBEbBk=;
        b=VofFeY4WjXJkGL4cnZlqy0YqxitfH4UEXUYeXy9lBCb0TLkCqExdkJ5aWv4NejFxqn
         uS/JewpYl5FGVZAuhHtjkJKWamILOyl5u0yCqsbL68goojTSWlf71/qW4UghbS2/iJLi
         PBC/csYISV7LSx2y43YeJHfJT5c4OBtFbImpwaTf/heDZc2JmfzAE67ZfEH6Nr25DRd1
         7zOR5cnVdWLPK+vAD9xLiDM5ACNpePkM35hkQNcckXt7Qxq6UGMb90xYcFNaP+mr43zU
         67yDICLCfmcPW45/pORoxA8lXAz/ynprLQ5y+Sj8PkoJtym6+1bAv4XsKTUvXR72aJI2
         eMEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoSZTRm/nfyj4ouQKkKfREr/tOa+BW9KHHfCYBcnI/HcO3TZXXsMjYDVUyLDyR8txvviH5ihdaG0Ck@vger.kernel.org
X-Gm-Message-State: AOJu0YwCajOwLDT2uOrO0PUySeyzHgYRqLP26ySrSsJf/T7EK22HaQf+
	HuOm0OrgrzNUvuyPmp8wVp6tdknOHcIiIc7On0TstSW9CR08Gl61zRT0IqzvP0DS
X-Gm-Gg: AY/fxX746nP7clbCq7LPGSjsuirj8Wat0d04GKQM+IQZp8aoJksw0zdr6KS1PMJ5HP3
	eqW26y9p25XgXhShz8ludmNgl+t/Z0+3FEYe0YjS4yzedIly90s7NQpqO8lmKIx/cjmnd8r/1nb
	ukXOWJkNUkqqPNz6aISVEp0/ILYt7a902r160wPaKZ4wvhSBgAGdtW577YMO/azORx4vFbRa2xa
	HJWJ+8/knFD70jK3tWfCJeZ02KPa4fDrk1O14rYnKqibtJmgxbecYUpK3ofjisU2EwDEJeAzeFK
	tDro6UMpJ5R7O6JZZAAqINxWfqxU8Vh0HxSv1vgbtXdmMEB1jvtiSzwJiS/z14ptZjYboNSaC1E
	t4awNfjJDT0vHvJB4F68hay9KaOsKmiX/9nMBSwQkVhW1h9YrDVKvrD1Ksx3GMYyx7P51ZiUvfB
	A4GRLJqC2jjIACoE4yqXbl/Y1FRQEHVt+DDiym2u2yBiZdUBN4
X-Received: by 2002:a05:622a:283:b0:501:46b7:401b with SMTP id d75a77b69052e-5019f84acc3mr256496001cf.15.1768902736281;
        Tue, 20 Jan 2026 01:52:16 -0800 (PST)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com. [209.85.219.41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a3757390sm84629761cf.4.2026.01.20.01.52.16
        for <linux-omap@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 01:52:16 -0800 (PST)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-888310b91c5so53507136d6.1
        for <linux-omap@vger.kernel.org>; Tue, 20 Jan 2026 01:52:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV2Vy0oeuJGaP+I00BDXSHbc+Bm+9RFv2ywtpSoUhFGV8cTy8uQ5DWrLKSjuQWVOLryrYdzwaCvnC2Z@vger.kernel.org
X-Received: by 2002:a05:6102:cd1:b0:5ef:233e:6b25 with SMTP id
 ada2fe7eead31-5f192508654mr6479996137.13.1768902342092; Tue, 20 Jan 2026
 01:45:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260118-rz-sdio-mux-v5-0-3c37e8872683@solid-run.com> <20260118-rz-sdio-mux-v5-2-3c37e8872683@solid-run.com>
In-Reply-To: <20260118-rz-sdio-mux-v5-2-3c37e8872683@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Jan 2026 10:45:30 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWnpci1v1oQb34_QRtU-P3S8TSormmNudajT0e34EO14w@mail.gmail.com>
X-Gm-Features: AZwV_Qh1sWLkk903wC1dLdg8mLxjiEBVkYZdOb9H2O-Zh60PCWOHx0RPYuQB8LA
Message-ID: <CAMuHMdWnpci1v1oQb34_QRtU-P3S8TSormmNudajT0e34EO14w@mail.gmail.com>
Subject: Re: [PATCH v5 2/7] mux: Add helper functions for getting optional and
 selected mux-state
To: Josua Mayer <josua@solid-run.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Peter Rosin <peda@axentia.se>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Vignesh R <vigneshr@ti.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, Jon Nettleton <jon@solid-run.com>, 
	Mikhail Anikin <mikhail.anikin@solid-run.com>, linux-can@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Josua,

On Sun, 18 Jan 2026 at 11:29, Josua Mayer <josua@solid-run.com> wrote:
> In-tree phy-can-transceiver driver has already implemented a local
> version of devm_mux_state_get_optional.
>
> The omap-i2c driver gets and selects an optional mux in its probe
> function without using any helper.
>
> Add new helper functions covering both aforementioned use-cases:
>
> - mux_control_get_optional:
>   Get a mux-control if specified in dt, return NULL otherwise.
> - devm_mux_state_get_optional:
>   Get a mux-state if specified in dt, return NULL otherwise.
> - devm_mux_state_get_selected:
>   Get and select a mux-state specified in dt, return error otherwise.
> - devm_mux_state_get_optional_selected:
>   Get and select a mux-state if specified in dt, return error or NULL.
>
> Existing mux_get helper function is changed to take an extra argument
> indicating whether the mux is optional.
> In this case no error is printed, and NULL returned in case of ENOENT.
>
> Calling code is adapted to handle NULL return case, and to pass optional
> argument as required.
>
> To support automatic deselect for _selected helper, a new structure is
> created storing an exit pointer similar to clock core which is called on
> release.
>
> To facilitate code sharing between optional/mandatory/selected helpers,
> a new internal helper function is added to handle quiet (optional) and
> verbose (mandatory) errors, as well as storing the correct callback for
> devm release: __devm_mux_state_get
>
> Due to this structure devm_mux_state_get_*_selected can no longer print
> a useful error message when select fails. Instead callers should print
> errors where needed.
>
> Commit e153fdea9db04 ("phy: can-transceiver: Re-instate "mux-states"
> property presence check") noted that "mux_get() always prints an error
> message in case of an error, including when the property is not present,
> confusing the user."
>
> The first error message covers the case that a mux name is not matched
> in dt. The second error message is based on of_parse_phandle_with_args
> return value.
>
> In optional case no error is printed and NULL is returned.
> This ensures that the new helper functions will not confuse the user
> either.
>
> With the addition of optional helper functions it became clear that
> drivers should compile and link even if CONFIG_MULTIPLEXER was not enabled.
> Add stubs for all symbols exported by mux core.
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Thanks for your patch!

> --- a/drivers/mux/core.c
> +++ b/drivers/mux/core.c

> @@ -677,7 +707,7 @@ EXPORT_SYMBOL_GPL(devm_mux_control_get);
>   *
>   * Return: A pointer to the mux-state, or an ERR_PTR with a negative errno.
>   */
> -static struct mux_state *mux_state_get(struct device *dev, const char *mux_name)
> +static struct mux_state *mux_state_get(struct device *dev, const char *mux_name, bool optional)
>  {
>         struct mux_state *mstate;
>
> @@ -685,12 +715,10 @@ static struct mux_state *mux_state_get(struct device *dev, const char *mux_name)
>         if (!mstate)
>                 return ERR_PTR(-ENOMEM);
>
> -       mstate->mux = mux_get(dev, mux_name, &mstate->state);
> -       if (IS_ERR(mstate->mux)) {
> -               int err = PTR_ERR(mstate->mux);
> -
> +       mstate->mux = mux_get(dev, mux_name, &mstate->state, optional);
> +       if (IS_ERR_OR_NULL(mstate->mux)) {
>                 kfree(mstate);

mstate is freed here...

> -               return ERR_PTR(err);
> +               return ERR_CAST(mstate->mux);

... and dereferenced here, leading to a use after free.

>         }
>
>         return mstate;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

