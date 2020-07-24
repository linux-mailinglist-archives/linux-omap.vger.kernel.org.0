Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C43C22C796
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jul 2020 16:13:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726800AbgGXONY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Jul 2020 10:13:24 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:33496 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726799AbgGXONX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 Jul 2020 10:13:23 -0400
Received: by mail-wm1-f65.google.com with SMTP id f18so31269wmc.0;
        Fri, 24 Jul 2020 07:13:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lRR7zihfAPcF3BkRyL0Zid9zLwCKqRIandOIBJZScT8=;
        b=h/SEgQLoY7GjmkV+rIbu2mHS31vXrCw7A+e8uKQ97wiQZrnnnwoMF+0hhCx3ztMpcA
         A1OFg41PpMH6T2E76D82pV0tW3D+5BXiQ7X91ga6QNrVjK028bXaAXL0wDfKP8n2g0z4
         ZcBuvCagqCQriskMc4qgtbuC77n2ow0R5n4cy6iV9WGL/O72FfurITrcea/L9uToJn1D
         wV+b5pf7Ej5GyxG8nI0DytJCcYxQfa7Ef6+Kv1e8W4UgREmfb/eE/8jLq5Ieg3DEklwR
         gAauM/jP1Z7X0kH9jp6Xyfr5iIsZXpIHskBHq6For8zMaCRzIsK5+WIZA4C+uSp79Y4J
         nZPQ==
X-Gm-Message-State: AOAM531rv69x5/10yMaeW9lbB9SySXcfElFYDWwUCrrnUvuJphs+PmPt
        gxLYA7TOdwq+O6wyA3LNJ5E=
X-Google-Smtp-Source: ABdhPJwNei28bnjgISCwDv9tMLHh2SVTSriTtsDgwYvqcTiDeKj5wmxQxqltNmpJgPyq8t+kqT2nWQ==
X-Received: by 2002:a05:600c:21d3:: with SMTP id x19mr9270136wmj.174.1595599999842;
        Fri, 24 Jul 2020 07:13:19 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
        by smtp.googlemail.com with ESMTPSA id f197sm7820726wme.33.2020.07.24.07.13.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jul 2020 07:13:19 -0700 (PDT)
Date:   Fri, 24 Jul 2020 16:13:16 +0200
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
Subject: Re: [PATCH v2 18/29] memory: brcmstb_dpfe: Remove unneeded braces
Message-ID: <20200724141316.GI14851@kozik-lap>
References: <20200724074038.5597-1-krzk@kernel.org>
 <20200724074038.5597-19-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200724074038.5597-19-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Jul 24, 2020 at 09:40:27AM +0200, Krzysztof Kozlowski wrote:
> Single statement blocks don't need braces.  Fixes checkpatch warning:
> 
>     WARNING: braces {} are not necessary for single statement blocks
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>
> Acked-by: Markus Mayer <mmayer@broadcom.com>
> ---
>  drivers/memory/brcmstb_dpfe.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Applied (and part of pull request to arm-soc).

Best regards,
Krzysztof
