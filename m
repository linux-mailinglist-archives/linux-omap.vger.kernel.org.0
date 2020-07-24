Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1718722C75F
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jul 2020 16:09:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726424AbgGXOJw convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-omap@lfdr.de>); Fri, 24 Jul 2020 10:09:52 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:34569 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726366AbgGXOJw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 Jul 2020 10:09:52 -0400
Received: by mail-wm1-f66.google.com with SMTP id g10so8681297wmc.1;
        Fri, 24 Jul 2020 07:09:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=MFZnPQ4CSgoYpNdbp9qv3P2bsVqa9A4NUrenC+UIBjE=;
        b=MDJvaLnjH4D9lyGU9GXKH8GZZoBDCs40hCrZAUpzUlfeysqi/XCNL+IRGz1zzaLppt
         iWyre8ACCOPlZQfz4cKa6JkJ1q3MzdGNv6ON/e0ru/rlPhBA0FhKDX1S8hOGDyvILnaI
         70EJP3dm7IsHWCQV3nxPkfWuNFjx2uzc2c7yn0CRnSpcTjf25DF4TCIGrmVOkxEq3UVv
         UeLpgXa+PmIl1T5QvCwVY/I63aFLnHKj1Af7Qfrh6K2pwVHcizytIjXuZOWUxWZjrf5t
         cHBw2DHm79GUKzWJT18Gom/h128K+Bb6tLvLrSsZqQczrrNYVOMuK8bP+S6iCEC2V/tN
         G4pw==
X-Gm-Message-State: AOAM533RMv8fd/srBHm9ZesG2GyrwKTdYi2KlWKn/MUbloGGKTf551Q8
        l8Kiyjr6nEHt4hSwjUJFbeU=
X-Google-Smtp-Source: ABdhPJxhDIHHNprIfr5jTTC4+LEgNsGYWxkjN3HfyODAjUnEqQ0fZsCbDmYOnt/yMZ0aD3Uq66R6NQ==
X-Received: by 2002:a1c:7d81:: with SMTP id y123mr6347917wmc.87.1595599790123;
        Fri, 24 Jul 2020 07:09:50 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
        by smtp.googlemail.com with ESMTPSA id c7sm1522358wrq.58.2020.07.24.07.09.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jul 2020 07:09:49 -0700 (PDT)
Date:   Fri, 24 Jul 2020 16:09:45 +0200
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
Subject: Re: [PATCH v2 03/29] memory: omap-gpmc: Include <linux/sizes.h> for
 SZ_16M
Message-ID: <20200724140945.GA14851@kozik-lap>
References: <20200724074038.5597-1-krzk@kernel.org>
 <20200724074038.5597-4-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20200724074038.5597-4-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Jul 24, 2020 at 09:40:12AM +0200, Krzysztof Kozlowski wrote:
> The driver uses SZ_16M which is defined in include/linux/sizes.h.  On
> ARM it was pulled by other headers but its inclusion is necessary for
> compile testing on other architectures.
> 
> This fixes build error when compile testing on i386 architecture:
> 
>     drivers/memory/omap-gpmc.c: In function ‘gpmc_cs_remap’:
>     drivers/memory/omap-gpmc.c:961:12: error: ‘SZ_16M’ undeclared (first use in this function)
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/memory/omap-gpmc.c | 1 +

Applied (and part of pull request to arm-soc).

Best regards,
Krzysztof
