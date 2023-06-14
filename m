Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41FC07277E9
	for <lists+linux-omap@lfdr.de>; Thu,  8 Jun 2023 08:57:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231320AbjFHG5m (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 8 Jun 2023 02:57:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234264AbjFHG5l (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 8 Jun 2023 02:57:41 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44DCA2721
        for <linux-omap@vger.kernel.org>; Wed,  7 Jun 2023 23:57:32 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-976a0a1a92bso57121566b.1
        for <linux-omap@vger.kernel.org>; Wed, 07 Jun 2023 23:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686207450; x=1688799450;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fTEmXWIWLPRlPJbNfDbnj5fFPU6UIwT4EtE9XcJXYpo=;
        b=fdY8VREWA24ScfdNkwbMYQmKOkhE3ddtHYFvvkL+PHLVH2cqzdZQdNQbwYI4YEYrRm
         lNzOlQS2dVVyF8PHTvciHPJElyEsM8x0dp19wqDVcjG2r75sZK4GxLDbSkNxfR1uxVrQ
         bVdNIf5FgMXm6W64CTi62Gpk+gUW1Rfj2296JapH9iybASS0+IjcdnP/QVVtQrUDG7ZA
         eY1DE3OpXUFCBYO+iC3rbI5P18uQmKgPbzdZ9MGGavZ2kKyR9dTttjSf49wfAFRKyyYv
         monPxZQ8f75mDGVu6E9IIJvHt/S2dbWLhCOFPnEsWDEKrTLR/FL5AtQKZuspDrJeRjms
         WVJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686207450; x=1688799450;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fTEmXWIWLPRlPJbNfDbnj5fFPU6UIwT4EtE9XcJXYpo=;
        b=crUiznr8ZL3R0v52L/taIjMOHyAq+4awIy+ubiIHYw6YGMzpD7ZJDIwDtiWsyoNR/J
         Ly5O/uU+7dE8KRnpWyCZhrjoemhHCQtGt6Cbz4smkknZoneOR3p6VSpTu4UahxdtYYlX
         x7zQncqCKz3K4X1ZrC0FqC/tQQ8d/0KHzBQlhxJWAXoxxnq/Ey4GHHm3KgjBgkNjVBwB
         ymdbBtU6gDuWbRIczK/wW/gcCL7O66yOt7NHSSLYPZ465icGwHn3qsXcK0LqIs3p3rHM
         5YNLANilxI1i2panhZoeRW3CQ3he9G4+15tQ981ppziHq41VshQK/aebVoZb03VeRKoJ
         rCbA==
X-Gm-Message-State: AC+VfDwFCx8cIRvr4FC0UbgFFSaq4B/RwEFjAZmsUyvJZAq8IQw+isOd
        Zwa2TIc4aPD5Y7tn7SyupJHzXg==
X-Google-Smtp-Source: ACHHUZ5r72qNrLxouFjT3sMNlUhsJm5r5BSwsuYMBRi74sjTXzE0b/izv01udFnyO2URibDK+fCzsA==
X-Received: by 2002:a17:907:1c15:b0:96a:8c13:8dc0 with SMTP id nc21-20020a1709071c1500b0096a8c138dc0mr8865323ejc.37.1686207450589;
        Wed, 07 Jun 2023 23:57:30 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id r23-20020a170906c29700b0095807ab4b57sm283706ejz.178.2023.06.07.23.57.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 23:57:30 -0700 (PDT)
Message-ID: <19710587-533c-f6df-9842-06a8e2db263c@linaro.org>
Date:   Thu, 8 Jun 2023 08:57:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v6 1/1] dt-bindings: pinctrl: Update pinctrl-single to use
 yaml
Content-Language: en-US
To:     Tony Lindgren <tony@atomide.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20230605095216.18864-1-tony@atomide.com>
 <a4134777-e43c-4b74-58d8-bff0c0d1a6f6@linaro.org>
 <20230608063639.GD14287@atomide.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230608063639.GD14287@atomide.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 08/06/2023 08:36, Tony Lindgren wrote:
> * Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> [230607 18:17]:
>> On 05/06/2023 11:52, Tony Lindgren wrote:
>>> +title: Pinctrl driver for hardware with a single register for one or more pins
>>
>> I asked to drop the driver references but it is still here. Bindings are
>> not describing drivers.
>>
>> "Generic Pin Controller with a Single Register for One or More Pins"
> 
> Oh right it's supposed to describe hardware, will update thanks.
> 
>>> +patternProperties:
>>> +  '-pins$|-pin':
>>
>> you did not implement my comments fully, probably we misunderstood each
>> other. Why do you allow anything after '-pin'? Let's make it pure suffix
>> for both cases: '-pins?$'
> 
> I'll check what kind of node renaming that would cause. At least TI
> arm64 SoCs use naming like -pins-default and -pins-wakeup. Is your
> preference to rename all those nodes to -default-pins and -wakeup-pins?

No, pattern matching TI SoC is fine, but your current also doesn't. Or
rather - matches by mistake. You do not allow anything after -pins.

Best regards,
Krzysztof

