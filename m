Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B45A50EBE0
	for <lists+linux-omap@lfdr.de>; Tue, 26 Apr 2022 00:22:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238085AbiDYWZO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 25 Apr 2022 18:25:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343639AbiDYV6L (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 25 Apr 2022 17:58:11 -0400
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E75CBE17;
        Mon, 25 Apr 2022 14:55:06 -0700 (PDT)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-e93ff05b23so4430850fac.9;
        Mon, 25 Apr 2022 14:55:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HTkzAgDwzrdZmDYnPnvTFadbGOqHK7m6HemofDQ+FyM=;
        b=jQTmCzJkK6NKHyM1IkUb/l9WWb7BTWfWCe2agZ7Y2V+0uCT3gA9QEATXfEvizLleDY
         gdXiytuOndVhXkNgU4v7REfvAEFmCbDYPPKA7uDw3+SVwxRwat+LONnKjuuKwxcy0dyL
         KUr3C/7GwuxwlsrmiszOLvprteRfEH+5hV3u39UO4e0SUoiNZCrHvWdxsigKZy+tNqCB
         mTU5tM5ceTNzbovpdL+D/ZvOMpyLRK8AVKC9kCQG5KuWjvgSBKE+/hMJHEhjBCoBNYUS
         dzQ6YmjBduh36/lt9LGh/+7aa+SdiJdlB5DzeRk2n0M9eUU+FVjzARYjBJT2dnqs9WI+
         phaw==
X-Gm-Message-State: AOAM53135yBg/ODkQ8jmcFSZUUe5p26Oao+jB4eJhJw5flpEdloIP7h7
        1X2EU4zZ9pAgF+bu4BHG5w==
X-Google-Smtp-Source: ABdhPJzr8e6EkxJlu1x1gyG1/vlRIBa5TnoQWrsIxjxtMp08fnlWfg91vZsMNL/8phQfL4LFsZ1Riw==
X-Received: by 2002:a05:6870:b152:b0:e6:77a6:7ee0 with SMTP id a18-20020a056870b15200b000e677a67ee0mr8311135oal.78.1650923705701;
        Mon, 25 Apr 2022 14:55:05 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id n62-20020acaef41000000b002ef646e6690sm4262334oih.53.2022.04.25.14.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 14:55:05 -0700 (PDT)
Received: (nullmailer pid 360889 invoked by uid 1000);
        Mon, 25 Apr 2022 21:55:04 -0000
Date:   Mon, 25 Apr 2022 16:55:04 -0500
From:   Rob Herring <robh@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Nishanth Menon <nm@ti.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
        Keerthy <j-keerthy@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 1/2] dt-bindings: timer: Update TI timer to yaml
Message-ID: <YmcYuHQB+PRmFmwy@robh.at.kernel.org>
References: <20220414085807.7389-1-tony@atomide.com>
 <20220414085807.7389-2-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220414085807.7389-2-tony@atomide.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 14 Apr 2022 11:58:06 +0300, Tony Lindgren wrote:
> Let's update the TI timer binding to use yaml. As this binding is specific
> to the TI dual-mode timers also known as dm-timers, let's use file name
> ti,timer-dm.yaml to avoid confusion with other timers.
> 
> We add checks for the deprecated ti,hwmods property as done for other TI
> device driver bindings earlier.
> 
> We also correct the issue with the old binding that was out of date for
> several properties.
> 
> The am43 related timers are undocumented, but compatible with the am3
> timers. Let's add the am43 timers too.
> 
> The dm814 and dm816 timers are missing, let's add them.
> 
> Some timers on some SoCs are dual mapped, like the ABE timers on omap4
> and 5. The reg property maxItems must be updated to 2.
> 
> The timer clocks can be managed by the parent interconnect target module
> with no clocks assigned for the timer node. And in some cases, the SoC may
> need to configure additional system clock for the timer in addition to the
> functional clock.
> 
> The clock names are optional and not specific to the comptible property.
> For example, dra7 timers on l3 interconnect do not need clock-names, while
> the timers on dra7 l4 interconnect need them with both being compatible
> with ti,omap5430-timer.
> 
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Grygorii Strashko <grygorii.strashko@ti.com>
> Cc: Keerthy <j-keerthy@ti.com>
> Cc: Nishanth Menon <nm@ti.com>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  .../bindings/pwm/pwm-omap-dmtimer.txt         |   2 +-
>  .../bindings/timer/ti,timer-dm.yaml           | 142 ++++++++++++++++++
>  .../devicetree/bindings/timer/ti,timer.txt    |  44 ------
>  3 files changed, 143 insertions(+), 45 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/timer/ti,timer-dm.yaml
>  delete mode 100644 Documentation/devicetree/bindings/timer/ti,timer.txt
> 

Applied, thanks!
