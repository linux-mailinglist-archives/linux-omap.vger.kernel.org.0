Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A03725F5303
	for <lists+linux-omap@lfdr.de>; Wed,  5 Oct 2022 13:00:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbiJELAs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 5 Oct 2022 07:00:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbiJELAr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 5 Oct 2022 07:00:47 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C750427CD3
        for <linux-omap@vger.kernel.org>; Wed,  5 Oct 2022 04:00:45 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id bu25so25024587lfb.3
        for <linux-omap@vger.kernel.org>; Wed, 05 Oct 2022 04:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=SMc5GrDsQK2uk8JYuYCym6ox4vrnZK3Nab0TKqEx9uo=;
        b=NE+CHxHJyZm4Jmpe4nAr2MpnE8Pqtx/2we77tsoSncE4zm5laueg2i8fn/MlKMb7bV
         7ch9DC1nWmhfcScP52AH6cVF7u3ebYJrVABAyJiSzQ6Zxgcv7Z78ux0GcxoRmp/hhybx
         qtd04M/5MOPgaBOWlJnBkf2MGcf3XXawKCvqH32lLDl76qTnQEoiHQcrOucLhP41+EfX
         h0/9BBhVbPOO67XxHyIEPPgfJRBvd2RTSh70bKY4+Eu7VikTcob8ySO0D3CBmmMeL7m0
         magvg+2X51kF7/FLy81NEQF2DHlkHBQ7lIkiOqTYTXnQXss4kh0IrtcN6artmfeJsuRZ
         U/fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=SMc5GrDsQK2uk8JYuYCym6ox4vrnZK3Nab0TKqEx9uo=;
        b=Bgf0+0warrE3E6ehesfBkqe322SgutzLFCm9GWnMIKpLAEpG+1ooHrtxejNYvVZBlh
         hNYOcxrwiXXvDHWPP/pMZefoRuKE5evb2k3KaTbj/3G8P9LBcF+hWiyyE7taEGfPliKJ
         LEkw9B84ulAyXzFn/KskFBRNJQloaJ+CsuSlgLLYLwOKO4IGV/MRChEm56ARBjiOQDCW
         SUOYxxBFhzB8Jb/BMaCnEx6y8vAx5VkgmX5rg1d4wjuj1TNgaqgfd0rWyyRVS02Dejke
         9YvQqoFHKTtD5FIdNtwbkKF2FuOYM82nUYLmB5b31ffUWVIZRpuzU4FurYldnfVx6Lul
         ozIg==
X-Gm-Message-State: ACrzQf2+rEl90/mw4IC/w0LKQbRbuCSR2vc+YYiXqO3Gr9l4Me3hGHYP
        VmyzXQ12ICXlgxpupegANTLgyhN4KqJLCw==
X-Google-Smtp-Source: AMsMyM7vfd2AANDdBbZLQtAL4pt6fMGDNpa4Hl2WnhysNIpRsdjVzcttIZMduNtQBrpMAx14pfYLWA==
X-Received: by 2002:ac2:5f84:0:b0:4a2:2b61:289b with SMTP id r4-20020ac25f84000000b004a22b61289bmr6145634lfe.225.1664967644094;
        Wed, 05 Oct 2022 04:00:44 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y1-20020ac24461000000b0048fdb3efa20sm2304701lfl.185.2022.10.05.04.00.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Oct 2022 04:00:43 -0700 (PDT)
Message-ID: <c97db3d3-ccb2-fef5-070c-901053e6e353@linaro.org>
Date:   Wed, 5 Oct 2022 13:00:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v6 2/2] dt-bindings: memory-controllers: gpmc-child: add
 wait-pin polarity
To:     "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>,
        "robh@kernel.org" <robh@kernel.org>
Cc:     "rogerq@kernel.org" <rogerq@kernel.org>,
        "tony@atomide.com" <tony@atomide.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
References: <20220929125639.143953-1-benedikt.niedermayr@siemens.com>
 <20220929125639.143953-3-benedikt.niedermayr@siemens.com>
 <20220930194257.GA756240-robh@kernel.org>
 <fc1d354d307487de2dc8e715c202affd76f96866.camel@siemens.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <fc1d354d307487de2dc8e715c202affd76f96866.camel@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 05/10/2022 12:13, Niedermayr, BENEDIKT wrote:
>>> diff --git a/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-
>>> child.yaml
>>> index 6e3995bb1630..477189973334 100644
>>> --- a/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
>>> +++ b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
>>> @@ -230,6 +230,13 @@ properties:
>>>        Wait-pin used by client. Must be less than "gpmc,num-waitpins".
>>>      $ref: /schemas/types.yaml#/definitions/uint32
>>>  
>>> +  gpmc,wait-pin-polarity:
>>
>> 'gpmc' is not a vendor. Don't continue this bad pattern, use 'ti'.
> 
> You are right. But nevertheless I can't agree with that in this patch series.
> I don't want to break consistency, since all bindings currently use 'gpmc'. At least this applies
> to the "ti,gpmc-child.yaml".
> 
> I think it makes more sense to create a complete new patch series for that specific change? This change
> wouldn't fit thematically the current patch series. 
> 

So you want to add new property incorrectly named and immediately new
patch which fixes the name? No, please squash this new patch into this.

Best regards,
Krzysztof

