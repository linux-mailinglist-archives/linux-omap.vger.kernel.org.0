Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A0054F99AD
	for <lists+linux-omap@lfdr.de>; Fri,  8 Apr 2022 17:42:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232134AbiDHPoB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 8 Apr 2022 11:44:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230231AbiDHPoA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 8 Apr 2022 11:44:00 -0400
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 639067EB26;
        Fri,  8 Apr 2022 08:41:56 -0700 (PDT)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-ddfa38f1c1so10082827fac.11;
        Fri, 08 Apr 2022 08:41:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=gc3rc9UDAle15X3NUQszdkSzEDch8StpUzd09vVKlk4=;
        b=XcBp5mVNpJ3QUvgm935+rOUjA4879G12hpwRmKNkqWQ12H1HHC7gw8cdhyosmPnemf
         9YMdjNp6HhDIyuWh6BbJLPtZtyfWVCpy2RysY+YohUswLsMYQDXtXB14hNzCkYiZFvu4
         TJrHuoYH6DL+bokHlTyDjwAod25fa4AAJFwTgi14cF39v2GsI1AX4AiLu33RTVKbBf+h
         NQ3wJUEuNM2GisjlpW22kVdjN33wLLwXGZLxOqkcPwU5P5akdL2MCxkQd55dNcS+7zAv
         ATwCof8GPcKEXcVgCI1QJSQw9X94UcXBbVZsZPI/j82LFQkaGhklUxDT1y2mBAOHZxVk
         cqfA==
X-Gm-Message-State: AOAM531FUn+G1w+qFrrDUdxuu2gzKwdNNLc4eEzEheUdYFBaC2t3MFY6
        +4lDjony/ETbjVLxCoFpyQ==
X-Google-Smtp-Source: ABdhPJwUS18j+rvvp45gUAkE+0ZDG9xKpavicWZYQRIQL0ljRiJ5S15MjjjksL5opKRuzCDAdLthdg==
X-Received: by 2002:a05:6870:c101:b0:da:b3f:2b89 with SMTP id f1-20020a056870c10100b000da0b3f2b89mr8951063oad.296.1649432515683;
        Fri, 08 Apr 2022 08:41:55 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id s82-20020acadb55000000b002d9ce64bea0sm8758874oig.48.2022.04.08.08.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 08:41:55 -0700 (PDT)
Received: (nullmailer pid 3536063 invoked by uid 1000);
        Fri, 08 Apr 2022 15:41:54 -0000
From:   Rob Herring <robh@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
        Keerthy <j-keerthy@ti.com>, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
In-Reply-To: <20220408081258.57213-1-tony@atomide.com>
References: <20220408081258.57213-1-tony@atomide.com>
Subject: Re: [PATCH] dt-bindings: timer: Update TI timer to yaml and add compatible for am6
Date:   Fri, 08 Apr 2022 10:41:54 -0500
Message-Id: <1649432514.728371.3536062.nullmailer@robh.at.kernel.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, 08 Apr 2022 11:12:58 +0300, Tony Lindgren wrote:
> Let's update the TI timer binding to use yaml. And add compatible for
> ti,am654-timer for TI am64, am65 and j72 SoCs. As the timer hardware is
> the same between am64, am65 and j72 we use the compatible name for the
> earliest SoC with this timer.
> 
> As this binding is specific to the TI dual-mode timers also known
> as dm-timers, let's use ti,timer-dm.yaml naming for the new file.
> 
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Keerthy <j-keerthy@ti.com>
> Cc: Nishanth Menon <nm@ti.com>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  .../bindings/timer/ti,timer-dm.yaml           | 105 ++++++++++++++++++
>  .../devicetree/bindings/timer/ti,timer.txt    |  44 --------
>  2 files changed, 105 insertions(+), 44 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/timer/ti,timer-dm.yaml
>  delete mode 100644 Documentation/devicetree/bindings/timer/ti,timer.txt
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/


timer@0: compatible:0: 'ti,am4372-timer-1ms' is not one of ['ti,omap2420-timer', 'ti,omap3430-timer', 'ti,omap4430-timer', 'ti,omap5430-timer', 'ti,am335x-timer', 'ti,am335x-timer-1ms', 'ti,am654-timer']
	arch/arm/boot/dts/am437x-cm-t43.dtb
	arch/arm/boot/dts/am437x-gp-evm.dtb
	arch/arm/boot/dts/am437x-idk-evm.dtb
	arch/arm/boot/dts/am437x-sbc-t43.dtb
	arch/arm/boot/dts/am437x-sk-evm.dtb
	arch/arm/boot/dts/am43x-epos-evm.dtb

timer@0: compatible:0: 'ti,am4372-timer' is not one of ['ti,omap2420-timer', 'ti,omap3430-timer', 'ti,omap4430-timer', 'ti,omap5430-timer', 'ti,am335x-timer', 'ti,am335x-timer-1ms', 'ti,am654-timer']
	arch/arm/boot/dts/am437x-cm-t43.dtb
	arch/arm/boot/dts/am437x-cm-t43.dtb
	arch/arm/boot/dts/am437x-cm-t43.dtb
	arch/arm/boot/dts/am437x-cm-t43.dtb
	arch/arm/boot/dts/am437x-cm-t43.dtb
	arch/arm/boot/dts/am437x-cm-t43.dtb
	arch/arm/boot/dts/am437x-cm-t43.dtb
	arch/arm/boot/dts/am437x-cm-t43.dtb
	arch/arm/boot/dts/am437x-cm-t43.dtb
	arch/arm/boot/dts/am437x-cm-t43.dtb
	arch/arm/boot/dts/am437x-gp-evm.dtb
	arch/arm/boot/dts/am437x-gp-evm.dtb
	arch/arm/boot/dts/am437x-gp-evm.dtb
	arch/arm/boot/dts/am437x-gp-evm.dtb
	arch/arm/boot/dts/am437x-gp-evm.dtb
	arch/arm/boot/dts/am437x-gp-evm.dtb
	arch/arm/boot/dts/am437x-gp-evm.dtb
	arch/arm/boot/dts/am437x-gp-evm.dtb
	arch/arm/boot/dts/am437x-gp-evm.dtb
	arch/arm/boot/dts/am437x-gp-evm.dtb
	arch/arm/boot/dts/am437x-idk-evm.dtb
	arch/arm/boot/dts/am437x-idk-evm.dtb
	arch/arm/boot/dts/am437x-idk-evm.dtb
	arch/arm/boot/dts/am437x-idk-evm.dtb
	arch/arm/boot/dts/am437x-idk-evm.dtb
	arch/arm/boot/dts/am437x-idk-evm.dtb
	arch/arm/boot/dts/am437x-idk-evm.dtb
	arch/arm/boot/dts/am437x-idk-evm.dtb
	arch/arm/boot/dts/am437x-idk-evm.dtb
	arch/arm/boot/dts/am437x-idk-evm.dtb
	arch/arm/boot/dts/am437x-sbc-t43.dtb
	arch/arm/boot/dts/am437x-sbc-t43.dtb
	arch/arm/boot/dts/am437x-sbc-t43.dtb
	arch/arm/boot/dts/am437x-sbc-t43.dtb
	arch/arm/boot/dts/am437x-sbc-t43.dtb
	arch/arm/boot/dts/am437x-sbc-t43.dtb
	arch/arm/boot/dts/am437x-sbc-t43.dtb
	arch/arm/boot/dts/am437x-sbc-t43.dtb
	arch/arm/boot/dts/am437x-sbc-t43.dtb
	arch/arm/boot/dts/am437x-sbc-t43.dtb
	arch/arm/boot/dts/am437x-sk-evm.dtb
	arch/arm/boot/dts/am437x-sk-evm.dtb
	arch/arm/boot/dts/am437x-sk-evm.dtb
	arch/arm/boot/dts/am437x-sk-evm.dtb
	arch/arm/boot/dts/am437x-sk-evm.dtb
	arch/arm/boot/dts/am437x-sk-evm.dtb
	arch/arm/boot/dts/am437x-sk-evm.dtb
	arch/arm/boot/dts/am437x-sk-evm.dtb
	arch/arm/boot/dts/am437x-sk-evm.dtb
	arch/arm/boot/dts/am437x-sk-evm.dtb
	arch/arm/boot/dts/am43x-epos-evm.dtb
	arch/arm/boot/dts/am43x-epos-evm.dtb
	arch/arm/boot/dts/am43x-epos-evm.dtb
	arch/arm/boot/dts/am43x-epos-evm.dtb
	arch/arm/boot/dts/am43x-epos-evm.dtb
	arch/arm/boot/dts/am43x-epos-evm.dtb
	arch/arm/boot/dts/am43x-epos-evm.dtb
	arch/arm/boot/dts/am43x-epos-evm.dtb
	arch/arm/boot/dts/am43x-epos-evm.dtb
	arch/arm/boot/dts/am43x-epos-evm.dtb

timer@0: compatible: ['ti,am4372-timer-1ms', 'ti,am335x-timer-1ms'] is too long
	arch/arm/boot/dts/am437x-cm-t43.dtb
	arch/arm/boot/dts/am437x-gp-evm.dtb
	arch/arm/boot/dts/am437x-idk-evm.dtb
	arch/arm/boot/dts/am437x-sbc-t43.dtb
	arch/arm/boot/dts/am437x-sk-evm.dtb
	arch/arm/boot/dts/am43x-epos-evm.dtb

timer@0: compatible: ['ti,am4372-timer', 'ti,am335x-timer'] is too long
	arch/arm/boot/dts/am437x-cm-t43.dtb
	arch/arm/boot/dts/am437x-cm-t43.dtb
	arch/arm/boot/dts/am437x-cm-t43.dtb
	arch/arm/boot/dts/am437x-cm-t43.dtb
	arch/arm/boot/dts/am437x-cm-t43.dtb
	arch/arm/boot/dts/am437x-cm-t43.dtb
	arch/arm/boot/dts/am437x-cm-t43.dtb
	arch/arm/boot/dts/am437x-cm-t43.dtb
	arch/arm/boot/dts/am437x-cm-t43.dtb
	arch/arm/boot/dts/am437x-cm-t43.dtb
	arch/arm/boot/dts/am437x-gp-evm.dtb
	arch/arm/boot/dts/am437x-gp-evm.dtb
	arch/arm/boot/dts/am437x-gp-evm.dtb
	arch/arm/boot/dts/am437x-gp-evm.dtb
	arch/arm/boot/dts/am437x-gp-evm.dtb
	arch/arm/boot/dts/am437x-gp-evm.dtb
	arch/arm/boot/dts/am437x-gp-evm.dtb
	arch/arm/boot/dts/am437x-gp-evm.dtb
	arch/arm/boot/dts/am437x-gp-evm.dtb
	arch/arm/boot/dts/am437x-gp-evm.dtb
	arch/arm/boot/dts/am437x-idk-evm.dtb
	arch/arm/boot/dts/am437x-idk-evm.dtb
	arch/arm/boot/dts/am437x-idk-evm.dtb
	arch/arm/boot/dts/am437x-idk-evm.dtb
	arch/arm/boot/dts/am437x-idk-evm.dtb
	arch/arm/boot/dts/am437x-idk-evm.dtb
	arch/arm/boot/dts/am437x-idk-evm.dtb
	arch/arm/boot/dts/am437x-idk-evm.dtb
	arch/arm/boot/dts/am437x-idk-evm.dtb
	arch/arm/boot/dts/am437x-idk-evm.dtb
	arch/arm/boot/dts/am437x-sbc-t43.dtb
	arch/arm/boot/dts/am437x-sbc-t43.dtb
	arch/arm/boot/dts/am437x-sbc-t43.dtb
	arch/arm/boot/dts/am437x-sbc-t43.dtb
	arch/arm/boot/dts/am437x-sbc-t43.dtb
	arch/arm/boot/dts/am437x-sbc-t43.dtb
	arch/arm/boot/dts/am437x-sbc-t43.dtb
	arch/arm/boot/dts/am437x-sbc-t43.dtb
	arch/arm/boot/dts/am437x-sbc-t43.dtb
	arch/arm/boot/dts/am437x-sbc-t43.dtb
	arch/arm/boot/dts/am437x-sk-evm.dtb
	arch/arm/boot/dts/am437x-sk-evm.dtb
	arch/arm/boot/dts/am437x-sk-evm.dtb
	arch/arm/boot/dts/am437x-sk-evm.dtb
	arch/arm/boot/dts/am437x-sk-evm.dtb
	arch/arm/boot/dts/am437x-sk-evm.dtb
	arch/arm/boot/dts/am437x-sk-evm.dtb
	arch/arm/boot/dts/am437x-sk-evm.dtb
	arch/arm/boot/dts/am437x-sk-evm.dtb
	arch/arm/boot/dts/am437x-sk-evm.dtb
	arch/arm/boot/dts/am43x-epos-evm.dtb
	arch/arm/boot/dts/am43x-epos-evm.dtb
	arch/arm/boot/dts/am43x-epos-evm.dtb
	arch/arm/boot/dts/am43x-epos-evm.dtb
	arch/arm/boot/dts/am43x-epos-evm.dtb
	arch/arm/boot/dts/am43x-epos-evm.dtb
	arch/arm/boot/dts/am43x-epos-evm.dtb
	arch/arm/boot/dts/am43x-epos-evm.dtb
	arch/arm/boot/dts/am43x-epos-evm.dtb
	arch/arm/boot/dts/am43x-epos-evm.dtb

