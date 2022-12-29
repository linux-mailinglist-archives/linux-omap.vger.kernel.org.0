Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B98A1658E2E
	for <lists+linux-omap@lfdr.de>; Thu, 29 Dec 2022 16:00:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233669AbiL2PAP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 29 Dec 2022 10:00:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233335AbiL2PAL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 29 Dec 2022 10:00:11 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FA0512639
        for <linux-omap@vger.kernel.org>; Thu, 29 Dec 2022 07:00:08 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id bp15so27801429lfb.13
        for <linux-omap@vger.kernel.org>; Thu, 29 Dec 2022 07:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iEA2z7h5roaHdOOiakFPN8EBJnuMvYFHiTI2AEUpqhw=;
        b=PJq1TOY9Jj06YAspAhnVH2FxAQNUGaqX3QFVBVluNVRxi7CLZQHZnbEjKExGH8iLWK
         vC9cqK2dtzbjlLUiXUhzezlYxUvQGyOaYBy4XAgZmaamqz7xTfD60TU6wLIsCmXVSEyj
         jafMJe0shF7UJuWw65Z//ZHgH64hcQrwKNNr3irJrTAX1XB0xS6PIeLtqWHcyuD/NAmm
         FcTLBQuV7FB2Lq9h+crFktFJD56onBCif/U8NkiWhxMcLzyZg5zNnDChGBmuTbr436q6
         NJ0/uAsm7Mv2QToEssVFX/ReBb44ztXtxCP+4hO5HC7QXCBllnovi1SlRInk/oww03Hw
         kwJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iEA2z7h5roaHdOOiakFPN8EBJnuMvYFHiTI2AEUpqhw=;
        b=saj02qmdVYtDqVH5z8Va6i8+s8v9LGYwDBBLXVQNnxm48Ral7vtNDx09KLxWz7E8KN
         Rtaf2qnLlLOurrT/JcD1Q5+fkerVK6lSurhN0HAmTg+g8RIRJEq/pYzONv9bsYuy00tS
         Q6floUxpvoyq5nepVwJ/d+Lai39ObQqdB7SbWB/gU57MTcxYcFmhr/SbSjmdX3lfJzRg
         /GXyUyTXRmfwy6b38vyG/Bh3VKigsDHMVvzoUKRRJYQOjluy6ZI/Y3wNVPNSpCRWCevD
         9JocGkJzReLm9WWssAWNxrEn9OKaUsv9KEIxnThuQa4v000/1MzGWb66tPxXSjTeYCMM
         UdRg==
X-Gm-Message-State: AFqh2kqZBn6B8vKXWYTjm2suwpaOpBU02YYBimG3a/YxijifWCej2piK
        EDoVVfBEYXSpJf2pTBHkO0u/AQ==
X-Google-Smtp-Source: AMrXdXvjUjnh+EXjicjBMLnDOa1R27wsk3E+NhgFoi/e3a1XMBHabZOTZhDjPOYrfWCakxRrZvYLAg==
X-Received: by 2002:a05:6512:3052:b0:4bc:af5:b8d9 with SMTP id b18-20020a056512305200b004bc0af5b8d9mr11605209lfb.6.1672326006638;
        Thu, 29 Dec 2022 07:00:06 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id b3-20020ac25623000000b004b4bae1a05asm3059669lff.293.2022.12.29.07.00.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Dec 2022 07:00:06 -0800 (PST)
Message-ID: <a3338564-c895-5558-8953-38287ea74797@linaro.org>
Date:   Thu, 29 Dec 2022 16:00:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 2/2] ARM: dts: n900: use iio driver for accelerometer
Content-Language: en-US
To:     "Sicelo A. Mhlongo" <absicsz@gmail.com>, linux-omap@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, tony@atomide.com,
        devicetree@vger.kernel.org, maemo-leste@lists.dyne.org
References: <20221227223841.2990847-1-absicsz@gmail.com>
 <20221229145251.3535402-3-absicsz@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221229145251.3535402-3-absicsz@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 29/12/2022 15:52, Sicelo A. Mhlongo wrote:
> The accelerometer in the N900 is supported by the iio-framework since commit
> 8a7449d68670a8f9 ("iio: accel: add support for LIS302DL variant). This commit
> switches to it and updates node properties to match the bindings of the new
> compatible
> 
> Signed-off-by: Sicelo A. Mhlongo <absicsz@gmail.com>
> ---
>  arch/arm/boot/dts/omap3-n900.dts | 52 +++++---------------------------
>  1 file changed, 8 insertions(+), 44 deletions(-)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

