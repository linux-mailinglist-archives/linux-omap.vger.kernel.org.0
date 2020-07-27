Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F53122EF67
	for <lists+linux-omap@lfdr.de>; Mon, 27 Jul 2020 16:16:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729640AbgG0OQK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 27 Jul 2020 10:16:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730811AbgG0OQJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 27 Jul 2020 10:16:09 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FB55C061794
        for <linux-omap@vger.kernel.org>; Mon, 27 Jul 2020 07:16:09 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id g8so3153182wmk.3
        for <linux-omap@vger.kernel.org>; Mon, 27 Jul 2020 07:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=OfeIQ7fuyXMNX3+/WRYrDZ4OiAswU9YSpAGq0MJR3Qk=;
        b=Hn668tMsYylryOuBEj9y8mjBaum1BR6RWwK0ku3JWX59ZQxBLDwOmMgBAWCVcE5Z5b
         2c2kjrPGs/8IJv9fOZU6LTFL4823pdOCMHScobKcGB26/UvcwGxObmVQ+nfSYok3UVXV
         y8jZntEGdDqBkfACeuCFPpviPI1bF4y/WyHmV64TdjpUWYcx/vlwfaEo93Q7N19ALPuf
         dgxdM4C4v0gg99rHSeRt7zP0s+HePYSo+MBAgAcGaFshIYFkq6VtQN5LKuUuY+F7rHOv
         KZsvs2TP7WvjrxFzkPBs4rtVc8MNiIke1P073VcVxPYEWd1vNSH6mYgIlLs/YdC5xo03
         9vhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=OfeIQ7fuyXMNX3+/WRYrDZ4OiAswU9YSpAGq0MJR3Qk=;
        b=QV5uFzC9n3UYte5odVf1NEYitxS7IofsYv8k1Gfp5QgRosc1WA+T7vyMo9fDMQCc6z
         xelDz/yJSVuNZDzTSoWr5RwVm8osa8imDw3s5sWkl0usbjxBa7bzbttlqpjdvBs4qbrF
         xDoQdT1oRNdpo1JEQocuwUV0puQ5YPhz5AAczsSmpS/FzyKrQmhIz/cwKvI4ImpQPVlm
         MLHy8aDDgOWvCJo5yDjeYIln4mtETHRZaB1VM+4f+vAAaVCW1tCz9vqcMzKQEKo8uneS
         GsOEjLknVLJofnj4j/pePjNvbGBefrUij+FSFGDIN3nuHNkqeF+e2JT2K7pxWh7juuzq
         66WQ==
X-Gm-Message-State: AOAM531PhLLSlEqYb/CcMxwoGJsRC162T9139eFTCWmMMwbixluK3k+b
        LO5AgjLb9KqmK/t8XyDDTGc05g==
X-Google-Smtp-Source: ABdhPJwXT7IGhG6i2ax6YMsMfOUVYdF5VVpy+kpRsWP14/nCVLIlyPmNmTdhme4qI9qNmQgKjAM1MA==
X-Received: by 2002:a1c:a7d1:: with SMTP id q200mr2832327wme.131.1595859368016;
        Mon, 27 Jul 2020 07:16:08 -0700 (PDT)
Received: from dell ([2.27.167.73])
        by smtp.gmail.com with ESMTPSA id 32sm12369292wrn.86.2020.07.27.07.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 07:16:07 -0700 (PDT)
Date:   Mon, 27 Jul 2020 15:16:05 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc:     robh+dt@kernel.org, tony@atomide.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH] mfd: Replace HTTP links with HTTPS ones
Message-ID: <20200727141605.GW1850026@dell>
References: <20200722184711.GI3533@dell>
 <20200722192454.69591-1-grandmaster@al2klimov.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200722192454.69591-1-grandmaster@al2klimov.de>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, 22 Jul 2020, Alexander A. Klimov wrote:

> Rationale:
> Reduces attack surface on kernel devs opening the links for MITM
> as HTTPS traffic is much harder to manipulate.
> 
> Deterministic algorithm:
> For each file:
>   If not .svg:
>     For each line:
>       If doesn't contain `\bxmlns\b`:
>         For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
> 	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
>             If both the HTTP and HTTPS versions
>             return 200 OK and serve the same content:
>               Replace HTTP with HTTPS.
> 
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> ---
>  Documentation/devicetree/bindings/mfd/twl-family.txt | 2 +-
>  drivers/mfd/hi6421-pmic-core.c                       | 2 +-
>  drivers/mfd/lp873x.c                                 | 2 +-
>  drivers/mfd/lp87565.c                                | 2 +-
>  drivers/mfd/omap-usb-host.c                          | 2 +-
>  drivers/mfd/omap-usb-tll.c                           | 2 +-
>  drivers/mfd/smsc-ece1099.c                           | 2 +-
>  drivers/mfd/ti_am335x_tscadc.c                       | 2 +-
>  drivers/mfd/tps65086.c                               | 2 +-
>  drivers/mfd/tps65217.c                               | 2 +-
>  drivers/mfd/tps65218.c                               | 2 +-
>  drivers/mfd/tps65912-core.c                          | 2 +-
>  drivers/mfd/tps65912-i2c.c                           | 2 +-
>  drivers/mfd/tps65912-spi.c                           | 2 +-
>  include/linux/mfd/hi6421-pmic.h                      | 2 +-
>  include/linux/mfd/lp873x.h                           | 2 +-
>  include/linux/mfd/lp87565.h                          | 2 +-
>  include/linux/mfd/ti_am335x_tscadc.h                 | 2 +-
>  include/linux/mfd/tps65086.h                         | 2 +-
>  include/linux/mfd/tps65217.h                         | 2 +-
>  include/linux/mfd/tps65218.h                         | 2 +-
>  include/linux/mfd/tps65912.h                         | 2 +-
>  22 files changed, 22 insertions(+), 22 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
