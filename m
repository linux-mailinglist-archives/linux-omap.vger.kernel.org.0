Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21D2622C773
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jul 2020 16:10:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726962AbgGXOKz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Jul 2020 10:10:55 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39896 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726503AbgGXOKy (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 Jul 2020 10:10:54 -0400
Received: by mail-wr1-f68.google.com with SMTP id q5so8448135wru.6;
        Fri, 24 Jul 2020 07:10:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ImFzmFIKK2H2nANXLXd3qxiApcEikV7VM9V9o6SJtnk=;
        b=fJ0BT0GqvFrx/8ZA8+zrJ0I14lk17LoNZoS0WFgj1m3V0iHlklOfUZAVN2/R9jGpy0
         NNYJ6ohjKWcCmWtCCvK3SoW4+4YiJUNxZz6J3fxMSIbC8y0kK2cF97N2wcC8L46+jsoE
         bqxvyrRFYALa9CFodNHZ1QIb/kpTj2Q87pUcjmOzn1lGHuAe0xlEk0O7dF9DZ4rNG5my
         uHDm2lW32m7FNP2daNUhrafhItQMC58YbNXV/MS2FAXgCI1mbeZLViGIzgK+qRzzFCyC
         IPO5gajon1n8Cq9N/wj4UU81cSiO3jToajJmkDXRhx2kUdhGbc6P/JYo5YWdJJfEqDjI
         BCaw==
X-Gm-Message-State: AOAM5300P/lQB1NRhFm1vyBDAA1gK39YDy77L569Nco2/Yoi2W2DLqnO
        SHbeKYhhF4KOe4f3381rYHE=
X-Google-Smtp-Source: ABdhPJwnBVOwUfzxAP/bVrE3rgtnqO3Qtmb3o6jbq4oG5/rcbWYkcM90AMtLUkNyJ01GAbEXmxrCXg==
X-Received: by 2002:adf:f785:: with SMTP id q5mr7903553wrp.298.1595599852416;
        Fri, 24 Jul 2020 07:10:52 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
        by smtp.googlemail.com with ESMTPSA id t2sm7829924wmb.25.2020.07.24.07.10.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jul 2020 07:10:51 -0700 (PDT)
Date:   Fri, 24 Jul 2020 16:10:48 +0200
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
Subject: Re: [PATCH v2 12/29] memory: emif: Put constant in comparison on the
 right side
Message-ID: <20200724141048.GD14851@kozik-lap>
References: <20200724074038.5597-1-krzk@kernel.org>
 <20200724074038.5597-13-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200724074038.5597-13-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Jul 24, 2020 at 09:40:21AM +0200, Krzysztof Kozlowski wrote:
> Fixes checkpatch warning:
> 
>     WARNING: Comparisons should place the constant on the right side of the test
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/memory/emif.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied (and part of pull request to arm-soc).

Best regards,
Krzysztof
