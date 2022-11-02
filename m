Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74474616451
	for <lists+linux-omap@lfdr.de>; Wed,  2 Nov 2022 15:02:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231238AbiKBOCr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 2 Nov 2022 10:02:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231315AbiKBOCa (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 2 Nov 2022 10:02:30 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 934DBFAFB
        for <linux-omap@vger.kernel.org>; Wed,  2 Nov 2022 07:02:07 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id x18so671964qki.4
        for <linux-omap@vger.kernel.org>; Wed, 02 Nov 2022 07:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y/+aM+0/GyR03w87wRuW//GTP90BC14X+vHyhK/lUf4=;
        b=gSi1BGJKHdNsfvAIxdqFZjNwCkF2zeqzG1N7xkXN2TUmen7q1HlVvdMK3cWjvJgaZ5
         i9Ty4ww40BYKi0BtqAOQ22PWSQ6mj53on7LFFKmxbMq4h6QDrywS/5+MhP0G/Q0F1826
         QLgTq+kbmfdilcWddf+nwnhQQBzHalj3CA35OEvMKtjdlTBGwzrCOcBiC2J8+2pnIimt
         KnQE032QjQBiOyCtWgyU5wHOp7Pp136iG5rSzABVtfQB6JfOfnyfIqo9YBpabPVXprKG
         vLmMzXsDv7XVwtzKEBAiw0aphsu2iy60lH8DgPG6ifKSl/HFzKlW/nY81/+Mz0uvY2N3
         I/zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y/+aM+0/GyR03w87wRuW//GTP90BC14X+vHyhK/lUf4=;
        b=EYJwHTgawXrbzWvD6NQz88mMu45EzMhOiiJhaPrOuzV8bdNOQJoPtneDuL+iADT0Sg
         b98obREiVigXbBGwA5ZHXE/pQSffr0YEddszgsOZoOePZJQSzO2LwAAjd3gXJRowaLUz
         0BoShR7ecBgOJhpmY2aGsKmXD5m28PZ/9YiMj5pXq8v3KB7XNA8XfcJAmjwfaTIRi5V6
         gobvsVjhODUwbTq0cAen67ZVLl+cvpwPnzXAFE5PzMM9NcjPb+2m3Ef8KZv3B3AE2oLW
         c+GPMF+nkC5FWLzS9Q+cn2AWZSxaNWmyeIWEbnW7zXjfPQRxLITaIyECKChmd/rv5ct/
         i15Q==
X-Gm-Message-State: ACrzQf3oPGJur/qIURsOF2t8Vu0BlAkTqq+hnMuK8kfnd7o1SXZZeNJQ
        hNuC3+3Ex4Z2gNVVNoS2ei+XnA==
X-Google-Smtp-Source: AMsMyM57KpKrsnd9dz6Zrnm1BoGfDA6f8qNS/FpTyv2taKHSP2KMW0YJhOKIDia4DBooWbRQhVvpLw==
X-Received: by 2002:a37:92c6:0:b0:6fa:28b2:1e2a with SMTP id u189-20020a3792c6000000b006fa28b21e2amr12494011qkd.9.1667397726182;
        Wed, 02 Nov 2022 07:02:06 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:28d9:4790:bc16:cc93? ([2601:586:5000:570:28d9:4790:bc16:cc93])
        by smtp.gmail.com with ESMTPSA id h1-20020a05620a244100b006eeb3165554sm8709015qkn.19.2022.11.02.07.02.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 07:02:05 -0700 (PDT)
Message-ID: <4582c561-bcdf-a880-cfe5-6813e1c66555@linaro.org>
Date:   Wed, 2 Nov 2022 10:02:04 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v9 0/2] gpmc wait pin additions
To:     "B. Niedermayr" <benedikt.niedermayr@siemens.com>,
        devicetree@vger.kernel.org, linux-omap@vger.kernel.org
Cc:     robh+dt@kernel.org, rogerq@kernel.org, tony@atomide.com
References: <20221102133047.1654449-1-benedikt.niedermayr@siemens.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221102133047.1654449-1-benedikt.niedermayr@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 02/11/2022 09:30, B. Niedermayr wrote:
> From: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
> 
> Currently it is not possible to configure the WAIT0PINPOLARITY and
> WAIT1PINPOLARITY bits of the GPMC_CONFIG register directly via
> device tree properties.
> 
> It is also not possible to use the same wait-pin for different
> cs-regions.
> 
> While the current implementation may fullfill most usecases, it may not
> be sufficient for more complex setups (e.g. FPGA/ASIC interfaces), where
> more complex interfacing options where possible.
> 
> For example interfacing an ASIC which offers multiple cs-regions but
> only one waitpin the current driver and dt-bindings are not sufficient.
> 
> While using the same waitpin for different cs-regions worked for older
> kernels (4.14) the omap-gpmc.c driver refused to probe (-EBUSY) with
> newer kernels (>5.10).

This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions. However, there's no need to repost patches *only* to add the
tags. The upstream maintainer will do that for acks received on the
version they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540

If a tag was not added on purpose, please state why and what changed.

Best regards,
Krzysztof

