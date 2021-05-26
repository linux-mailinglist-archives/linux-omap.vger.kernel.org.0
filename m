Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 837A8391AB6
	for <lists+linux-omap@lfdr.de>; Wed, 26 May 2021 16:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234977AbhEZOum (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 May 2021 10:50:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234893AbhEZOum (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 26 May 2021 10:50:42 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1B0FC061574
        for <linux-omap@vger.kernel.org>; Wed, 26 May 2021 07:49:10 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id r12so1460471wrp.1
        for <linux-omap@vger.kernel.org>; Wed, 26 May 2021 07:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=4yzCAHgH1guS2Y/0Pu674rbF+XBExPOSLFaI2JjAr9o=;
        b=RzcyMIr4so58tJ/yAtZJpcVi6jfoQjSa78q5+zCUvWhjT8ApP+sC9MGWT0SslIRymM
         OOUsuUiB8Q8miGAkRv6t1l+V8AguLEnIXkCilfhI3WdUAj4rIjVvfDCX0QeOAob479qK
         llkmocaP7/SJypt9g96oKJW63enU3yMMfT/6g2bBXJx0X5rlXpoiaDXRmtnelLQgKLng
         uoIX7m5cRWPdlqNsFOxbphLBe65vbj17DoyKPkAg5PIZ2oXvNrBu4xcoKH3yRYeE5dHi
         05Xs/YfPmdCUnBObgfyfvRQ5yUEINyxULpVaHrph4sFjMl3cfWrFsTyI7GgjlDCuGMH5
         PWTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=4yzCAHgH1guS2Y/0Pu674rbF+XBExPOSLFaI2JjAr9o=;
        b=tlHOLbKWu1/Odb8qE3K2+CxlDznrFKd7yJtOry41GDetFRRTHDptYzp3Yc5ee1AdDj
         ys9lytoeP28VaXDNja8bdQVM4Q65v8cImKAFB67Ijzf6ddrX4fIucCDRfjV9Fh7kaA0j
         sIRK/OGToOZuxoTNvkbH7+tKv69ctUjpA+Wr/u5huUyrx1JrsuNgWmYaFiyWWeUlJxCy
         Z32GbWfHoKoqh3QJp/31aF8/UINaMHma1TCEQloSYSvqgc/DGgTj9WNnQdtljCzeIquN
         Bo/SDMI3ffxA1m+JOhVsy/J/bDlYbodr4BW4ci0ranuAc77UplIYwACfe+CwEt5uXk4h
         GWuw==
X-Gm-Message-State: AOAM531nRZSn8JI9YAlQTs5G5Tko4MSJ4amx+DQUdvWX/L+lLvMbIENf
        3yymBQEuxJOHsjsKZ+TxiYZjjA==
X-Google-Smtp-Source: ABdhPJymhCb8+adtmqlgsuAxsyUXeg3vOV/bRVZzi9wBHWjkqTj0A6AdeBSSxDHabNoMiIbDMcdDvg==
X-Received: by 2002:adf:e9c9:: with SMTP id l9mr32872343wrn.85.1622040549363;
        Wed, 26 May 2021 07:49:09 -0700 (PDT)
Received: from dell ([91.110.221.223])
        by smtp.gmail.com with ESMTPSA id t204sm7201207wmg.38.2021.05.26.07.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 07:49:08 -0700 (PDT)
Date:   Wed, 26 May 2021 15:49:07 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Support Opensource <support.opensource@diasemi.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        patches@opensource.cirrus.com,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [RESEND PATCH v2 06/13] mfd: wm831x: Correct kerneldoc
Message-ID: <20210526144907.GC543307@dell>
References: <20210526124711.33223-1-krzysztof.kozlowski@canonical.com>
 <20210526124711.33223-7-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210526124711.33223-7-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, 26 May 2021, Krzysztof Kozlowski wrote:
65;6200;1c
> Correct kerneldoc function name to fix W=1 warning:
> 
>   drivers/mfd/wm831x-core.c:121: warning:
>     expecting prototype for wm831x_reg_unlock(). Prototype was for wm831x_reg_lock() instead
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> 
> ---
> 
> Changes since v1:
> 1. Add Ack
> ---
>  drivers/mfd/wm831x-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This one has been fixed already:

https://lore.kernel.org/lkml/20210520120820.3465562-2-lee.jones@linaro.org/

> diff --git a/drivers/mfd/wm831x-core.c b/drivers/mfd/wm831x-core.c
> index bcef08f58fb3..c31809b17547 100644
> --- a/drivers/mfd/wm831x-core.c
> +++ b/drivers/mfd/wm831x-core.c
> @@ -109,7 +109,7 @@ static int wm831x_reg_locked(struct wm831x *wm831x, unsigned short reg)
>  }
>  
>  /**
> - * wm831x_reg_unlock: Unlock user keyed registers
> + * wm831x_reg_lock: Unlock user keyed registers
>   *
>   * The WM831x has a user key preventing writes to particularly
>   * critical registers.  This function locks those registers,

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
