Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A9422304DA
	for <lists+linux-omap@lfdr.de>; Tue, 28 Jul 2020 10:01:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727933AbgG1IBo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 Jul 2020 04:01:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727798AbgG1IBn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 28 Jul 2020 04:01:43 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A34DC0619D2
        for <linux-omap@vger.kernel.org>; Tue, 28 Jul 2020 01:01:43 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id g8so5224293wmk.3
        for <linux-omap@vger.kernel.org>; Tue, 28 Jul 2020 01:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=cl2Y8+UeWIcQOUYHyUUm8iQ4vz6rg42HiHq1hxLCw94=;
        b=oCVoNr4kSknIwQv3QH4akfeIoF76h2vCWItpOPuXMROvtzNhlOUkNZRagI4gdLajNw
         RxjSKaXPQI4/t7yG0CrEaPLhKW/Jt9QeQpl/G86mVfsmRJyFnzLo/ne49H/CbXMaFpmD
         SWEIp154/Ts7nokLagaabgCoWku8W3STV9vKCANkJXhd1828B+jnGJCl7k9Ca3s3DPrJ
         C43BHQ6WnL3OgCABznwVyW0rVqxMVknS1QuVu0cMDmp2bWQN3F0fd7ksSDBa2VvWT7RG
         8LiWYi7kdneV8IQxoFsb5k/HU+BziWUyE4Gc6fZw/TcUojYHrwG136tTElP6HqIUyoSd
         EHsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=cl2Y8+UeWIcQOUYHyUUm8iQ4vz6rg42HiHq1hxLCw94=;
        b=sm6t64lmJfs0s8WssLtGTyvkavdQO8tQdmDB75I9/379e4XR7qVcVZNT4Oh3nXp0YL
         a8rBdKowS+ZYgwzzD1gKBz3eQVFX0T+Ys4kFabOvlBT0I+cLWLHxp/FN2pDDJph8lwu0
         9K8PfBC4mZy/b1Gbdu+KLseo476z5Ilm/FN+IazjgB6TJjbElrabTt7iqgVT16mguyjw
         NmcUz1CHtO1p4BT+47KfLmBzc3SqSd+Yv3/wCdJGQuXTMdO1qav5AGfeZ8a8TLWN10Ra
         6KGAO0t5zTcMzT4nuDjLZY6nlTEkXkTaCPO9d+p2xxESiAf7tsLaawP+NYRPdrB5+iPS
         si1w==
X-Gm-Message-State: AOAM531Et21aQMhxQYGEV20wHZgFBoMKO6em33PKyK9Gj/ePPhxTbCJ8
        DvqxVoT4IPk/vQaqirbeeuWfTA==
X-Google-Smtp-Source: ABdhPJy2s4pTiLQuSH77Tv8Uf2Ai9QVNv+BvYoHvXsKhFioKgFWMC0nrd5lw6fWG+BjGNFcqWsIu8g==
X-Received: by 2002:a1c:b156:: with SMTP id a83mr2930705wmf.189.1595923301783;
        Tue, 28 Jul 2020 01:01:41 -0700 (PDT)
Received: from dell ([2.27.167.73])
        by smtp.gmail.com with ESMTPSA id t11sm15904778wrs.66.2020.07.28.01.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2020 01:01:41 -0700 (PDT)
Date:   Tue, 28 Jul 2020 09:01:39 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        David Lechner <david@lechnology.com>,
        Tony Lindgren <tony@atomide.com>,
        Roger Quadros <rogerq@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [RESEND PATCH v2] mfd: syscon: Use a unique name with
 regmap_config
Message-ID: <20200728080139.GI1850026@dell>
References: <20200727211008.24225-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200727211008.24225-1-s-anna@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, 27 Jul 2020, Suman Anna wrote:

> The DT node full name is currently being used in regmap_config
> which in turn is used to create the regmap debugfs directories.
> This name however is not guaranteed to be unique and the regmap
> debugfs registration can fail in the cases where the syscon nodes
> have the same unit-address but are present in different DT node
> hierarchies. Replace this logic using the syscon reg resource
> address instead (inspired from logic used while creating platform
> devices) to ensure a unique name is given for each syscon.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
> Hi Arnd,
> Lee is looking for your review on this patch. Can you please
> review and provide your comments.
> 
> This is a resend of the patch that was posted previously, rebased
> now onto latest kernel.
> 
> v2: https://patchwork.kernel.org/patch/11353355/
>  - Fix build warning reported by kbuild test bot
> v1: https://patchwork.kernel.org/patch/11346363/
> 
>  drivers/mfd/syscon.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
