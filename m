Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD97264DE15
	for <lists+linux-omap@lfdr.de>; Thu, 15 Dec 2022 16:51:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230209AbiLOPvt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 15 Dec 2022 10:51:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229883AbiLOPvq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 15 Dec 2022 10:51:46 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08E2D2EF23
        for <linux-omap@vger.kernel.org>; Thu, 15 Dec 2022 07:51:44 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id ay14-20020a05600c1e0e00b003cf6ab34b61so2049562wmb.2
        for <linux-omap@vger.kernel.org>; Thu, 15 Dec 2022 07:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V2cRcfojGiF9qQEX9U8QFOzZLig/2FAjtxG+CBJEBFo=;
        b=bVgJyDTvQ2d+crPVf0qEjj/SXvuxIZeFKQITUxl2atDfl2hEcbxwgt9LyrHVid2lUS
         uIF78Zw09fK3Za5eMw03H0Tfgf6xXFVAtee5guOt6PU2dIgML8wI/QVuit8Kpmhi6p+1
         7bUZH4srlxGuaBfE+k/GGTcv8bnM0yct37Jn0ECFYZBNGKN+iTW6Ywj/ZylY81SWbP2V
         QpkDpq3+HsdbmHK82gn970aupr7h8L9oJ1NUJJ+/MMGtzIzYOKxxDYdOiBJcCyjpEMpG
         kHPXwZUDFjkvO7DfXHxYcIdZZRWmVCvGHASdRW2D4gDqAFhfKzhuwUguMqzgVE/38a7Y
         bqzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V2cRcfojGiF9qQEX9U8QFOzZLig/2FAjtxG+CBJEBFo=;
        b=HAuqt68qO1vuFKeTXMzkGYTVmQw72lsWm2ZfH0sZ31KxZ/46oSg7B0YxmM7igBQwFV
         yUlrpbUJBQnlF5YIS8HYRdCuhM8XV5avCEZp02bgLZMYIQtlc+hS8xr2ZZLmqe6xDwM6
         JdMUULjC5DpPJEcAu14wwvRskhgZmAWYbi1sIVMXhnFnKL1sS0wfGtICsXtpCcNpgYmD
         fYC6zfFP8bz/ipyXhtG6xQKWznK++BQhr3OhR2Qi3y+cJ8nyk3xO/728wGFcTcTdkPbX
         c7t7g6VEizrhi3tXSnjj2deAZbr2aBYCyhejC9zDaDUSy81Spm2U+vWM3hS9pPhs3LdW
         2fXQ==
X-Gm-Message-State: ANoB5pl+bv9FpKtW8GgPL3iPU2wtexpbJW0Ts5JF6/BI3zDOw60cfpIm
        Wt6xO49dUtS7dpTWRswMMt5VLg==
X-Google-Smtp-Source: AA0mqf5T28A1fwwJEdZX35EQu5OSksBT6KKYLBeLzZpR+52DmK8gZxNd3JNVBBNn8gPpdSKSQ71WGQ==
X-Received: by 2002:a05:600c:2101:b0:3cf:e850:4451 with SMTP id u1-20020a05600c210100b003cfe8504451mr22559864wml.9.1671119502537;
        Thu, 15 Dec 2022 07:51:42 -0800 (PST)
Received: from [192.168.1.91] (192.201.68.85.rev.sfr.net. [85.68.201.192])
        by smtp.gmail.com with ESMTPSA id n7-20020a05600c4f8700b003d1e90717ccsm8522883wmq.30.2022.12.15.07.51.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Dec 2022 07:51:41 -0800 (PST)
Message-ID: <e2bc53fe-3a0c-cf24-8b29-ca377aba3721@baylibre.com>
Date:   Thu, 15 Dec 2022 16:51:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v7 1/6] DONOTMERGE: arm64: dts: ti: Add TI TPS65219 PMIC
 support for AM642 SK board.
Content-Language: en-US
To:     Wadim Egorov <W.Egorov@phytec.de>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>, "nm@ti.com" <nm@ti.com>,
        "kristo@kernel.org" <kristo@kernel.org>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
        "will@kernel.org" <will@kernel.org>,
        "lee@kernel.org" <lee@kernel.org>,
        "tony@atomide.com" <tony@atomide.com>,
        "vigneshr@ti.com" <vigneshr@ti.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "geert+renesas@glider.be" <geert+renesas@glider.be>,
        "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
        "marcel.ziswiler@toradex.com" <marcel.ziswiler@toradex.com>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        "biju.das.jz@bp.renesas.com" <biju.das.jz@bp.renesas.com>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "jeff@labundy.com" <jeff@labundy.com>
Cc:     "afd@ti.com" <afd@ti.com>,
        "khilman@baylibre.com" <khilman@baylibre.com>,
        "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
        "msp@baylibre.com" <msp@baylibre.com>,
        "j-keerthy@ti.com" <j-keerthy@ti.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
References: <20221104152311.1098603-1-jneanne@baylibre.com>
 <20221104152311.1098603-2-jneanne@baylibre.com>
 <d0d7e315-ce86-0420-8ef5-fe2e4aefd5b4@phytec.de>
From:   jerome Neanne <jneanne@baylibre.com>
In-Reply-To: <d0d7e315-ce86-0420-8ef5-fe2e4aefd5b4@phytec.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 15/12/2022 16:09, Wadim Egorov wrote:
> Hi Jerome,
> 
> is this setup working for you on the AM642 SK board?
> 
> I am testing your PMIC patches on a AM62 based board with a similar setup and
> running into the following error
> 
>      VDDSHV5_SDIO: bypassed regulator has no supply!
>      VDDSHV5_SDIO: will resolve supply early: ldo1
>      VDDSHV5_SDIO: supplied by regulator-dummy
>      VDDSHV5_SDIO: failed to get the current voltage: -EINVAL
> 
> Have you noticed problems with LDO1 and bypass mode?

Wadim,

I did not noticed this on am642 board but IIRC this rail was not used. I 
heard about similar issue reported to me by Nishanth M with a fix 
proposal here:
https://gist.github.com/nmenon/e4dd6ef6afe31bc9750fa6cbee8d3e25

I did not have time yet to investigate on this but will do soon.

Regards,
Jerome
