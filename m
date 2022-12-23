Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8FC2654FC1
	for <lists+linux-omap@lfdr.de>; Fri, 23 Dec 2022 12:32:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236183AbiLWLco (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 23 Dec 2022 06:32:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236092AbiLWLck (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 23 Dec 2022 06:32:40 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A19F22B26
        for <linux-omap@vger.kernel.org>; Fri, 23 Dec 2022 03:32:35 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id y4so4709089ljc.9
        for <linux-omap@vger.kernel.org>; Fri, 23 Dec 2022 03:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sBnasNl+f/xenJgHP7GIyyOhONyzVUWiXschE4z7WNY=;
        b=LFj54pvHuw7qmzit85ld1l+UehIwNgT2FQy+RGtMaP5grAkemH8QZAbpMGe2dFk1zU
         LBx9xN2eu8+5xEYzcrtUbES0tIe8Dg81K00EnNS6TK4YmwfOB4FSV3DcSR18SHViwdpU
         B9YhhR6TLLxRYWXzeWLSo6VsAUBK9FyieqRJvLh4FvT87NLUf2G7578hw3KVD0OGrSSb
         +M/Rsxym4jFO5iYit8+1HiP31lTloZHy7YpxukeR6NeoZF9FU8/hD1YBg50HannGsdN+
         NFR6pHYKXGMX2xYVNyR2tldTFYYlxxyqmjtrr4s/UBbsxyPm8vqF59wUE/35xFnIPFRO
         eVxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sBnasNl+f/xenJgHP7GIyyOhONyzVUWiXschE4z7WNY=;
        b=KNbSEucH2Gy7aJ7fj3rOh+YtD/PR9sM8eZTdZgrzx26i5mZvh3DCqOpp401QPM42Iu
         yzxnyo5T67Rd32WsLpcSXsHBIM1C3ZFM/qk/rpvpZwo4j5Q7Xx8/7Zeda2NOfIHj+mj/
         fe1eWxVyEN6GKGiAJ/v9T9vMUaDrIwRVUiNTjwb/vSKERhsm9DHUhUcVhjFvlToBVRF9
         0QAwUZrkagpgo+bKHXPaNL6DcHmXqzSKj5F+AzBer766MwnzqQCzpq1OZrILeZcaSfMb
         agJBW7xMV1sk0kHMJJJ2Gkz/8D7K1xgtA83dVjHYvhsVeX1fzCcKyxRLLZrP42uRNrXF
         Rjxg==
X-Gm-Message-State: AFqh2koe24aXc6vPpVJibhW3Wah7DHYiRQBPBODebDTQ0bEVkAyxWJfE
        LprBUMYk8w6OKZsiVdvECloHtw==
X-Google-Smtp-Source: AMrXdXu+PWU5lKtLXrjZCdv12/5Pcq1pvhvv3XV8RoHHHb3OtCTT1HJIA4IPXYEM9oX4kKlX+WVTpQ==
X-Received: by 2002:a2e:3803:0:b0:279:8e95:a3d with SMTP id f3-20020a2e3803000000b002798e950a3dmr2341593lja.13.1671795153955;
        Fri, 23 Dec 2022 03:32:33 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id z5-20020a05651c11c500b0027da3a87ff6sm387064ljo.83.2022.12.23.03.32.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Dec 2022 03:32:33 -0800 (PST)
Message-ID: <e7960761-07c1-8cc7-60b3-1454ddb9317b@linaro.org>
Date:   Fri, 23 Dec 2022 12:32:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 2/2] net: ti: icssg-prueth: Add ICSSG ethernet driver
Content-Language: en-US
To:     MD Danish Anwar <danishanwar@ti.com>,
        "Andrew F. Davis" <afd@ti.com>, Tero Kristo <t-kristo@ti.com>,
        Suman Anna <s-anna@ti.com>, Roger Quadros <rogerq@kernel.org>,
        YueHaibing <yuehaibing@huawei.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Eric Dumazet <edumazet@google.com>,
        "David S. Miller" <davem@davemloft.net>, andrew@lunn.ch
Cc:     nm@ti.com, ssantosh@kernel.org, srk@ti.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        netdev@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20221223110930.1337536-1-danishanwar@ti.com>
 <20221223110930.1337536-3-danishanwar@ti.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221223110930.1337536-3-danishanwar@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 23/12/2022 12:09, MD Danish Anwar wrote:
> From: Roger Quadros <rogerq@ti.com>
> 
> This is the Ethernet driver for TI AM654 Silicon rev. 2
> with the ICSSG PRU Sub-system running dual-EMAC firmware.
> 


(...)

> +
> +/* Memory Usage of : DMEM1
> + *
> + */

??? What's this?

> +
> +/* Memory Usage of : PA_STAT
> + *
> + */

Same question.

> +
> +/*Start of 32 bits PA_STAT counters*/

That's not a Linux coding style. Add spaces and make it readable.

Best regards,
Krzysztof

