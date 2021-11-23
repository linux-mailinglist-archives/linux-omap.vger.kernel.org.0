Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D408A45ACCE
	for <lists+linux-omap@lfdr.de>; Tue, 23 Nov 2021 20:48:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233425AbhKWTvJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 23 Nov 2021 14:51:09 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:51384
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230191AbhKWTvJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Tue, 23 Nov 2021 14:51:09 -0500
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CDB404000A
        for <linux-omap@vger.kernel.org>; Tue, 23 Nov 2021 19:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1637696879;
        bh=awbGKqFJMvM06q00ru2W6cjtSUOX907qfBZEpTNwf+o=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=Yv1f7i8iEC9TXOJ/UFUQjSR+GgUTyD3l6Os/s7Nnn84jxX0mDz6rdQR6AqGrjFX0k
         4ndR3dkxLe04fCG5L5f4EkS9TqgB0F/Y2gNTb2mq92HBH0jN3g4Y6WNS81yjCGVrPm
         9J/7l0w+9C9wicnzbH+W5wSsq1wfI/foX2egLJc3sH6Ku9WWGRfCDCay81AMShFjir
         L981SXuMhlCCHHS3t2TMlJ+4cUwj9FVC9YF/enPSVHenkXQtdRsp0ETE1LEqJZcYxG
         OCXk0Qy/1qVr+KqnVD0r9c2KxAGgZo++qOZhVsmTVZHWbb+6qNSKlQ6E32DdvIQ9++
         ot6kh82fBm1rA==
Received: by mail-lj1-f199.google.com with SMTP id b16-20020a2ebc10000000b00218d00045c4so80764ljf.5
        for <linux-omap@vger.kernel.org>; Tue, 23 Nov 2021 11:47:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=awbGKqFJMvM06q00ru2W6cjtSUOX907qfBZEpTNwf+o=;
        b=BFiEeVr60SDpWI2dRA2FxeW2I0WuAqUwmciKxyHN7FltgRZpbkLi5Dk6BvZoXtJ9gl
         WL7RVTv36J8X69Tal7OdTFP+3sWClcd95XjGp3+a2/slIDyOFZITAtKpxFGPioVEEcsq
         SqmKLeVDYgW4tPf5yW/VlXWgL8F0Ao7e2lLTXa7bffVlLZfa28scG/qyPhiKQbJEt1wm
         B5+nme8k+2AHcWjydDMj9vY02GLL3GvCXG7bPPETRMRI+uPTSfyFrP1vDnGIvkmG58JU
         B69X23VAvdi0BFxGF5sOOluYqChoh4ediHs/pDZEkYISNyKoZQznuymFAJKwpuuCNyBn
         9Snw==
X-Gm-Message-State: AOAM532TzKYxUioM279ryQ5kZM13+vlAED/cRbqJ4QG4MMlOwG2lp0Us
        uoLd/B4MdfJJIr1EZ+Oo8KJ+NzLOfsV+S02OYMtq5vLVKc25O9gP7E0H7UZn1TAwMw0g7TaQaLm
        UIgJKHuxy1UjIu8NT+xs4lPZAddW9wtHrclrEyrw=
X-Received: by 2002:a2e:9acf:: with SMTP id p15mr8706079ljj.213.1637696879212;
        Tue, 23 Nov 2021 11:47:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw5DSe7GPue3q18G0oImIITmr9qz4TwOJH/oHfODp8pgS8jydQV278sOB6lv9XS+71ur7RsjA==
X-Received: by 2002:a2e:9acf:: with SMTP id p15mr8706051ljj.213.1637696879047;
        Tue, 23 Nov 2021 11:47:59 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id z14sm362478lfg.173.2021.11.23.11.47.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Nov 2021 11:47:58 -0800 (PST)
Message-ID: <a28532b1-bfa0-031b-91cc-070cad557599@canonical.com>
Date:   Tue, 23 Nov 2021 20:47:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 1/4] dt-bindings: memory-controllers: ti,gpmc: Add
 compatible for AM64
Content-Language: en-US
To:     Roger Quadros <rogerq@kernel.org>, tony@atomide.com
Cc:     kishon@ti.com, nm@ti.com, vigneshr@ti.com,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
References: <20211123102607.13002-1-rogerq@kernel.org>
 <20211123102607.13002-2-rogerq@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211123102607.13002-2-rogerq@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 23/11/2021 11:26, Roger Quadros wrote:
> AM64 SoC contains the GPMC module. Add compatible for it.
> 
> Newer SoCs don't necessarily map GPMC data region at the same place
> as legacy SoCs. Add reg-names "data", to provide this information to
> the device driver.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> ---
>  .../bindings/memory-controllers/ti,gpmc.yaml         | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
> index 25b42d68f9b3..1869cc6f949b 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc.yaml
> @@ -23,13 +23,20 @@ properties:
>      items:
>        - enum:
>            - ti,am3352-gpmc
> +          - ti,am64-gpmc
>            - ti,omap2420-gpmc
>            - ti,omap2430-gpmc
>            - ti,omap3430-gpmc
>            - ti,omap4430-gpmc
>  
>    reg:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: cfg
> +      - const: data

I see your driver handles cases with only one reg item, but I have other
question - is it correct to have older (ARMv7) platform with two reg
items? Or can am64-gpmc come with only one reg?
IOW, I am surprised there is no if-else case precising this minItems
requirement for different SocS.

>  
>    interrupts:
>      maxItems: 1
> @@ -44,6 +51,9 @@ properties:
>      items:
>        - const: fck
>  
> +  power-domains:
> +    maxItems: 1

Similar, but looks like a weaker requirement - could an older SoC define
power-domain?

> +
>    dmas:
>      items:
>        - description: DMA channel for GPMC NAND prefetch
> 


Best regards,
Krzysztof
