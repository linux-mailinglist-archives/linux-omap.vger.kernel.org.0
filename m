Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09B2450EBDD
	for <lists+linux-omap@lfdr.de>; Tue, 26 Apr 2022 00:22:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238018AbiDYWZM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 25 Apr 2022 18:25:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343640AbiDYV6S (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 25 Apr 2022 17:58:18 -0400
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E92D16169;
        Mon, 25 Apr 2022 14:55:13 -0700 (PDT)
Received: by mail-oi1-f177.google.com with SMTP id l203so7834476oif.0;
        Mon, 25 Apr 2022 14:55:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PHOr5dyluXuuaUOHVdQfwFJR1c6TSUho1dnJi41C4k4=;
        b=k3aNEFOKqPf8RrUcfoKAOOWEct0pLFR06xIVMVIaw2ssAMI/mDOI8okE2RxgrAny1M
         ht+tTdn29xzCy7X7ksxvnPXVCX06/ykXK7ORDu0DGZBvuMqRNlARcr3he4Rubw2lFU4X
         rCelX/WzQacLTdCiwr9d3PWmgmXtxrFys/GRIwOuZ/2v0yBYcjB5ipKsax9tFXloUcFi
         twbDZPyUyXL8FcGqnly4AehSgyI5KJ/CcryQ67PmgzD8cxI1fspeWJc/JZBXLgCjrjCf
         awhSiAqQ/G0eUsemijDy4cmi+P2HglpLsatpLs0OwZ0bvnsJvnJ/2awQ+V4Jxp1/HXcQ
         GaTg==
X-Gm-Message-State: AOAM531tf98eeCDDlWiW9w3cZQTJAXMg3389K4f3uPTStbNGvV/kZK0D
        x3DZRcQKHPyMAi+cdvlY7Q==
X-Google-Smtp-Source: ABdhPJyaLrR6RBBm/YXv+uX+05CwhxM13Mp41zXMj6FR2Pb1k8S2s0+Jq+EHAEJElxDM9/Ha1uIMFQ==
X-Received: by 2002:a05:6808:13d4:b0:324:f835:d2e4 with SMTP id d20-20020a05680813d400b00324f835d2e4mr7259087oiw.262.1650923713297;
        Mon, 25 Apr 2022 14:55:13 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id h26-20020a9d799a000000b00604d35aa374sm4256284otm.35.2022.04.25.14.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 14:55:12 -0700 (PDT)
Received: (nullmailer pid 361250 invoked by uid 1000);
        Mon, 25 Apr 2022 21:55:12 -0000
Date:   Mon, 25 Apr 2022 16:55:12 -0500
From:   Rob Herring <robh@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Vignesh Raghavendra <vigneshr@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Nishanth Menon <nm@ti.com>, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 2/2] dt-bindings: timer: Add compatible for am6 for TI
 timer-dm
Message-ID: <YmcYwD6f/I59ucTR@robh.at.kernel.org>
References: <20220414085807.7389-1-tony@atomide.com>
 <20220414085807.7389-3-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220414085807.7389-3-tony@atomide.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 14 Apr 2022 11:58:07 +0300, Tony Lindgren wrote:
> Let's add compatible for ti,am654-timer for TI am64, am65 and j72 SoCs.
> As the timer hardware is the same between am64, am65 and j72 we use the
> compatible name for the earliest SoC with this timer.
> 
> The timer interrupts are not routable for the operating system for some
> timers on am6. Let's make sure the interrupts are configured for the
> timers on all other SoCs.
> 
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Grygorii Strashko <grygorii.strashko@ti.com>
> Cc: Keerthy <j-keerthy@ti.com>
> Cc: Nishanth Menon <nm@ti.com>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  .../devicetree/bindings/timer/ti,timer-dm.yaml       | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 

Applied, thanks!
