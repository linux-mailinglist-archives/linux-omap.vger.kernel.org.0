Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B8C04FEA8C
	for <lists+linux-omap@lfdr.de>; Wed, 13 Apr 2022 01:46:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229806AbiDLX0h (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Apr 2022 19:26:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229947AbiDLX0G (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 Apr 2022 19:26:06 -0400
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F649AA008;
        Tue, 12 Apr 2022 15:39:28 -0700 (PDT)
Received: by mail-oi1-f178.google.com with SMTP id t21so221122oie.11;
        Tue, 12 Apr 2022 15:39:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=u5PY6bLLimNR2B9Ro1s012CPiuANxLHzj7d6SR7unFo=;
        b=F7xwzY3YjV93/9+MUbx/UXyxeDFgD0Y9ejtCawp4fs+5rW5Lmp6X+LvHLzmnM7GC/K
         eewGdnktiPqQxdT23vCMxKJ0PqPm3isWdrwi71FZsE3oyoepyAhmnOkIQm0aUcdVijMN
         lBqoRXJz4NCKgaSlJZRe38hshv4GUQvGdiG7kRzONGxAP6NM0kPiSGhfgGf8wrwTaOOg
         83SGr5uAf6g3mPOX9R0jNvxb5pogWFBvZxfQDbXaXKB/wK8si0GPanghSBKqO/6Nc25D
         dif+tgLJTfOeCZYmqWwxJmusEM12hpkKrPBtVu0SL7cMYC5AdRJPe1nu/U3h2VGMFdah
         iIgA==
X-Gm-Message-State: AOAM531as1vUq+o9bfq4CQ3C5DnxLV2R7RsgG1x2aQ1UlqJGbfdUcgMe
        51sO+mce+nJjy/vVZ/kMIJeFyTE9rw==
X-Google-Smtp-Source: ABdhPJykGbTkNeqZUZwrtwbR21vkEyiUetGMMb79dTKsreuCOdjCTmDpP1AygrrvTQP2tAFtrU6hQQ==
X-Received: by 2002:a05:6870:b155:b0:e2:e3e5:4722 with SMTP id a21-20020a056870b15500b000e2e3e54722mr2950716oal.8.1649798816531;
        Tue, 12 Apr 2022 14:26:56 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 5-20020a056870100500b000ddac364643sm13743560oai.30.2022.04.12.14.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 14:26:56 -0700 (PDT)
Received: (nullmailer pid 971959 invoked by uid 1000);
        Tue, 12 Apr 2022 21:26:55 -0000
Date:   Tue, 12 Apr 2022 16:26:55 -0500
From:   Rob Herring <robh@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Krzysztof Kozlowski <krzk+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Keerthy <j-keerthy@ti.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCHv3 0/2] Convert TI dmtimer binding to yaml
Message-ID: <YlXun5/rKNPvLZs3@robh.at.kernel.org>
References: <20220412131644.59195-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220412131644.59195-1-tony@atomide.com>
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

On Tue, Apr 12, 2022 at 04:16:42PM +0300, Tony Lindgren wrote:
> Hi all,
> 
> Here's v3 changes for TI dmtimer changes.

You missed 'v3' on the patches.

> 
> Regards,
> 
> Tony
> 
> 
> Changes since v1:
> 
> - Improve yaml for various checks based on comments from Krzysztof
>   and Nishanth
> 
> - Add checks for am4 timer as pointed out by Krzysztof and Rob
> 
> - Split am6 additions into a separate patch as suggested by Krzysztof
> 
> Changes since v2:
> 
> - Improve yaml for more checks based on comments from Grygorii and
>   Krzysztof
> 
> 
> Tony Lindgren (2):
>   dt-bindings: timer: Update TI timer to yaml
>   dt-bindings: timer: Add compatible for am6 for TI timer-dm
> 
>  .../bindings/pwm/pwm-omap-dmtimer.txt         |   2 +-
>  .../bindings/timer/ti,timer-dm.yaml           | 171 ++++++++++++++++++
>  .../devicetree/bindings/timer/ti,timer.txt    |  44 -----
>  3 files changed, 172 insertions(+), 45 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/timer/ti,timer-dm.yaml
>  delete mode 100644 Documentation/devicetree/bindings/timer/ti,timer.txt
> 
> -- 
> 2.35.1
> 
