Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C81D4104340
	for <lists+linux-omap@lfdr.de>; Wed, 20 Nov 2019 19:24:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727711AbfKTSYD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 20 Nov 2019 13:24:03 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:34029 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726675AbfKTSYD (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 20 Nov 2019 13:24:03 -0500
Received: by mail-wm1-f65.google.com with SMTP id j18so5765438wmk.1;
        Wed, 20 Nov 2019 10:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ctnDyGHzcexXd+oP584wBl9d7IxFFJWy5ZdVe62LHoE=;
        b=VL1V16VFQxZ8XMocZhWLNpaqWaciq49VEDgTT20hTZ2yyx5FJ/yiZs0L9Sk1ZjgBEK
         ZQFwsDZMY4sQSyrSluU//F0W/SafTb60GaqzxPcYnMCkdKMrxsYxLv64vtUBgUSaN+vY
         rUZY5N3I4wP8T67v1xbS7tpahYg9M2b2njujgRU8RfCo8J3Gs5m7wX6mbOLkOnJtXhYm
         vFjCIbWxIQaLARPh3facBK7DFjrAUs4xeHXTq3ABYGeq5h8eJL1wagohiNRUwtReZ66b
         acMMAu4ox1rvuHa12fYh4vee2/XbX6/7G80yZi5E8zAG5bw9D6eqf2OrPEgCs1eE4PzL
         pNNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ctnDyGHzcexXd+oP584wBl9d7IxFFJWy5ZdVe62LHoE=;
        b=Rz9HBUBifPzbWEcXtL4j3WXHxkdQj6DFd7aLgpRWuvXg0+VmxTZrZM6dFMvsro957u
         AVVO60Wg06p44RYrjYQUAqp5CdvYnnSkJqSfGjd0gafSIeeQyXE+WTF0+VfSMkKiUYlJ
         gaiY1pmMU7/K+qjNtyziscTEHplCH+AsA8dzi4fuA8/mtjZowoDokpa5orwIvaAUZw7r
         AhL+69XD5VDoJp1a4/cxvVYhiJSHQek1fX8tL1o4D9ydrc5PCrY4cqxLf3vA5Fzy9SqR
         MVQ7Y8gjmsnnIJe/hoc3iOv4UAokQ8jnznmgiERQmBez+FnMj8mtQYE43r4vN9bA38N8
         Cq8g==
X-Gm-Message-State: APjAAAXcqhjYCZJ6KJXVKQiOFmPrZ0gPJleECcUYOodcISn97d79Zsnw
        IolJglrIsdLoOllz2ZliByM=
X-Google-Smtp-Source: APXvYqwt5vSje349iw69oqaDAMKixDjb6/bUVwR02G1KgTftbQDyi/rylGLW1hUSGLsUrQbk95hTpQ==
X-Received: by 2002:a1c:4907:: with SMTP id w7mr4848109wma.62.1574274241330;
        Wed, 20 Nov 2019 10:24:01 -0800 (PST)
Received: from giga-mm ([62.68.23.15])
        by smtp.gmail.com with ESMTPSA id g184sm154611wma.8.2019.11.20.10.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2019 10:24:00 -0800 (PST)
Date:   Wed, 20 Nov 2019 19:23:58 +0100
From:   Alexander Sverdlin <alexander.sverdlin@gmail.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        Hartley Sweeten <hsweeten@visionengravers.com>,
        Linus Walleij <linusw@kernel.org>,
        Imre Kaloz <kaloz@openwrt.org>,
        Krzysztof Halasa <khalasa@piap.pl>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Tony Lindgren <tony@atomide.com>,
        Barry Song <baohua@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH] ARM: Fix Kconfig indentation
Message-Id: <20191120192358.389c43da67a4d07c0d19b90d@gmail.com>
In-Reply-To: <20191120133734.12345-1-krzk@kernel.org>
References: <20191120133734.12345-1-krzk@kernel.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Krzysztof,

for the EP93xx part,

On Wed, 20 Nov 2019 21:37:34 +0800
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> Adjust indentation from spaces to tab (+optional two spaces) as in
> coding style with command like:
> 	$ sed -e 's/^        /\t/' -i */Kconfig
>

Acked-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm/Kconfig-nommu        | 10 +++++-----
>  arch/arm/Kconfig.debug        |  4 ++--
>  arch/arm/mach-ep93xx/Kconfig  |  8 ++++----
>  arch/arm/mach-ixp4xx/Kconfig  | 16 ++++++++--------
>  arch/arm/mach-mmp/Kconfig     |  2 +-
>  arch/arm/mach-omap1/Kconfig   | 14 +++++++-------
>  arch/arm/mach-prima2/Kconfig  |  6 +++---
>  arch/arm/mach-s3c24xx/Kconfig |  4 ++--
>  arch/arm/mach-s3c64xx/Kconfig |  6 +++---
>  arch/arm/plat-samsung/Kconfig |  2 +-
>  10 files changed, 36 insertions(+), 36 deletions(-)
> 

[...]

> diff --git a/arch/arm/mach-ep93xx/Kconfig b/arch/arm/mach-ep93xx/Kconfig
> index f2db5fd38145..bf81dfab7f1b 100644
> --- a/arch/arm/mach-ep93xx/Kconfig
> +++ b/arch/arm/mach-ep93xx/Kconfig
> @@ -126,10 +126,10 @@ config MACH_MICRO9S
>  	  Contec Micro9-Slim board.
>  
>  config MACH_SIM_ONE
> -        bool "Support Simplemachines Sim.One board"
> -        help
> -          Say 'Y' here if you want your kernel to support the
> -          Simplemachines Sim.One board.
> +	bool "Support Simplemachines Sim.One board"
> +	help
> +	  Say 'Y' here if you want your kernel to support the
> +	  Simplemachines Sim.One board.
>  
>  config MACH_SNAPPER_CL15
>  	bool "Support Bluewater Systems Snapper CL15 Module"


-- 
Alexander Sverdlin.
