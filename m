Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B98E22C7AC
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jul 2020 16:16:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726731AbgGXOQH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Jul 2020 10:16:07 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:47058 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726317AbgGXOQH (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 Jul 2020 10:16:07 -0400
Received: by mail-ed1-f66.google.com with SMTP id q4so3918636edv.13;
        Fri, 24 Jul 2020 07:16:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tY5Z6idGhGaqy3j7rWihq62kp3XpN6wVWhfnttBTXk8=;
        b=h8MXWKG9WHaJ1tVmsXRheG9WQ7W50vXWtrWDseBZPYUPQVZzT46PtzN+OV+aqY0HuU
         jdfV4wKLutrl/yB1ityAAIsqPaHArfSt/aDf+VD740HoA0Vea2wMxX/8z2WPsf/syzLh
         nyhrbzbWndrajaaKvgiwJOz2y8QYizRlO6xiBhdKigAoN7wPSHEVN4w+ZBUHxkveLbIL
         mfoF7WT40vW859Lgmavli21kQRgaBjMiGH8Vr1mXEIkHKQRKDUbNRCRWKFk2+m8+QmHX
         zTTv19IZTbLOwAk8n4zzYOfkFabU1JysRc/1WHTcU9IJ0WHJAeuG3vcfNWqvBEzqI7us
         ip7A==
X-Gm-Message-State: AOAM533OM7PF5oqawpCQWvXdGd4efln6p8TAG6ZV/PUshoplb3ES1cV3
        riGOS16OARKTVht1JPbHgjA6NVFD2zc=
X-Google-Smtp-Source: ABdhPJxbtj3fM+AjJ6hvcrUuIeJieCO2lk2efSggfaPTyqvT5VX+nS/1FqCch3ryhjUR2m21oTec/g==
X-Received: by 2002:a05:6402:1b1c:: with SMTP id by28mr9171688edb.270.1595600164984;
        Fri, 24 Jul 2020 07:16:04 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
        by smtp.googlemail.com with ESMTPSA id fi29sm758336ejb.83.2020.07.24.07.16.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jul 2020 07:16:04 -0700 (PDT)
Date:   Fri, 24 Jul 2020 16:16:01 +0200
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
Subject: Re: [PATCH v2 23/29] memory: pl172: Add GPLv2 SPDX license header
Message-ID: <20200724141601.GC10663@kozik-lap>
References: <20200724074038.5597-1-krzk@kernel.org>
 <20200724074038.5597-24-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200724074038.5597-24-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Jul 24, 2020 at 09:40:32AM +0200, Krzysztof Kozlowski wrote:
> Add GPLv2 license header and remove GPL boiler plate text.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/memory/pl172.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Applied (and part of pull request to arm-soc).

Best regards,
Krzysztof
