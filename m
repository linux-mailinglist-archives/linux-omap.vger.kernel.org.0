Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF3192471AD
	for <lists+linux-omap@lfdr.de>; Mon, 17 Aug 2020 20:32:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391117AbgHQScI convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-omap@lfdr.de>); Mon, 17 Aug 2020 14:32:08 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:45388 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391005AbgHQSby (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 17 Aug 2020 14:31:54 -0400
Received: by mail-ed1-f68.google.com with SMTP id di22so13086971edb.12;
        Mon, 17 Aug 2020 11:31:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=hBUcN4OkcyXAP5E6a2eouoPSQBhcXpldM+aQp0PGfhg=;
        b=Wxw0reRYJZkCVPfAowO4O4pAFXEBNn7QFVUeipNpad9I99gIC0menVzRUcLV4NulTp
         lJgjGpEvREs2R2FNytWyihWdtFxW/yLa55QGdM5q3zIBKojJWNlwoUDlY6U29xR7pg75
         2nNjkn8igKWGTXZkfZYzqUMalmO2X4UQlZg8OTFGP+PpI4nq0yaERCzjpcrQq2Td48k6
         G66tACCRKyItIx+vxGSEKIz0NkmPTfQ0vAUgYKRGrCntmKWDQJ+SDUheZI/Naz3L09B1
         rlW60ZohwVke53fuWOKV7FLYe93FL63IN5Hi6FVxs125ShQqMzIUoNw1ENE8qTlnOEYK
         eGZA==
X-Gm-Message-State: AOAM532Ji+LccBPqYSP3I7RgmSIC9K2abp0VBV/uPG7I/sZj0MUIGNrn
        ieMlbUJBWdB652RYci9g42LxzYpJxeFhKhKb
X-Google-Smtp-Source: ABdhPJwJFBPzF7Ip4mHFHwCJ7i6D0iGFtLdNnjjZFvxi/KEFgJtC4lqELj6xSQmWu9o+PqLjXrbWlQ==
X-Received: by 2002:a05:6402:3196:: with SMTP id di22mr15802828edb.193.1597689112098;
        Mon, 17 Aug 2020 11:31:52 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
        by smtp.googlemail.com with ESMTPSA id lc10sm14962158ejb.22.2020.08.17.11.31.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Aug 2020 11:31:51 -0700 (PDT)
Date:   Mon, 17 Aug 2020 20:31:48 +0200
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
Subject: Re: [RFT v2 02/29] memory: omap-gpmc: Remove unused file-scope
 phys_base and mem_size
Message-ID: <20200817183148.GB3464@kozik-lap>
References: <20200724074038.5597-1-krzk@kernel.org>
 <20200724074038.5597-3-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20200724074038.5597-3-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Jul 24, 2020 at 09:40:11AM +0200, Krzysztof Kozlowski wrote:
> The file-scope variables phys_base and mem_size are assigned in
> gpmc_probe() but never read.
> 
> This fixes build error when compile testing on x86_64 architecture:
> 
>     drivers/memory/omap-gpmc.c:246:24: error: conflicting types for ‘phys_base’
>      static resource_size_t phys_base, mem_size;
>     In file included from arch/x86/include/asm/page.h:12:0,
>                      from arch/x86/include/asm/thread_info.h:12,
>                      from include/linux/thread_info.h:38,
>                      from arch/x86/include/asm/preempt.h:7,
>                      from include/linux/preempt.h:78,
>                      from include/linux/spinlock.h:51,
>                      from include/linux/irq.h:14,
>                      from drivers/memory/omap-gpmc.c:12:
>     arch/x86/include/asm/page_64.h:12:22: note: previous declaration of ‘phys_base’ was here
>      extern unsigned long phys_base;
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/memory/omap-gpmc.c | 4 ----
>  1 file changed, 4 deletions(-)

Applied to drivers/memory tree.

Best regards,
Krzysztof
