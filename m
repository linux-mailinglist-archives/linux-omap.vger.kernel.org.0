Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9EDD22C788
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jul 2020 16:12:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbgGXOMt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Jul 2020 10:12:49 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45823 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726366AbgGXOMt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 Jul 2020 10:12:49 -0400
Received: by mail-wr1-f67.google.com with SMTP id z18so4892151wrm.12;
        Fri, 24 Jul 2020 07:12:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cc+wwSkekWOme10xVBGF0aXqqYrHUB/C10pgM4XtzPc=;
        b=YCoFsvWtO06bTDAeKtmxn9Z0TksW9J0TdkjSRD394lexJ0TeA83QEL9Ygq1BCqaE+v
         +ywnE4JOOMqs7OPNcfKB0iv8BLJWIURx7SXp1NdCCcpqu5ENJ4wjKX5nIfDhP3b4ZxlK
         Pfe5ysNgVj9Zz60UT9Bj0Vfwn/0QOz0/OfLTDKc3PVhqG2kPBYeGVzCIKPkgAk+tBQHW
         OC8sxvFNwEAXa2hPu8aOFVv/zr7TvIW06nlcYY1dNQnuLPZxirAUMQOj39GVVZPARTo6
         h+OBORicBAa7HNBatljddVV5YG85ZV3n0/Vl9XbBAkdkRxc/TI4KUHTKEaZ/hcjSRCsj
         wJxA==
X-Gm-Message-State: AOAM531bR/FBgnH3BJJ8RXctgomj5WpkIAl0pqDnkABYofjWCmeJ3UZ7
        vM/67uiEbfi1582aQxorxdg=
X-Google-Smtp-Source: ABdhPJzb92ZFgrzcOvTIpMmOj/fOviym2KrJ1TSCcCS6V5gmnV3tVzH55kWuJOcw1qCs0CDJUM1AZw==
X-Received: by 2002:adf:e486:: with SMTP id i6mr8653949wrm.258.1595599967200;
        Fri, 24 Jul 2020 07:12:47 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
        by smtp.googlemail.com with ESMTPSA id a22sm7569527wmj.9.2020.07.24.07.12.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jul 2020 07:12:46 -0700 (PDT)
Date:   Fri, 24 Jul 2020 16:12:43 +0200
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
Subject: Re: [PATCH v2 15/29] memory: ti-emif-pm: Fix cast to iomem pointer
Message-ID: <20200724141243.GG14851@kozik-lap>
References: <20200724074038.5597-1-krzk@kernel.org>
 <20200724074038.5597-16-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200724074038.5597-16-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Jul 24, 2020 at 09:40:24AM +0200, Krzysztof Kozlowski wrote:
> Cast pointer to iomem memory properly to fix sparse warning:
> 
>     drivers/memory/ti-emif-pm.c:251:38: warning: incorrect type in argument 1 (different address spaces)
>     drivers/memory/ti-emif-pm.c:251:38:    expected void const volatile [noderef] __iomem *addr
>     drivers/memory/ti-emif-pm.c:251:38:    got void *
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/memory/ti-emif-pm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied (and part of pull request to arm-soc).

Best regards,
Krzysztof
