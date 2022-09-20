Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A4625BE457
	for <lists+linux-omap@lfdr.de>; Tue, 20 Sep 2022 13:24:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229795AbiITLYD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 20 Sep 2022 07:24:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229925AbiITLYA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 20 Sep 2022 07:24:00 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E716D5EDC8
        for <linux-omap@vger.kernel.org>; Tue, 20 Sep 2022 04:23:59 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id l12so2565737ljg.9
        for <linux-omap@vger.kernel.org>; Tue, 20 Sep 2022 04:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=/0mHSVnSHyZzrC5ifeYDLHWwTr31LJ+v7YO3CdpHIYw=;
        b=q4OjpwV3vvU5p4r3i538IRLcqFf0ti63PbfEmifJlcEaaJQ99fGSvCnoqR0gv+SehV
         09+khHED4vOB7NhXS8GwiAYfl6p7y6V6AVDE5X1XGoIHk6roNimjcHr9h/YszqVX9jyI
         00+oiksBa/FU+tYYGdB2um+hbTEqBrwKWTAO9yShjvU2eR0ng+5u/TGfzBQSRSogrpZd
         DlfIhgekcUmz9nbUiKu4GJ3JvQQdIydt3mzcnNr5NS/ibD0yEmVeoJNNXpQvbULx7w1O
         CtD+IPUO+GMkcIa+/ddEY6Fh6mVJoC+PnqmbmeWgP0Huwa9JhpImGvuQk5dnA1S91b1c
         RlfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=/0mHSVnSHyZzrC5ifeYDLHWwTr31LJ+v7YO3CdpHIYw=;
        b=al8pz2HwxE3JN4zLkcy1X64bRfA4CdewReXbpdzbsnpDme/hjqamHD4eBbqyo34ZHI
         u9aEe1s1B/04bOJLdZsLgVMey7s462lFkj7hKHzQUYwO65MN+bmhTO8StGxPz9TrM4hX
         p7tTpli4hryJ7ilf9ZRjXvZwAxbJVgewpEl8UZ/AYrBy/Tk/47RfqqWhrmo6+iU96URn
         TvWj13ysdvv260zTAWa82MNIR6N1RX8ur2iS+GtgaRcuMBLIxTHS8rpbiOWUsSuWzjp9
         2h9M0PJ+VK/hDSf3UxeIzrnl2PeeI+CxaBcif3bIsthzM97VipB6vr1iM+CAaYGmdJSq
         5csg==
X-Gm-Message-State: ACrzQf3TuxS64Aphf0LJvvwQaCcl5p41iWUQxrvQ43Uw8AtwwcjVTTqw
        2psb3rVFppvba5RtLDfbp26tUXUfnp1RCg==
X-Google-Smtp-Source: AMsMyM5abCZSXw/1C0P6ylmk8JbvIszYe7SescGOUEjyz74shfmm2JPEpDk1rGI3TqWGnPQKxmFu5A==
X-Received: by 2002:a05:651c:194f:b0:26c:b2b:83d7 with SMTP id bs15-20020a05651c194f00b0026c0b2b83d7mr7163502ljb.218.1663673038316;
        Tue, 20 Sep 2022 04:23:58 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id e16-20020a056512091000b00492d7a7b4e3sm273639lft.4.2022.09.20.04.23.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 04:23:57 -0700 (PDT)
Message-ID: <8d45ba5e-4d69-899f-94f3-af4374a870b2@linaro.org>
Date:   Tue, 20 Sep 2022 13:23:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v5 2/3] memory: omap-gpmc: add support for wait pin
 polarity
Content-Language: en-US
To:     "Niedermayr, BENEDIKT" <benedikt.niedermayr@siemens.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Cc:     "rogerq@kernel.org" <rogerq@kernel.org>,
        "tony@atomide.com" <tony@atomide.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
References: <20220916120749.2517727-1-benedikt.niedermayr@siemens.com>
 <20220916120749.2517727-3-benedikt.niedermayr@siemens.com>
 <6dd3d41b-eb75-3754-8a17-a8cb4bc838a8@linaro.org>
 <f6f59421ac9b0e2c0b85918282c33f325726c4bd.camel@siemens.com>
 <cdc59072-648c-ce53-b9a5-b796d379e575@linaro.org>
 <24e5fa6065f68a25226b4aee02b8f900b630befa.camel@siemens.com>
 <0afa173f-9f7f-b2c8-7abc-2384ee46429d@linaro.org>
 <df05bbf214c92fcda6d7b003b49f20fd8755b97c.camel@siemens.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <df05bbf214c92fcda6d7b003b49f20fd8755b97c.camel@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 20/09/2022 12:12, Niedermayr, BENEDIKT wrote:
>> I commented exactly below the line which I question. I don't question
>> other lines. So let me be a bit more specific:
>>
>> Why do you need
>> "p->wait_pin_polarity != WAITPINPOLARITY_DEFAULT"
>> ? Can you write a scenario where this is useful?
>>
> Ok. I think I got you now. Sorry I'm relatively new to OSS contributions, so please be patient with me...
> 
> If I remove that part of the if clause, then an error message would be printed in case "p->wait_pin_polarity == WAITPINPOLARITY_DEFAULT".

Exactly this will happen. As expected. This value cannot appear in DTS,
therefore I would expect error message.

Now you allow such value in DTS which is not the same as your bindings.


> But this is a not an error case. WAITPINPOLARITY_DEFAULT is a valid value, is assigned right before the if clause as an init value(not extracted from DT),
> and leads to not touching the GPMC_CONFIG register in gpmc_cs_program_settings().
> So in gpmc_cs_program_settings() if:
>     p->wait_pin_polarity != WAITPINPOLARITY_ACTIVE_HIGH -> Issue a write to the GPMC_CONFIG register
>     p->wait_pin_polarity != WAITPINPOLARITY_ACTIVE_LOW  -> Issua a write to the GPMC_CONFIG register
>     p->wait_pin_polarity != WAITPINPOLARITY_DEFAULT     -> Do not touch the GPMC_CONFIG register
> 
> We want to preserve the reset value of the GPMC_CONFIG register in case the DT does not use the "gpmc,wait-pin-polarity" property. Otherwise
> we might break platforms which rely on these reset values. 

Best regards,
Krzysztof
