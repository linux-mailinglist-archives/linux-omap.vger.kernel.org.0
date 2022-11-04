Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95F806196B2
	for <lists+linux-omap@lfdr.de>; Fri,  4 Nov 2022 13:58:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229749AbiKDM60 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Nov 2022 08:58:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230035AbiKDM6Y (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 4 Nov 2022 08:58:24 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 701E02E68F
        for <linux-omap@vger.kernel.org>; Fri,  4 Nov 2022 05:58:19 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id l39-20020a05600c1d2700b003cf93c8156dso1602997wms.4
        for <linux-omap@vger.kernel.org>; Fri, 04 Nov 2022 05:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZwyHad34mlqqMFn53iMCM8+Gqhzyvbyy9wGcSB66m8s=;
        b=neP1+M2g3j63Zk6HSrC43BrOUyCjmbe3/+IvveBVBi7gFujI/d+PxhgurHM3X/AWLP
         on484xeONjUN3C9AolgI+T10FS8j8TopMXBAWO14HZuYKvgO+eycy2CHuIVgGsjBsj7g
         2kurz8SrJM1ePJrlnrfcMAM7ZH5JyzdEaaw8uCXdV5U9EjrNc/yUX4lYJXYRLBMhNI8P
         FvWZYCEUmwfcwmQUGEJI8WrkGqvfdKiqJ1OUHYs4EhJQOzi0INPeOvoLxoO8Lgg/yLNQ
         8O8srjXkSmkuXFCQ59OJG1nXKFKtfI1xxMqqwlm+ryU15Z7qxmhTysmN8vSxZh0lNuQB
         jAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZwyHad34mlqqMFn53iMCM8+Gqhzyvbyy9wGcSB66m8s=;
        b=zFp4za6/zNJQ0NgYDUSrYmc5zvefOzRxPAPp2l23NDTyCvJa93F0kAW3q8iGekPAoN
         NyzRnN0AGNp49vJ5J0klmDRAFnfG5m8MrohEdgZVL7JVxE8UuA9UMN1e7rNNnVKWK7rD
         vJofTh4lLgf7Hra4Nqf8Ho3MmPUKxsQO5LkQwSKPVSSzPNR+XNQu7oYoBvqQId/Btemy
         HxTTqrtL3dX7dl3XwQBEw5PDlhq1HVmLQ82IszRGbgINZgKPFAQQqjO5Rsg7SFnN9Quf
         LGk58r0ncb3f3BpB9QuzjzssVXuUEj/HmNQtHfeCrgo9nCXyioBxy9LUcOfU0rzDTgPp
         EsDw==
X-Gm-Message-State: ACrzQf1IYU73WqwZOL/AZKWYJjFv7bXhviPdwhzx9L22a/7NjJyMFqcH
        WN6Hk7jOjEuQECUUvgbLbFeukw==
X-Google-Smtp-Source: AMsMyM4PSqJTDG/ErJjBhO/AmAS5cO82QRykgTTHga1nzb8GnNE2KHwmgXPc7rwm6thvlMQoPRjSCA==
X-Received: by 2002:a05:600c:1819:b0:3cf:63fe:944a with SMTP id n25-20020a05600c181900b003cf63fe944amr23041803wmp.17.1667566697875;
        Fri, 04 Nov 2022 05:58:17 -0700 (PDT)
Received: from [10.101.1.4] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id p10-20020a05600c1d8a00b003c6bd91caa5sm2941833wms.17.2022.11.04.05.58.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Nov 2022 05:58:17 -0700 (PDT)
Message-ID: <1383fd22-c720-811e-a2bb-be2151675089@baylibre.com>
Date:   Fri, 4 Nov 2022 13:58:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v6 4/6] mfd: tps65219: Add driver for TI TPS65219 PMIC
Content-Language: en-US
To:     Lee Jones <lee@kernel.org>
Cc:     lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        nm@ti.com, kristo@kernel.org, dmitry.torokhov@gmail.com,
        krzysztof.kozlowski+dt@linaro.org, catalin.marinas@arm.com,
        will@kernel.org, tony@atomide.com, vigneshr@ti.com,
        bjorn.andersson@linaro.org, shawnguo@kernel.org,
        geert+renesas@glider.be, dmitry.baryshkov@linaro.org,
        marcel.ziswiler@toradex.com, vkoul@kernel.org,
        biju.das.jz@bp.renesas.com, arnd@arndb.de, jeff@labundy.com,
        afd@ti.com, khilman@baylibre.com, narmstrong@baylibre.com,
        msp@baylibre.com, j-keerthy@ti.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-input@vger.kernel.org, linux-omap@vger.kernel.org
References: <20221011140549.16761-1-jneanne@baylibre.com>
 <20221011140549.16761-5-jneanne@baylibre.com> <Y1+q2Usm9ecicXqp@google.com>
From:   jerome Neanne <jneanne@baylibre.com>
In-Reply-To: <Y1+q2Usm9ecicXqp@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 31/10/2022 12:00, Lee Jones wrote:
>> diff --git a/include/linux/mfd/tps65219.h b/include/linux/mfd/tps65219.h
>> new file mode 100644
>> index 000000000000..2c1cf92e92ac
>> --- /dev/null
>> +++ b/include/linux/mfd/tps65219.h

>> +/**
>> + * struct tps65219 - tps65219 sub-driver chip access routines
>> + *
>> + * Device data may be used to access the TPS65219 chip
>> + *
>> + * @dev MFD device
>> + * @regmap Regmap for accessing the device registers
>> + * @irq_data Regmap irq data used for the irq chip
>> + * @nb notifier block for the restart handler
>> + */
> 
> This header needs work.
I'm not sure to get your point here. Just something like below to match 
format or do you expect more:

/**
  * struct tps65219 - tps65219 sub-driver chip access routines
  *
  * Device data may be used to access the TPS65219 chip
  *
  * @dev: MFD device
  * @regmap: Regmap for accessing the device registers
  * @irq_data: Regmap irq data used for the irq chip
  * @nb: notifier block for the restart handler
  */

> 
> Can you try an compile with W=1 please.
This raise one warning on mfd:
drivers/mfd/tps65219.c:28:12: warning: ‘tps65219_soft_shutdown’ defined 
but not used [-Wunused-function]
    28 | static int tps65219_soft_shutdown(struct tps65219 *tps)
       |            ^~~~~~~~~~~~~~~~~~~~~~
soft_shutdown has been validated and is used in TI baseline even if not 
hooked in upstream version further to this review:
https://lore.kernel.org/lkml/20220825150224.826258-5-msp@baylibre.com/

It was a TI requirement to implement it...
Let me know if you want me to remove this function or if we can keep it 
like this.

