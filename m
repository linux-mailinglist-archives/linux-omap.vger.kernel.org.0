Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C20FD54E9B6
	for <lists+linux-omap@lfdr.de>; Thu, 16 Jun 2022 21:01:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229672AbiFPTB0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 Jun 2022 15:01:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230304AbiFPTB0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 16 Jun 2022 15:01:26 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8778B22B0C
        for <linux-omap@vger.kernel.org>; Thu, 16 Jun 2022 12:01:24 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id a10so2138496pju.3
        for <linux-omap@vger.kernel.org>; Thu, 16 Jun 2022 12:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=6u9SuyoV4rwZynHy4OzwKp1LTmBPADb0OFV7qZFLCkI=;
        b=Lu1tccTFCp52f5i1RIGjUqBjdtLHs/MHuUa5fbz+X+tCWxVHJKunkPoc0qePz5PqRD
         BowKIZ09zVLCYLVZ8CA1WxW3BxhmRNNS6LDe0Z7me4GQ0wRhUUkgnDo5/d3VL9R8ickU
         LXby5nlsmu2rnzoMl7nDzsFhDhM6EIZtkolKaoRf4JtPgvUU3zZYY0Ur3LAxD1BYu8zl
         i/2jrI2hNYlKJf4mDrbTQ1EBeSUsorGE/3NANq3HXE0P+Mec9b13MnQT+xCC0y0E+iv1
         NjVcNfw4+pDD4uyDTeRA8jNGD/YwtESZ5lzOajk/T9WwGOW1VKjZJi4jeXPnECRQ0xPA
         lPmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=6u9SuyoV4rwZynHy4OzwKp1LTmBPADb0OFV7qZFLCkI=;
        b=gN605V8TYc8KM6plbGc/uzArstLjnjXOdf0oBt56wvey6eK1/BQCIU1+ssEqHCST9e
         NKShsL3JOO4LBoQLMAEE0q4hdpXMEc4hTCPaPtDY5138ap3BPBmBeRc25XHybQjZebJJ
         4aY2Ir9nMM7/qvDYjvln45XC9AueXsgKG6JT97lzq4lgttiuZFjaeU5x8wat9wvTGXDg
         DEUJYFVNUY7xi8B2iNkVYKafZRX60f2AIIGzCzm0vYSnr2IWIvdADLJ9uQwpqvfzbKpl
         mSw/mtS4LjZpiAhzNCQi1O41ny9Cw+Ie60oSP1RvXGYOYpfUi8N15V+QT1tc0a/Sirxe
         /nrQ==
X-Gm-Message-State: AJIora9u3OHjPOvLxurwFOPTrNonIxmzTedqIyxSFZUfrMdpWd6ArMWY
        IeUclb5WI4YJ89tUJJz4GBGCOg==
X-Google-Smtp-Source: AGRyM1uq3Hk4Vr4YBrZMpmZHfBiHq4rsjfZbCVhb+0PBLPOcPnMAYD9KCp2TFf7KiKOUEVk0Eqejgg==
X-Received: by 2002:a17:90a:2b08:b0:1ea:bc00:7383 with SMTP id x8-20020a17090a2b0800b001eabc007383mr6481972pjc.139.1655406084004;
        Thu, 16 Jun 2022 12:01:24 -0700 (PDT)
Received: from google.com ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id w1-20020a623001000000b0050dc762816fsm2114903pfw.73.2022.06.16.12.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 12:01:23 -0700 (PDT)
Date:   Thu, 16 Jun 2022 20:01:16 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH] mfd: twl: Remove platform data support
Message-ID: <Yqt9/Ol16GveVIIN@google.com>
References: <20220614152148.252820-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220614152148.252820-1-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, 14 Jun 2022, Uwe Kleine-König wrote:

> There is no in-tree machine that provides a struct twl4030_platform_data
> since commit e92fc4f04a34 ("ARM: OMAP2+: Drop legacy board file for
> LDP"). So assume dev_get_platdata() returns NULL in twl_probe() and
> simplify accordingly.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/mfd/twl-core.c  | 323 +---------------------------------------
>  include/linux/mfd/twl.h |  55 -------
>  2 files changed, 5 insertions(+), 373 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
