Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 416F2248588
	for <lists+linux-omap@lfdr.de>; Tue, 18 Aug 2020 15:00:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726145AbgHRNAL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 18 Aug 2020 09:00:11 -0400
Received: from mail-ej1-f68.google.com ([209.85.218.68]:38464 "EHLO
        mail-ej1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726353AbgHRNAJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 18 Aug 2020 09:00:09 -0400
Received: by mail-ej1-f68.google.com with SMTP id d6so21950884ejr.5;
        Tue, 18 Aug 2020 06:00:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cSuu9gAxM27c2HwTJectOIw2FPcVqL/0YfKReIGIkYc=;
        b=rGEeaq7RWTVaYFGXNtSzYYcL9qmzfrO5zPdhfD8SzyGV0YO7xHfx9Hvm1kShhyeiJy
         xpd3jM/6VsQDdMYiEfnPrRW3DpIBe6/YmjHxX+J0AhnCkv/KnsOGC8V5TxuypnYC3oAE
         PpsQN4Uj5rVhLiKA9jXhsE1vn5ktet2ECj9jffUgo8XohW+bwykS6NHAF3XPYuxxSPqH
         rSOAVBtk/ljCtMGs0J9ISF/l6JUXnV7SY0Mb1cBcuj9LM8ZboabmAn4wtk7qBRs+Mu9w
         0UqMUY479fdLGaZy34bWXJmZULQHE6FYrA2HDUyDebZ1j10xyqeGCyK4A0MRklGk5eJA
         ZGKQ==
X-Gm-Message-State: AOAM533AImzvUo27Jrcn7VqviUk/EYkbJnfFTL89jQnykU3ixJHVBI6d
        Dgb1JMmktsIcB8lEUszz8P0=
X-Google-Smtp-Source: ABdhPJwosAfMR3xhPweMt01uCeyYoJLV2QMUo+QcmEWYgOxTHeYkdfhDkqT+piq9CgYRa7o137chOw==
X-Received: by 2002:a17:907:372:: with SMTP id rs18mr19344022ejb.146.1597755606437;
        Tue, 18 Aug 2020 06:00:06 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
        by smtp.googlemail.com with ESMTPSA id h22sm16631871ejf.100.2020.08.18.06.00.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Aug 2020 06:00:05 -0700 (PDT)
Date:   Tue, 18 Aug 2020 15:00:03 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     rogerq@ti.com, tony@atomide.com, bbrezillon@kernel.org,
        ladis@linux-mips.org, peter.ujfalusi@ti.com,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] memory: omap-gpmc: Fix build error without CONFIG_OF
Message-ID: <20200818130003.GA20340@kozik-lap>
References: <20200818125338.58148-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200818125338.58148-1-yuehaibing@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Aug 18, 2020 at 08:53:38PM +0800, YueHaibing wrote:
> If CONFIG_OF is n, gcc fails:
> 
> drivers/memory/omap-gpmc.o: In function `gpmc_omap_onenand_set_timings':
> omap-gpmc.c:(.text+0x2a88): undefined reference to `gpmc_read_settings_dt'
> 
> Add helper function to fix this.
> 
> Fixes: a758f50f10cf ("mtd: onenand: omap2: Configure driver from DT")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/memory/omap-gpmc.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
> index ce0e7e2d7cff..332bb4580817 100644
> --- a/drivers/memory/omap-gpmc.c
> +++ b/drivers/memory/omap-gpmc.c
> @@ -1176,6 +1176,7 @@ struct gpmc_nand_ops *gpmc_omap_get_nand_ops(struct gpmc_nand_regs *reg, int cs)
>  }
>  EXPORT_SYMBOL_GPL(gpmc_omap_get_nand_ops);
>  
> +#ifdef CONFIG_OF


Hi,

Instead add empty stub for gpmc_read_settings_dt() in existing #ifdef
section - around line 2314.  Less ifdefs and actually seems to me
appropriate place to group !OF stubs.

Best regards,
Krzysztof

