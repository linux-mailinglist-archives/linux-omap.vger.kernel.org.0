Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE6F822C743
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jul 2020 16:03:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726503AbgGXODw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Jul 2020 10:03:52 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:39071 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726686AbgGXODv (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 Jul 2020 10:03:51 -0400
Received: by mail-ed1-f67.google.com with SMTP id d18so7112498edv.6;
        Fri, 24 Jul 2020 07:03:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TpZJ/ISFXgu5jBP5FbghkLZJiBtFOhQ1zwiBpuz8Qz4=;
        b=lNMiaupolLT8jj2eQ/YGGJX4BsPAoan/6NmSNRIGDjDu9KxgSQG51p6k8ibLN1IROM
         OH0zfOqt07KVj266JNY/aWBGGuyJapYgdy4Nzb1VFv05NWGfZLH0fnkv/Epns4ZbrCDI
         6yeXQFrs/FrGDiDg8zCea+Q+FtkVEtW3S9rd4jsu7MVkThEkmiEbf4WFUYaMoVJGh7Ak
         i1Om+ol/ipvvSJhd2QeTvUag20QmNB64+fo+22SVKhJ0KRcRcKY5y2AGVFRMrbLtJSt8
         ztz8CeyQ+DR7OETa6KTWkooP8NR6Kl4WtV5TRlXnTp5TQyBslHqyZTrnEooPBQ14S923
         miSQ==
X-Gm-Message-State: AOAM531iphuIAkFtLknJb1Xu5sNMaP6K7JtJidIV0MfdLQfkTbTtmtsx
        WGkBhDa0QQzSM8yQwLwkfyU=
X-Google-Smtp-Source: ABdhPJwl2mU8KmEpK8AFkahBSmMJ4Kn3RsrN9Ktb6p4HbAcUPjkoroNdJBTxS8QkKijbtd+6pGmUwg==
X-Received: by 2002:a50:ed15:: with SMTP id j21mr9386366eds.246.1595599429024;
        Fri, 24 Jul 2020 07:03:49 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
        by smtp.googlemail.com with ESMTPSA id o17sm710946ejb.105.2020.07.24.07.03.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jul 2020 07:03:48 -0700 (PDT)
Date:   Fri, 24 Jul 2020 16:03:45 +0200
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
Subject: Re: [PATCH v2 00/29] *memory: Cleanup, improve and compile test
 memory drivers
Message-ID: <20200724140345.GB13472@kozik-lap>
References: <20200724074038.5597-1-krzk@kernel.org>
 <CAK8P3a2EAm=pxkU-AiucgDQyoMEGFOGqQBkVacWjoT7O9-PHkA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK8P3a2EAm=pxkU-AiucgDQyoMEGFOGqQBkVacWjoT7O9-PHkA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Jul 24, 2020 at 03:51:04PM +0200, Arnd Bergmann wrote:
> On Fri, Jul 24, 2020 at 9:41 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > Dear All,
> >
> > Changes since v1:
> > 1. Few new patches,
> > 2. Please see individual logs (per patch).
> >
> >
> > The drivers/memory directory contains generic code (of_memory.c) and a
> > bunch of drivers.  Changes to generic code were coming usually through
> > different trees with the driver code.
> >
> > Over last days, memory drivers grew in numbers but not necessarily in
> > quality.  They lacked compile testing and code cleanup.  Also lacked
> > maintainer.
> >
> > I would be happy to take care about this part.
> >
> > If there are no objections, I will collect the patches and push them
> > through arm-soc maintainers.
> >
> > Driver-specific changes in the patchset were only compile-tested. Tests
> > are welcome. The generic code was tested on ARMv7 Exynos based boards
> > with a exynos5422-dmc memory controller driver.
> 
> Looks all good. Can you send a pull request for the patches that you don't
> expect to need testing for, while you still wait for more feedback on the
> others?
> 
> As the merge window (and my vacation) is getting closer, I would like to
> have most of the patches for v5.9 queued up.

Sure, I'll prepare a pull.

Thanks!

Best regards,
Krzysztof

