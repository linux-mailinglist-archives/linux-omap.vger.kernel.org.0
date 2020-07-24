Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC20222C768
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jul 2020 16:10:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726807AbgGXOKK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Jul 2020 10:10:10 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:33243 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726366AbgGXOKK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 Jul 2020 10:10:10 -0400
Received: by mail-wm1-f68.google.com with SMTP id f18so25494wmc.0;
        Fri, 24 Jul 2020 07:10:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aPHm37IZRgA/amT3EPPehfRSaWXic6JYRk5gRysDkoc=;
        b=VE1I+84IID54wCSau/K5PjmqM/82zRvZwfXU4lcvL7LK9uMX7YkTugT1BC0MnNwWCT
         xUdWkdWeXE2vqQWaX13FTGsio1XV/daMQCLTL//RKBUmMxCJunE+4bshqe+orsxikq+Y
         WJGksu4aIeDNYkWJMkxiOZls5bFxd9AgV1o13f7d7fgUt8x9Quok7xC5G6YaBpr1O7VP
         qdB4Op+S3USKuREJ2ggtXzVeWZZ/GHPMSMCdpFrHV1PTIgf4mw+IzGs0GajhyuzoHKUx
         gTFCCn46We1QJucAHM37MRFZhqoT3UwM4jowCmrB73n5KD3i5rssBUt3asOzqE190eCv
         0Qag==
X-Gm-Message-State: AOAM530z0LxQciSwiic31FjMIfLQKrXyNfnxoQwaKcG4VMCeR79Obgho
        fUgDpSDXhyZyG+4itpEY+co=
X-Google-Smtp-Source: ABdhPJxfB0bPNVbscbBvv9JuuBbV8/5DemmExvuD4yLm15XS6dENBt0gY4DQecjXWS/RnEAQqovpFQ==
X-Received: by 2002:a7b:ce02:: with SMTP id m2mr8651192wmc.96.1595599807908;
        Fri, 24 Jul 2020 07:10:07 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
        by smtp.googlemail.com with ESMTPSA id z15sm681061wrn.89.2020.07.24.07.10.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jul 2020 07:10:07 -0700 (PDT)
Date:   Fri, 24 Jul 2020 16:10:04 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Markus Mayer <mmayer@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Florian Fainelli <f.fainelli@gmail.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Roger Quadros <rogerq@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Kukjin Kim <kgene@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2 04/29] memory: ti-aemif: Rename SS to SSTROBE to avoid
 name conflicts
Message-ID: <20200724141004.GB14851@kozik-lap>
References: <20200724074038.5597-1-krzk@kernel.org>
 <20200724074038.5597-5-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200724074038.5597-5-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Jul 24, 2020 at 09:40:13AM +0200, Krzysztof Kozlowski wrote:
> SS conflicts with compile test build on i386:
> 
>     drivers/memory/ti-aemif.c:40:0: warning: "SS" redefined
>     In file included from arch/x86/include/uapi/asm/ptrace.h:6:0,
>                      from arch/x86/include/asm/ptrace.h:7,
>                      from arch/x86/include/asm/math_emu.h:5,
>                      from arch/x86/include/asm/processor.h:13,
>                      from include/linux/mutex.h:19,
>                      from include/linux/notifier.h:14,
>                      from include/linux/clk.h:14,
>                      from drivers/memory/ti-aemif.c:12:
>     arch/x86/include/uapi/asm/ptrace-abi.h:23:0: note: this is the location of the previous definition
>      #define SS   16
> 
> Use more descriptive name (SSTROBE) to avoid the conflict.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/memory/ti-aemif.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 

Applied (and part of pull request to arm-soc).

Best regards,
Krzysztof
