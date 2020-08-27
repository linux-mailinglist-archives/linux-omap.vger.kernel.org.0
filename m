Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8EEA2547A9
	for <lists+linux-omap@lfdr.de>; Thu, 27 Aug 2020 16:53:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727933AbgH0Owp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 27 Aug 2020 10:52:45 -0400
Received: from mail-ej1-f67.google.com ([209.85.218.67]:41532 "EHLO
        mail-ej1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728005AbgH0NWY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 27 Aug 2020 09:22:24 -0400
Received: by mail-ej1-f67.google.com with SMTP id b17so7613944ejq.8;
        Thu, 27 Aug 2020 06:21:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9cQD7wAgJiQgJMdSQQKLTlBAdfqypodW7qJTxcpDRmw=;
        b=gVQhTuMDb4/MGUgwUuEdPgqUUvHx3fDXYxX4h4xZ1S1pLjTiLx+11I+eJKvcmRX2CX
         U/QwBOx/84oAu478QHGuTf2Eb0pCIQw5e4Wh5PWH4yTQoYHgwcYsNWB8EnKEXT0wFioq
         dszpiT+4U+ZosjTqSqf7t9bl9lQnR0GmtVa8ucoiRxW4KPhkmvIOzbA+c9XFsm094H0y
         purubijExH77Vt8Yt3m/i8zvY+1+SRchDlltD+hbg3GvahCmcgyg8rDC6eQ6qFHoTFb3
         9Ew+zBnOIi7/m1Mx4N1MMTj2xMFx7faEZxBXv5QZzAfYdmyO+0+KYvYn2t79fN2S0I/Y
         lAog==
X-Gm-Message-State: AOAM532nvk5l6bbB1qgQlQ3MlJu2Z8v6EDGJiySSiK5OPyWYw8woEvFb
        5NeGtbnCB0Q3rTZrPPOCVKY=
X-Google-Smtp-Source: ABdhPJwazJ2g/jt884NVPC8RDwVYh0aN8Mt2Z0KMMHwsD/fNTetgub13Tlz0b0/r9jsl8CYZHPsumQ==
X-Received: by 2002:a17:906:69d5:: with SMTP id g21mr20033703ejs.461.1598534517518;
        Thu, 27 Aug 2020 06:21:57 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
        by smtp.googlemail.com with ESMTPSA id qk7sm1927426ejb.17.2020.08.27.06.21.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Aug 2020 06:21:56 -0700 (PDT)
Date:   Thu, 27 Aug 2020 15:21:54 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     rogerq@ti.com, tony@atomide.com, ladis@linux-mips.org,
        bbrezillon@kernel.org, peter.ujfalusi@ti.com,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] memory: omap-gpmc: Fix build error without CONFIG_OF
Message-ID: <20200827132154.GB4384@kozik-lap>
References: <20200826125919.22172-1-yuehaibing@huawei.com>
 <20200827125316.20780-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200827125316.20780-1-yuehaibing@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Aug 27, 2020 at 08:53:16PM +0800, YueHaibing wrote:
> If CONFIG_OF is n, gcc fails:
> 
> drivers/memory/omap-gpmc.o: In function `gpmc_omap_onenand_set_timings':
> omap-gpmc.c:(.text+0x2a88): undefined reference to `gpmc_read_settings_dt'
> 
> Add gpmc_read_settings_dt() helper function, which zero the gpmc_settings
> so the caller doesn't proceed with random/invalid settings.
> 
> Fixes: a758f50f10cf ("mtd: onenand: omap2: Configure driver from DT")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
> v3: zero gpmc_settings
> v2: add gpmc_read_settings_dt() stub
> ---
>  drivers/memory/omap-gpmc.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
> index cd9e80748591..e026b4cd3612 100644
> --- a/drivers/memory/omap-gpmc.c
> +++ b/drivers/memory/omap-gpmc.c
> @@ -2310,6 +2310,10 @@ static void gpmc_probe_dt_children(struct platform_device *pdev)
>  	}
>  }
>  #else
> +void gpmc_read_settings_dt(struct device_node *np, struct gpmc_settings *p)
> +{
> +	memset(p, 0, sizeof(struct gpmc_settings));

sizeof(*p) but if patch is otherwise ok (got review/ack) then I can fix
it while applying.

If there is resend, please fix it as well.

Best regards,
Krzysztof

