Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 463795050D2
	for <lists+linux-omap@lfdr.de>; Mon, 18 Apr 2022 14:27:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238837AbiDRM3r (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 18 Apr 2022 08:29:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239524AbiDRM2b (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 18 Apr 2022 08:28:31 -0400
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F0FD1BE86;
        Mon, 18 Apr 2022 05:22:01 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23ICLqU8113494;
        Mon, 18 Apr 2022 07:21:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1650284512;
        bh=2iyywPz5LW00C0o6+Pre2zT/ROh21EfSu8wd92+ycSY=;
        h=Date:Subject:To:CC:References:From:In-Reply-To;
        b=ObrYGMtmi19TGzwDIKFCq39hsGC9BYbyCu+XEYgWGhOoxGcSB70F9I5f+LlrmW5qE
         eP5Fz76pFfyq8ixP77Au5DXKGY8HP/m45EPeqUClwY2q3pR4FDOAYEJmBkwqql3Alm
         RYxfz8p1bZYZqpt4Bujf6JY6lDakEIArvrqW0Qks=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23ICLq9g053173
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 18 Apr 2022 07:21:52 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 18
 Apr 2022 07:21:51 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 18 Apr 2022 07:21:51 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23ICLmpm023620;
        Mon, 18 Apr 2022 07:21:49 -0500
Message-ID: <af43c52d-3a39-d905-4d99-fa08405a44a0@ti.com>
Date:   Mon, 18 Apr 2022 15:21:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5 1/2] dt-bindings: timer: Update TI timer to yaml
Content-Language: en-US
To:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20220414085807.7389-1-tony@atomide.com>
 <20220414085807.7389-2-tony@atomide.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
In-Reply-To: <20220414085807.7389-2-tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-8.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 14/04/2022 11:58, Tony Lindgren wrote:
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
>   .../bindings/pwm/pwm-omap-dmtimer.txt         |   2 +-
>   .../bindings/timer/ti,timer-dm.yaml           | 142 ++++++++++++++++++
>   .../devicetree/bindings/timer/ti,timer.txt    |  44 ------
>   3 files changed, 143 insertions(+), 45 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/timer/ti,timer-dm.yaml
>   delete mode 100644 Documentation/devicetree/bindings/timer/ti,timer.txt
> 


Thanks you,
Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>

-- 
Best regards,
Grygorii, Ukraine
