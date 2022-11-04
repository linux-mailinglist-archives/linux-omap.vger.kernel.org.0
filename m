Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7616061A110
	for <lists+linux-omap@lfdr.de>; Fri,  4 Nov 2022 20:33:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229619AbiKDTdG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Nov 2022 15:33:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbiKDTdE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 4 Nov 2022 15:33:04 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62D1143AF8
        for <linux-omap@vger.kernel.org>; Fri,  4 Nov 2022 12:33:01 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id k22so5354522pfd.3
        for <linux-omap@vger.kernel.org>; Fri, 04 Nov 2022 12:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qGzpjn13dVlcuHa3QfKLMJS0aiybXjJ4fJgb8JKEdS0=;
        b=iEpoNfjUSPmVInj+LqC03wXnbIzcRmhgeZwez+hMwOhChOZJiBRq1S5KF7dMUzdhRs
         TyZtq+Iautgmig3VjOBjK5N+qtPcRucs5Pnz6722c6ahsdN0q3KtKaVo4h/ffyDrOnmQ
         1+NqMwX5+Gai6f6NTzw8VnZqzwpHHkzEdI//U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qGzpjn13dVlcuHa3QfKLMJS0aiybXjJ4fJgb8JKEdS0=;
        b=XNnwiBkMK8hCKnoi/wL+wsHAanrN+cNZzM+Ao6dBW/n8F/bRLvFAa6u48YcSD7lY5w
         wlngG9toY0gveyYGycHHB7RJj2l3K3A0cagWO0HrNjrJutxPUa1YDRaHzzPEuMgyq9XB
         W+XZO2D7G7ZKxgpGj653WIvMfhSRcXKm2TuNksfJQfHLMw1+EDixW0nzsOfsP4Qtlh9S
         N99gWcBDMF3rksCfYNMZdbzaYLWY6vMe/ChMqKdcPhyPXnMzz1jH37wXsGACJIyM168R
         BFe5/x/i7neR9ipFPZNIrqCQIHYtZjGyL5XSvcnc13JBFt/r3T90xt5GNpKVL0GXBLay
         oceg==
X-Gm-Message-State: ACrzQf1ad98sLDaTxmtYzFIamndH7VdYA3OeLZwsENVmSEnn5BB6NdTB
        SVvIRPxsR34o9yiiRdgChbA/1w==
X-Google-Smtp-Source: AMsMyM5FVrooXJN4dw9eC1GsB+jA3C1bDK2l4NoOTcLVgrzfxIY3HF8QnF9dZnGI1NjpBiY+EHAnTQ==
X-Received: by 2002:a05:6a00:1309:b0:535:d421:1347 with SMTP id j9-20020a056a00130900b00535d4211347mr37370950pfu.5.1667590381090;
        Fri, 04 Nov 2022 12:33:01 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id n4-20020a63e044000000b0044e8d66ae05sm105054pgj.22.2022.11.04.12.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 12:33:00 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Fri, 4 Nov 2022 12:33:00 -0700
To:     Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-kernel@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
        Roger Quadros <rogerq@kernel.org>, linux-omap@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Coverity: gpmc_is_valid_waitpin(): Control flow issues
Message-ID: <202211041233.4D45359E7@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20221104 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Wed Nov 2 10:02:39 2022 -0400
    89aed3cd5cb9 ("memory: omap-gpmc: wait pin additions")

Coverity reported the following:

*** CID 1527139:  Control flow issues  (NO_EFFECT)
drivers/memory/omap-gpmc.c:1048 in gpmc_is_valid_waitpin()
1042     	spin_unlock(&gpmc_mem_lock);
1043     }
1044     EXPORT_SYMBOL(gpmc_cs_free);
1045
1046     static bool gpmc_is_valid_waitpin(u32 waitpin)
1047     {
vvv     CID 1527139:  Control flow issues  (NO_EFFECT)
vvv     This greater-than-or-equal-to-zero comparison of an unsigned value is always true. "waitpin >= 0U".
1048     	return waitpin >= 0 && waitpin < gpmc_nr_waitpins;
1049     }
1050
1051     static int gpmc_alloc_waitpin(struct gpmc_device *gpmc,
1052     			      struct gpmc_settings *p)
1053     {

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1527139 ("Control flow issues")
Fixes: 89aed3cd5cb9 ("memory: omap-gpmc: wait pin additions")

Thanks for your attention!

-- 
Coverity-bot
