Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FBFF5139BB
	for <lists+linux-omap@lfdr.de>; Thu, 28 Apr 2022 18:26:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349975AbiD1Q2N (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 28 Apr 2022 12:28:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349982AbiD1Q2M (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 28 Apr 2022 12:28:12 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BE537C168
        for <linux-omap@vger.kernel.org>; Thu, 28 Apr 2022 09:24:54 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id r11-20020a05600c35cb00b0039409c1111bso2368795wmq.3
        for <linux-omap@vger.kernel.org>; Thu, 28 Apr 2022 09:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ZBNilhdp8prpQa+JL5u382He4l9cdozRaGzqWFtu518=;
        b=yvRSElnTsQ2hlRVm9A4FlZPetkTviLJJCGxKJijs9J5jRs3cIHyYMi+wviNLHYpwUc
         atsqEYIiSR+qEaSyeiNeFba0sXiixQvqgscEZ3cKKhjKX6jlyGvIBVL5akgSrQF4Y4vf
         aPU/sUUiFwjR2jZvQCKJiyI1yc/NQm/X+Cph2UfvlkYBEuIbLNoyQneanoVo+VsGnEUh
         3M0eDEoGU5DxGmi0gRMFrMkCywohl2yR6/Oa2xFEKKN4EW+szxjzH3LdPKBT9ad6FJKH
         G4V6jO+VxXXA/nYJDHxwsPSGrSpgD1jd4ucT9utE+5IUhKfWXEvPxoU1fbmbRWZlLYlW
         3IaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ZBNilhdp8prpQa+JL5u382He4l9cdozRaGzqWFtu518=;
        b=lbMmHb3hXZjVbuXn339cp2mQcLZYCrvXTLFd10PSDP85sdfnUVnV4BSloOSJuGDEZp
         L983ydNfv/4DNHwmgKVO65mE0eVT7t2RTUxuDBJ8iM1mtRw4prVo00d1kLtVCj8t4J/D
         mCzuFy6cNQpIETeLLMgCk25rYzXqf3O3K2UleqqaziDMZGCfLxve0HNZrXrTUq5agCiR
         8EPuiI5YkkIbQyNuczxgP6GwvnHmMhgzA4m++/dDmjSLarvYKMNFeEotGj3oPzKbCOh2
         pTx3hmn3klmsg3CkA3gesVliQw8jrQnD0ZDpuO3pnhun7NY/hEDDVE0LDEHmDCznwfze
         d7Gg==
X-Gm-Message-State: AOAM532wrDGGC9wLh0vXVjvgY4yw8PWfycYF/6qBdVdFiIqGLffT6eOk
        s1wYYHvc0aMemuOaltJvEVysJ4lKxEoh9Q==
X-Google-Smtp-Source: ABdhPJzYByydBQKI/N90jgsD7SevKdOpmb95UVrAFJEoN3acGiObpPYkaPO6ytp1rot8Q9z3FHXRpA==
X-Received: by 2002:a05:600c:4f02:b0:394:25c:d2a2 with SMTP id l2-20020a05600c4f0200b00394025cd2a2mr8492857wmq.145.1651163092908;
        Thu, 28 Apr 2022 09:24:52 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id v9-20020a05600c12c900b00393fbe6fbdcsm4891109wmd.45.2022.04.28.09.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 09:24:52 -0700 (PDT)
Date:   Thu, 28 Apr 2022 17:24:50 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 2/2] mfd: twl4030: Make twl4030_exit_irq() return void
Message-ID: <Ymq/0lqiX8ADo7lE@google.com>
References: <20220113101430.12869-1-u.kleine-koenig@pengutronix.de>
 <20220113101430.12869-3-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220113101430.12869-3-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 13 Jan 2022, Uwe Kleine-König wrote:

> If twl4030_exit_irq() returns an error, the effect is that the caller
> (twl_remove()) forwards the error to the i2c core without unregistering
> its dummy slave devices. This only makes the i2c core emit another
> error message and then it still removes the device.
> 
> In this situation it doesn't make sense to abort the remove cleanup and not
> unregister the slave devices. So do that. Then return value is actually
> unused and twl4030_exit_irq() can better be changed to return no value at
> all.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/mfd/twl-core.c    | 6 +-----
>  drivers/mfd/twl-core.h    | 2 +-
>  drivers/mfd/twl4030-irq.c | 7 ++-----
>  3 files changed, 4 insertions(+), 11 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
