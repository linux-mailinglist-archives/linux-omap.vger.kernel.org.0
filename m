Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 623094B2754
	for <lists+linux-omap@lfdr.de>; Fri, 11 Feb 2022 14:46:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350638AbiBKNqD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Feb 2022 08:46:03 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:60712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238948AbiBKNqC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 11 Feb 2022 08:46:02 -0500
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 219029E;
        Fri, 11 Feb 2022 05:46:02 -0800 (PST)
Received: by mail-qv1-f53.google.com with SMTP id k4so8528841qvt.6;
        Fri, 11 Feb 2022 05:46:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CCeqREQrm7xo0u1AbZjJuOIyAbx1RCJixWtPhAYUNI8=;
        b=o/cHJ23g+d0QLIC9ml4SHWC9MNceYFWeQWPuSkDmpSIrl6gm6ZmUqZWBBVkFzMUUsa
         2k4kHY+mK8sJF1OKnOWQZK/1BaF+F/DibfXYliDnZIR2xxUtj/Qt8VaZIvZuCxTB+VyB
         V4uiai9ETtPcPqFSSPguqRKdKpsmupLgzj4Yyn9GX9JL4o43d7nLtKt6N51ERr7CW6JW
         LaL90qKNmuMfkLwmVTIhhI6hWnwyhiKTeUtHr1qdmI3p8mvb2RcGe0r1fA+15eAQrsjQ
         HltAYCsXR2pUKqmTOk+8QoEvkcNwa0m8SK6/+kGy/Fa5nx3kP2daceMQj5SlT4TE7Rr0
         7T1w==
X-Gm-Message-State: AOAM533KJXwEokMEef9lAnVIDawo3FEE82ePDOyhM31AgxcK73nk7teV
        gfK3MAyJHf5z/GlX2DsOCg==
X-Google-Smtp-Source: ABdhPJx6rBzUKpSbRYlUu/2B/qnvnIy9kQiRCUNFOOH1Eek7JLOn2Nb+fmH7VBFcILEdI66FTSzOiA==
X-Received: by 2002:ad4:5b8c:: with SMTP id 12mr1080124qvp.91.1644587161255;
        Fri, 11 Feb 2022 05:46:01 -0800 (PST)
Received: from robh.at.kernel.org ([2607:fb90:20dc:156b:8f01:9329:d9ca:df6f])
        by smtp.gmail.com with ESMTPSA id s28sm10811681qkm.53.2022.02.11.05.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 05:46:00 -0800 (PST)
Received: (nullmailer pid 268791 invoked by uid 1000);
        Fri, 11 Feb 2022 13:45:58 -0000
Date:   Fri, 11 Feb 2022 07:45:58 -0600
From:   Rob Herring <robh@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        Tero Kristo <t-kristo@ti.com>
Subject: Re: [PATCH 2/3] clk: ti: Drop legacy compatibility clocks for am4
Message-ID: <YgZolpJ5jRScTSjg@robh.at.kernel.org>
References: <20220203085618.16043-1-tony@atomide.com>
 <20220203085618.16043-3-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220203085618.16043-3-tony@atomide.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 03 Feb 2022 10:56:17 +0200, Tony Lindgren wrote:
> We no longer have users for the compatibility clocks and we can drop them.
> These are old duplicate clocks for what we using.
> 
> Cc: devicetree@vger.kernel.org
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  drivers/clk/ti/Makefile          |   3 +-
>  drivers/clk/ti/clk-43xx-compat.c | 225 -------------------------------
>  drivers/clk/ti/clk-43xx.c        |   5 +-
>  drivers/clk/ti/clkctrl.c         |  16 +--
>  drivers/clk/ti/clock.h           |   3 -
>  include/dt-bindings/clock/am4.h  |  98 --------------
>  6 files changed, 6 insertions(+), 344 deletions(-)
>  delete mode 100644 drivers/clk/ti/clk-43xx-compat.c
> 

Acked-by: Rob Herring <robh@kernel.org>
