Return-Path: <linux-omap+bounces-215-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B363D821FCC
	for <lists+linux-omap@lfdr.de>; Tue,  2 Jan 2024 17:58:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3EEFE1F22A96
	for <lists+linux-omap@lfdr.de>; Tue,  2 Jan 2024 16:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EE9715AE8;
	Tue,  2 Jan 2024 16:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UPpJZkpx"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED46515AD2
	for <linux-omap@vger.kernel.org>; Tue,  2 Jan 2024 16:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dafe04717baso5984580276.1
        for <linux-omap@vger.kernel.org>; Tue, 02 Jan 2024 08:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704214667; x=1704819467; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6lkwZlHjclN19Rwf5IYw4AMq86HYSJFhCb8JMsFAIPU=;
        b=UPpJZkpxzhiyWMNYG+dgurWjmqnNqb3j76xOVTi6F9r1hmFzn1V0JwNlr1HWnlKosK
         UX9HwYp7hlvpk4Oi0ozpR34tpIr3GdQWdYaARwm+Y0I4/jPltJ4w3QAfBj3SrPdYdrXd
         bq+Cm9OidyL9tuPnZ+qufgCnB9U2b1Ds8lMionvfQIeUbihCGDoivjzN0ew1fucVTuLv
         I3ZfVC5JImdtRuo05CpCLfjICJx6br9Bjknn5RvuuMrVL0SEs2UfWAn/Q+rZRevRgGUf
         f8D9Eq0HsTadXSsez/AbuOdzqpO/fWTUUXNpODpSBLhHEsgVXtUOxKP7PaiysKN++FjU
         vAPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704214667; x=1704819467;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6lkwZlHjclN19Rwf5IYw4AMq86HYSJFhCb8JMsFAIPU=;
        b=kE/xTEx8MkvtJEWNuBznodkBWsJ2pfsy3UieFG/yzW3TEh+kKlWhBQMzm21ZXflVtA
         6FBJcQvbJ8rYimXStolcJGxAbUH4iAuSPEujI8HY+XUR92BaOm7ksnbB590TzJvHxVhA
         OFhAeO5v6aFGQ8AwlkBnhDWue95XHq25uKVnDVcnvfieoWO/F9dEGhy9VDxupYnAqIiK
         UHnpO0UcsAYVAzJOps2u1TU+VgeqK3WEbX/YIKhEfD1ewnVX37bagJI4af5W4jEhr2pa
         +VblU74peKvAyiy5S32tr/Sgq/H10LFy3my/RwJQM10UdRxx5ptYB4ki28v8oU9OLSAr
         U2+A==
X-Gm-Message-State: AOJu0YxGZhQENvdoQ7NKbOzMtv8zJkPz4Fx1BdLLIdY3u1EDpR2dL78b
	1xCBEJSVxPTo1g3LrYGkNLnFL53epXZbeFOQLYfxv4rpeHOrjA==
X-Google-Smtp-Source: AGHT+IG07EVnmujPDoWoEL/03bVeRyqPVW15d4o+D+Wq3HHcSy5BZm2s8ed27/+BxM/LbavRY2acnfZcQyB7Pii1FFE=
X-Received: by 2002:a25:7353:0:b0:db7:dacf:6fc0 with SMTP id
 o80-20020a257353000000b00db7dacf6fc0mr9136506ybc.72.1704214667022; Tue, 02
 Jan 2024 08:57:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231220135950.433588-1-pbrobinson@gmail.com>
In-Reply-To: <20231220135950.433588-1-pbrobinson@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 2 Jan 2024 17:57:11 +0100
Message-ID: <CAPDyKFonZ-gd8cjcWcGHxx2UjAy7F0UC+HgDKTixSUJ62vwBvg@mail.gmail.com>
Subject: Re: [PATCH 1/2] mmc: sdhci_am654: Fix TI SoC dependencies
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Faiz Abbas <faiz_abbas@ti.com>, 
	Kishon Vijay Abraham I <kishon@ti.com>, Tony Lindgren <tony@atomide.com>, linux-mmc@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 Dec 2023 at 14:59, Peter Robinson <pbrobinson@gmail.com> wrote:
>
> The sdhci_am654 is specific to recent TI SoCs, update the
> dependencies for those SoCs and compile testing. While we're
> at it update the text to reflect the wider range of
> supported TI SoCS the driver now supports.
>
> Fixes: 41fd4caeb00b ("mmc: sdhci_am654: Add Initial Support for AM654 SDHCI driver")
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>

Applied for next (and patch2/2), thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/Kconfig | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> index 58bd5fe4cd25..24ce5576b61a 100644
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -1041,14 +1041,15 @@ config MMC_SDHCI_OMAP
>
>  config MMC_SDHCI_AM654
>         tristate "Support for the SDHCI Controller in TI's AM654 SOCs"
> +       depends on ARCH_K3 || COMPILE_TEST
>         depends on MMC_SDHCI_PLTFM && OF
>         select MMC_SDHCI_IO_ACCESSORS
>         select MMC_CQHCI
>         select REGMAP_MMIO
>         help
>           This selects the Secure Digital Host Controller Interface (SDHCI)
> -         support present in TI's AM654 SOCs. The controller supports
> -         SD/MMC/SDIO devices.
> +         support present in TI's AM65x/AM64x/AM62x/J721E SOCs. The controller
> +         supports SD/MMC/SDIO devices.
>
>           If you have a controller with this interface, say Y or M here.
>
> --
> 2.43.0
>

