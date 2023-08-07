Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEA7677283B
	for <lists+linux-omap@lfdr.de>; Mon,  7 Aug 2023 16:53:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbjHGOxk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Aug 2023 10:53:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbjHGOxi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Aug 2023 10:53:38 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7287A1710
        for <linux-omap@vger.kernel.org>; Mon,  7 Aug 2023 07:53:32 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-991c786369cso628183966b.1
        for <linux-omap@vger.kernel.org>; Mon, 07 Aug 2023 07:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691420011; x=1692024811;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=54uwNnL1v7fjVMZOIVyUvwsV3rz6KMPoI0gYcM/jYX8=;
        b=SHMFmLE5BnwygWErFm2yZEUWbWo7BvYFXzj5dFCcin+OgeyibPCPrRnASlz0ihzceQ
         NFX6N//DkfTS+FcF63+NhWpL1c4DqkDf7WvfTTFjY7Eupe5ndjU7ZRlNDwucG/RSCnrG
         ixNqxlbd7RtsLPGPwjLCTbhc+PP9qaB2c/yKvBwZB0viaeJVOgeLQd1yA2N+lNQoQaRj
         yrVNsCMhtLIhqKQtoEX2MANratl33TUFGaf3lwpqdAbedQaDcu9DPSrZu2nC4EnypwZR
         ZPc6eVMhhUnP1exhuDwlWdn2FfNZuyFroiJHLqkIn7ZZuOpckdyUIKM1xQ8FPYABJSDh
         O5CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691420011; x=1692024811;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=54uwNnL1v7fjVMZOIVyUvwsV3rz6KMPoI0gYcM/jYX8=;
        b=I6tW3xIlfDL33YnDFhQwUwWK4omp3kJjOjEPsWYxwMoGZd7WaH2aSKSshNcXmVIHjz
         8R3Z994BK/K9XkZ6r4LlX33oOMIBkB59QI5X9x/+6ax31akTYjsSBTEPtDkDjYwJH1r5
         sclcKBPAY3xLSiryi+bRPmf5j7o+iHG2Opjyao/6/f2sE1ceVU0DvPO/XwolWAwOWD++
         okmO0C0zR9BB0o4XBCCIMbW1cb37xriXGFOd3wQB99X+OGewoDQ6ScKWa4I60MA/HoTp
         GrWDEajSvl4/u9m45FXVdMBD4Y1teX+8BFwJFa8J1eTV90rNtaatC1BMxvO7rdiDWZSu
         1b+Q==
X-Gm-Message-State: AOJu0YwI66E1y4R5Ys4ZCCLDA7O0aU+dfJFT3MGpNSFxUNKEUFBOM6Az
        1no5EPDz7akuRp7vZBraDyH0IQ==
X-Google-Smtp-Source: AGHT+IGPQPpw12NV2S/MAXHkU3RUQ2whwPAyprmDBww6+C7MqehHDlK8PYY+pEJng1Xr629RHHl1Mg==
X-Received: by 2002:a17:906:32d9:b0:982:c69c:8c30 with SMTP id k25-20020a17090632d900b00982c69c8c30mr8591365ejk.55.1691420011001;
        Mon, 07 Aug 2023 07:53:31 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id x2-20020a1709060a4200b00993b381f808sm5322787ejf.38.2023.08.07.07.53.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Aug 2023 07:53:30 -0700 (PDT)
Message-ID: <89993371-e26d-0308-060c-312a66c0cb08@linaro.org>
Date:   Mon, 7 Aug 2023 16:53:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] dt-bindings: pinctrl: pinctrl-single: add am62x
 compatible
Content-Language: en-US
To:     Dhruva Gole <d-gole@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tony Lindgren <tony@atomide.com>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
References: <20230803092311.604610-1-d-gole@ti.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230803092311.604610-1-d-gole@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 03/08/2023 11:23, Dhruva Gole wrote:
> Add the am62x compatible property to add support for the new
> wakeup enable and status bits positions
> 
> Cc: Nishanth Menon <nm@ti.com>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> CC: Tony Lindgren <tony@atomide.com>
> Signed-off-by: Dhruva Gole <d-gole@ti.com>
> ---
> 
> Base: tag: next-20230731 + below "depends on" patch
> Depends on: https://lore.kernel.org/linux-omap/20230731061908.GG5194@atomide.com/T/
> 
>  Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
> index b6b6bcd7074b..4c98035a1217 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml
> @@ -23,6 +23,7 @@ properties:
>            - pinconf-single
>        - items:
>            - enum:
> +              - ti,am6-padconf

This does not look like am62x. Except this, am62x looks like family, not
SoC.

Best regards,
Krzysztof

