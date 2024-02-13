Return-Path: <linux-omap+bounces-567-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F71B85366E
	for <lists+linux-omap@lfdr.de>; Tue, 13 Feb 2024 17:46:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81CA51C216CB
	for <lists+linux-omap@lfdr.de>; Tue, 13 Feb 2024 16:46:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 588445FDBA;
	Tue, 13 Feb 2024 16:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RIBg7TJh"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6D45FBB1
	for <linux-omap@vger.kernel.org>; Tue, 13 Feb 2024 16:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707842776; cv=none; b=BVCBZTJK0Da6s57V89awomkwMw2vKwl5QkBK2pvzSKti0auYxw6IF29aIJBiN5f7EZVzIOkZMJ4vbCweFRmp+88kpvDI1oH6zoSe8K4OVpoF9dLG2VrRLt4s2tS5Mgw8+ZdAj0qoy7u80OGOraU8XizJahpZ7H6ySSUbV/0ZsjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707842776; c=relaxed/simple;
	bh=iky2a6jPh/6u+aNJeAECgbPoRRGW2BdoL+yVwEyQyDM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QMCkyAzt7c7J1xgagLxqu6ZjDXnPxO5RG6dlTLuEVyf88BzQSnIuaYegYIKFDmKTAk/Ik/jTkgOWpr6M/uKZPEyJ/OE5GDXhNeTP4iZYWYdTg2aYqJsNvRZGidIeMe14P0m0BiRb7Kp2c3nkjkGUvLeEaa8t+LlO28jyPtg05tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RIBg7TJh; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6077789e054so15327717b3.1
        for <linux-omap@vger.kernel.org>; Tue, 13 Feb 2024 08:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707842773; x=1708447573; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YOE/aPZQLDSvvefVZc+MnaNJZep0jtE2YOT3eUgZmMI=;
        b=RIBg7TJhgEITnum4l1q+69Zzkimpu8sWaWza7pXUeN1onibBuCF1ucGe4WWniaKzh5
         CGMwd0VYpUAk8b5YrvNY1LMVGQAvZJ0uqw0nKnG4A+3ua/SUlXmjfr1ZJSyUioaZcb7p
         E7//oj7PRroCUssyDtgEzzUAloLfeUeKI86jcd6FDG+kcZi6Eayel/MIwqKKq7WHu0ra
         D4oYZLMd/p8RRhd2bpIQIfRZcicAQVN5qQXiAznLHdmjoM1390tTQHYjMhd7mxM2nKzF
         bs+f2+IazW/WDmaB0MeSaJwhC6SmdgaMrKY28CVnq24CNw1Rtx86YStSZZTSL4qFBFHA
         6sKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707842773; x=1708447573;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YOE/aPZQLDSvvefVZc+MnaNJZep0jtE2YOT3eUgZmMI=;
        b=CDyJQBMMkdVyVjuPuNFC4ttfqzUV80TX9qatlo6EPz33d1CgM1DlbLSRfAxRrPcg8S
         usaj0WVJGdaXjceyV1kXMi3ksJMyE2W6HckryJP7wV5yXNCeG4poZHzLvtZvPEZr2MSD
         sWMDUHp42RA3EvrUF3ifLlXqU+ERDecCqzeCY3n1ACzdrRF7EeDFBJ4OrOY2mPo/a03w
         4eYHaL1I2AjfA+yMpc5Wf+7SrTGjFyFL8Mftx3WQZYQDn/feGeZ1s6WZNuSvhUdXJ7j5
         ijlLEeCJIa3lDuF58vhwznhxwaz1dQz7VkdM4rjto6D3z38noIzxCgjffkWOqE0xjjNM
         w/Yw==
X-Forwarded-Encrypted: i=1; AJvYcCX3xWJIhm9XkO8W3IpGI0wrkGd3c70rv9vGNLhxKmlFrCKMTrR9wmfIp+1CgeolhRIdsbvKRET8XAPG8d9T/x+vf0fgNoq6nwU4wA==
X-Gm-Message-State: AOJu0YxGyQW2S83BCmG1fLvyuF5uQ0kWODtfQl8JFeFJH7SWCvmwJn3I
	rx4j/zWM5407E0Kle24R1hZY6JgApxdDbzRvujddbLJLsjreUgx97yMZUowiAGhbuN41IUo9Y8f
	7+PTea3ianf911zYlO51G71YkRKyddHRMeIMQbw==
X-Google-Smtp-Source: AGHT+IFFO+Dy+3XrsHCjBcpnmLnwTYcYT3K4J6OU/Y8a+rRHuP4bfMcqyWgEDaLriXjzuKgL68ZIlP/tW0ilV5ThV/8=
X-Received: by 2002:a81:9209:0:b0:607:8edd:b5f7 with SMTP id
 j9-20020a819209000000b006078eddb5f7mr1515430ywg.49.1707842773094; Tue, 13 Feb
 2024 08:46:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125-mmc-proper-kmap-v1-0-ba953c1ac3f9@linaro.org>
In-Reply-To: <20240125-mmc-proper-kmap-v1-0-ba953c1ac3f9@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 13 Feb 2024 17:45:37 +0100
Message-ID: <CAPDyKFohCgDfZZni0V1ux7hX7W5k=zWGtrysK6jNSdia1QiYTQ@mail.gmail.com>
Subject: Re: [PATCH 0/7] mmc: Try to do proper kmap_local() for scatterlists
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>, Ming Lei <ming.lei@redhat.com>, 
	Arnd Bergmann <arnd@arndb.de>, Nicolas Pitre <nico@fluxnic.net>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Adrian Hunter <adrian.hunter@intel.com>, Angelo Dureghello <angelo.dureghello@timesys.com>, 
	linux-mmc@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Jan 2024 at 15:37, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> It was brought to our attention that some MMC host drivers
> are referencing sg_virt(sg) directly on scatterlist entries,
> which will not perform buffer bouncing for CONFIG_HIGHMEM
> pages that reside in highmem.
>
> See the following mail from Christoph and the discussion:
> https://lore.kernel.org/linux-mmc/20240122073423.GA25859@lst.de/
>
> This means that bugs with highmem pages can go unnoticed
> until an actual highmem page is finally used and not bounced,
> resulting in things like unpredictable file corruption.
>
> Attempt to fix this by amending all host controllers
> calling sg_virt() for PIO to instead do proper mapping
> and unmapping of the scatterlist entry, possibly bouncing
> it from highmem if need be.
>
> More complicated patches are possible, the most obvious
> to rewrite the PIO loops to use sg_miter_[start|next|stop]()
> see for example mmci.c, but I leave this refactoring as
> a suggestion to each device driver maintainer because I
> can't really test the patches.
>
> All patches are compile-tested except the m68k one,
> sdhci-esdhc-mcf.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Thanks for helping out with this! Applied for next!

Kind regards
Uffe


> ---
> Linus Walleij (7):
>       mmc: davinci_mmc: Map the virtual page for PIO
>       mmc: moxart-mmc: Map the virtual page for PIO
>       mmc: mvsdio: Map the virtual page for PIO
>       mmc: mxcmmc: Map the virtual page for PIO
>       mmc: omap: Map the virtual page for PIO
>       mmc: sdhci-esdhc-mcf: Map the virtual page for swapping
>       mmc: sh_mmcif: Map the virtual page for PIO
>
>  drivers/mmc/host/davinci_mmc.c     | 10 ++++++++--
>  drivers/mmc/host/moxart-mmc.c      |  3 ++-
>  drivers/mmc/host/mvsdio.c          |  3 ++-
>  drivers/mmc/host/mxcmmc.c          | 23 +++++++++++++++--------
>  drivers/mmc/host/omap.c            |  7 ++++++-
>  drivers/mmc/host/sdhci-esdhc-mcf.c |  3 ++-
>  drivers/mmc/host/sh_mmcif.c        | 22 ++++++++++++++++++----
>  7 files changed, 53 insertions(+), 18 deletions(-)
> ---
> base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
> change-id: 20240125-mmc-proper-kmap-f2d4cf5d1756
>
> Best regards,
> --
> Linus Walleij <linus.walleij@linaro.org>
>

