Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AE3D4B275C
	for <lists+linux-omap@lfdr.de>; Fri, 11 Feb 2022 14:46:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350640AbiBKNqh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Feb 2022 08:46:37 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:60868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238948AbiBKNqg (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 11 Feb 2022 08:46:36 -0500
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DB959E;
        Fri, 11 Feb 2022 05:46:35 -0800 (PST)
Received: by mail-qt1-f180.google.com with SMTP id j12so9064128qtr.2;
        Fri, 11 Feb 2022 05:46:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=R6+WUAYDlY5tYmODtm0Xa+7YGMUi04VXe95rtKDzSEU=;
        b=kMJqbKXjkeJhDNq3X0kE0FUBKj4qHkwVaHMux3yyanyFUkjy4RLLtrjfUuJjL+06Yj
         0enJ6KvPSSHYUDIN3q6aUh2A9P8Z1umUT6ubMLm+DptoBt5X8JuBsAUGyrmEmu/27vDu
         Rc3qW5kW71/5s0xLbyRF0Wlv9bwmc3DRpwKOwO63lJUOAnvfp49C7RdjRWSqejeJWi8N
         ARsMbPUZpt3c3k8BR5Alg7X31WfKx7EhXhsCuteTKYvTG5k08bX79t//X6YW42Foilhb
         Pko2jGluW9bJfHfittmMWbYJL+ihLjvw0oP9g2eI/dTckYmoCe4OtmKEqe+aMlP9TJE2
         5PtQ==
X-Gm-Message-State: AOAM531mhkweKi+3OSzmCGUJun5hv5kl8UNDgu6xO2CXva3JnujLPLFM
        QKl0KOanrJokv7mvK5/pTl17mj4MmA==
X-Google-Smtp-Source: ABdhPJwD6DwUHU8cN2Pqz0iUItgdyKpmy+Ut6pRYRcM6FJ3ucBTwJRZPprf5uQDwKarIR1J/oiOhbQ==
X-Received: by 2002:a05:622a:115:: with SMTP id u21mr1115002qtw.197.1644587194414;
        Fri, 11 Feb 2022 05:46:34 -0800 (PST)
Received: from robh.at.kernel.org ([2607:fb90:20dc:156b:8f01:9329:d9ca:df6f])
        by smtp.gmail.com with ESMTPSA id q22sm13223553qtw.52.2022.02.11.05.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 05:46:33 -0800 (PST)
Received: (nullmailer pid 269720 invoked by uid 1000);
        Fri, 11 Feb 2022 13:46:30 -0000
Date:   Fri, 11 Feb 2022 07:46:30 -0600
From:   Rob Herring <robh@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org
Subject: Re: [PATCH 3/3] clk: ti: Drop legacy compatibility clocks for dra7
Message-ID: <YgZotiDWXSl49KHR@robh.at.kernel.org>
References: <20220203085618.16043-1-tony@atomide.com>
 <20220203085618.16043-4-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220203085618.16043-4-tony@atomide.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 03 Feb 2022 10:56:18 +0200, Tony Lindgren wrote:
> We no longer have users for the compatibility clocks and we can drop them.
> These are old duplicate clocks for what we using.
> 
> Depends-on: 31aa7056bbec ("ARM: dts: Don't use legacy clock defines for dra7 clkctrl")
> Depends-on: 9206a3af4fc0 ("clk: ti: Move dra7 clock devices out of the legacy section")
> Cc: devicetree@vger.kernel.org
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  drivers/clk/ti/Makefile          |   3 +-
>  drivers/clk/ti/clk-7xx-compat.c  | 820 -------------------------------
>  drivers/clk/ti/clk-7xx.c         |   5 +-
>  drivers/clk/ti/clkctrl.c         |   9 +-
>  include/dt-bindings/clock/dra7.h | 168 -------
>  5 files changed, 5 insertions(+), 1000 deletions(-)
>  delete mode 100644 drivers/clk/ti/clk-7xx-compat.c
> 

Acked-by: Rob Herring <robh@kernel.org>
