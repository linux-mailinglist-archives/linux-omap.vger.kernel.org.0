Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4039622C719
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jul 2020 15:53:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbgGXNxS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Jul 2020 09:53:18 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:39904 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726366AbgGXNxR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 Jul 2020 09:53:17 -0400
Received: by mail-ed1-f65.google.com with SMTP id d18so7087978edv.6;
        Fri, 24 Jul 2020 06:53:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=wHJM9ZNtQPPVokcpsCbdp5GsMdp3YHUZAH6Xvy0iTKM=;
        b=ZmSpJpw2lApyVrUgRqpAUwKUgIOfM2GzFdGJzvpAfcYRY+m4ZKqAs7TcGXbTz50gja
         TrGnK6EET1TpeImy5mJDGjOg1+iHlgDommFFTqu+GXYYaB9iPt778nKPo/SIajcckhii
         QamtcK1frWOq3xjeEV/4TnwQrBApGjWErmkC9Mb1N4Ahxb0BvWQfJzZGY0fzb+Iqljw7
         aOuKo9+bQ2VugslwL9CdrlemzvVJubYOOBZDMWn9OBpm90KFi5PTSsiNT+hmEMbXRAUZ
         RnJeDD5yNJn4g8X+fAwVApnqvb24+E37u5uZON/bZp+tC9ZbiXhpQevgWNCJ4J7xvDXR
         giqg==
X-Gm-Message-State: AOAM530oPE28Nn3bwcpiBYP6idNM2AlhvYpxRKz5AXGyPjj5C3PyTlJo
        n0/SSedOd4deJUEVsPR/QJ8=
X-Google-Smtp-Source: ABdhPJxQatp/16zc2FQj9pOk/YrBsNh8emgbUp3CY5xYniVLl6YIl4y8V3SdvTEG1nFeCNjq8TSdOA==
X-Received: by 2002:a50:dacf:: with SMTP id s15mr9448134edj.136.1595598795606;
        Fri, 24 Jul 2020 06:53:15 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
        by smtp.googlemail.com with ESMTPSA id x10sm737481ejc.46.2020.07.24.06.53.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jul 2020 06:53:14 -0700 (PDT)
Date:   Fri, 24 Jul 2020 15:53:11 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Olof Johansson <olof@lixom.net>,
        Markus Mayer <mmayer@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Roger Quadros <rogerq@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Kukjin Kim <kgene@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC..." 
        <linux-mediatek@lists.infradead.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2 05/29] memory: jz4780-nemc: Do not enable by default
 on every compile test
Message-ID: <20200724135311.GA13472@kozik-lap>
References: <20200724074038.5597-1-krzk@kernel.org>
 <20200724074038.5597-6-krzk@kernel.org>
 <CAK8P3a0h3dMRH_wuGX5dZ5znnx+EHJKYwQeZ9aB7cFGudo6vmw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK8P3a0h3dMRH_wuGX5dZ5znnx+EHJKYwQeZ9aB7cFGudo6vmw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Jul 24, 2020 at 03:45:37PM +0200, Arnd Bergmann wrote:
> On Fri, Jul 24, 2020 at 9:41 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > When compile testing, enable the driver by default only on MIPS
> > architecture.
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> >
> > ---
> >
> > Changes since v1:
> > 1. New patch
>  @@ -141,7 +141,7 @@ config FSL_IFC
> >
> >  config JZ4780_NEMC
> >         bool "Ingenic JZ4780 SoC NEMC driver"
> > -       default y
> > +       default y if MIPS
> >         depends on MIPS || COMPILE_TEST
> 
> 
> Actually I think this should be 'default MACH_INGENIC',
> and probably also 'depends on MACH_INGENIC || COMPILE_TEST'.

Makes sense, especially for default.

For the depends, there is also MTD_NAND_JZ4780 (depending on
JZ4780_NEMC) which also requires MIPS. I could fix both then.

Best regards,
Krzysztof

