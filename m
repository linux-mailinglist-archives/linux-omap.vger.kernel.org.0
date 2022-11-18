Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59F8762F7F6
	for <lists+linux-omap@lfdr.de>; Fri, 18 Nov 2022 15:43:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241701AbiKROnj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Nov 2022 09:43:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234971AbiKROn0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 18 Nov 2022 09:43:26 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F68FEC
        for <linux-omap@vger.kernel.org>; Fri, 18 Nov 2022 06:43:24 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id t10so7096635ljj.0
        for <linux-omap@vger.kernel.org>; Fri, 18 Nov 2022 06:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WdF8bmxTWuHAOgXPKQhJz71OI4DmuJEnYLajXB4naGE=;
        b=UlYWsWnkKX84BrgCT6baoI5qXcZO5xYrQGHiXvml/paiD2nQcKag83WgiLgND4lP+L
         3J0ZjRWGM1KV3a8xC807o2/nUbJEe5oU5H8GXd5mxh4nPaRuvCOLSDDkk+WxpQZFq9CH
         6oCT6fQDH/WZzL8i+hB7H9dp5QJ2+TlwKy8MljvcgunpMhZklpWGcx8pZUEYuwlwDfi3
         Xj41uremO55AQZhWjIyXnrsOiLPe0qZMw0laqYw52NMQU/kOK5jLsS3fMSFWS12Y96If
         UG7yqQILptmXnJQzqNz8L1vFaJiguvl1p2et7gy7gIkjdPVC4uHun6s9fC/Lg1l4QdRF
         bOrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WdF8bmxTWuHAOgXPKQhJz71OI4DmuJEnYLajXB4naGE=;
        b=CYAcxn7988OHHCwRlgJWNzgik7qGa88ITmNUYL7AB5lYo6HkTyLFjx2fwztLJ0RK4Y
         ++5g+fod8MKO1ylOx4tRDoE1ZwGVS1LBXMC530NTOI+6tLBAMWj8W7+CEB7PGJMh0w0o
         ybUFkTGXRZXTXtNa41so0ibZuKY/6H77pDtxy+JhEfylgLdbhy0IsNBVSXYZXcjJ0lqR
         dm6JFsyjka2lnqOSzw7RhAT3ltpQ411h0ZfByZuiJouHPPGk5RDgO6J/XuO687fZB5co
         2h2SrMZREmcVkByjy8plmBrUc363oi6TfxjB3ZTFuY759MrkI+tOavgEYL5vA3ESpUPZ
         4tIQ==
X-Gm-Message-State: ANoB5pnblfRYtm2++M5II05jBt7DpaYsp6XWHgBPnoDgtTGiwz5xC3i3
        4wL4XbHAjxRXHv+PxjC5ym8keW6w4zj5U0cL
X-Google-Smtp-Source: AA0mqf4IAqdFaqstFGpytpeVt/fRY+TBWIEystdlMj4m9iyac5DL01XHArlgI9dvZlIgkQzCOoCIfg==
X-Received: by 2002:a2e:a806:0:b0:277:4b35:d94a with SMTP id l6-20020a2ea806000000b002774b35d94amr2443237ljq.21.1668782602704;
        Fri, 18 Nov 2022 06:43:22 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id m1-20020a056512114100b004acb2adfa1fsm677950lfg.307.2022.11.18.06.43.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 06:43:22 -0800 (PST)
Message-ID: <bedbaebe-d84b-fc0b-9492-4503a6d59a83@linaro.org>
Date:   Fri, 18 Nov 2022 15:43:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] dt-bindings: pwm: ti,pwm-omap-dmtimer: Update binding for
 yaml
Content-Language: en-US
To:     Tony Lindgren <tony@atomide.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
References: <20221118125435.9479-1-tony@atomide.com>
 <debfe50a-7e94-9703-efde-2c805faa3d2b@linaro.org>
 <Y3eXe/S6MMaDGwEt@atomide.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y3eXe/S6MMaDGwEt@atomide.com>
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

On 18/11/2022 15:32, Tony Lindgren wrote:
> * Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> [221118 14:12]:
>> On 18/11/2022 13:54, Tony Lindgren wrote:
>>> +properties:
>>> +  $nodename:
>>> +    pattern: "^pwm-([1-9]|1[0-2])$"
>>
>> Drop the nodename, device schemas do not need to enforce it.
> 
> Hmm I think that's needed to avoid warnings if the knob is
> tweaked to 11? Right now the max timer value is 12.

Which warnings? The pwm.yaml allows up to 15.


Best regards,
Krzysztof

