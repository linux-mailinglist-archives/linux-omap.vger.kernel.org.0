Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 421575050B4
	for <lists+linux-omap@lfdr.de>; Mon, 18 Apr 2022 14:27:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238824AbiDRM3q (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 18 Apr 2022 08:29:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239640AbiDRM2j (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 18 Apr 2022 08:28:39 -0400
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 339E621E2F;
        Mon, 18 Apr 2022 05:22:14 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23ICM56U006670;
        Mon, 18 Apr 2022 07:22:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1650284525;
        bh=Ryf8QU+g8COGczEAs/AGfht94S0bmmvBQwEjGlJGfWw=;
        h=Date:Subject:To:CC:References:From:In-Reply-To;
        b=MFO0lMyvGtSGo1zBBR77+gvmW/ow/ISpAv6hVj2YLOoFSbKwENQifgHweFccQV7rY
         MaUjwrnlQP92cvLEBw/zwvUVrlzMoHKATGk9PlTYSbXUI8DxYO+6ZFiMdK5+nW6cAD
         cSBVbKKPo0lqsoC5QwbMYQCBHBxSHUlB2UJP2yzI=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23ICM572008142
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 18 Apr 2022 07:22:05 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 18
 Apr 2022 07:22:04 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 18 Apr 2022 07:22:04 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23ICM2NJ077609;
        Mon, 18 Apr 2022 07:22:02 -0500
Message-ID: <534bc162-05e8-c39a-9318-0a729d1771a9@ti.com>
Date:   Mon, 18 Apr 2022 15:22:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5 2/2] dt-bindings: timer: Add compatible for am6 for TI
 timer-dm
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
 <20220414085807.7389-3-tony@atomide.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
In-Reply-To: <20220414085807.7389-3-tony@atomide.com>
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
>   .../devicetree/bindings/timer/ti,timer-dm.yaml       | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/timer/ti,timer-dm.yaml b/Documentation/devicetree/bindings/timer/ti,timer-dm.yaml
> --- a/Documentation/devicetree/bindings/timer/ti,timer-dm.yaml
> +++ b/Documentation/devicetree/bindings/timer/ti,timer-dm.yaml
> @@ -19,6 +19,7 @@ properties:
>             - enum:
>                 - ti,am335x-timer
>                 - ti,am335x-timer-1ms
> +              - ti,am654-timer
>                 - ti,dm814-timer
>                 - ti,dm816-timer
>                 - ti,omap2420-timer
> @@ -88,11 +89,20 @@ properties:
>   required:
>     - compatible
>     - reg
> -  - interrupts
>   
>   additionalProperties: false
>   
>   allOf:
> +  - if:
> +      not:
> +        properties:
> +          compatible:
> +            contains:
> +              const: ti,am654-timer
> +    then:
> +      required:
> +        - interrupts
> +
>     - if:
>         not:
>           properties:

Thanks you,
Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>

-- 
Best regards,
Grygorii, Ukraine
