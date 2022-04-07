Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5BBD4F7997
	for <lists+linux-omap@lfdr.de>; Thu,  7 Apr 2022 10:26:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233681AbiDGI2W (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Apr 2022 04:28:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243115AbiDGI2J (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 7 Apr 2022 04:28:09 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D40EC4EDF5
        for <linux-omap@vger.kernel.org>; Thu,  7 Apr 2022 01:26:09 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id h16so3033780wmd.0
        for <linux-omap@vger.kernel.org>; Thu, 07 Apr 2022 01:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=IbaM44rkmlTT1gjmeeX72ZcY1dxEtnD4IBMb0LHC26k=;
        b=BotwSCb/esafXxXtBOsTKs84X3EnnDPMT/i15+fH2fbwDSiwhBXqJTP869eaLt9dQ1
         xgi/yBkHdsqcJWuN/0DARt8nyzMmrfB1Qx5QhU/fY4ObapY6Ba2Q9hscSVkx8Crx5LA4
         AhWuAW0fA1O6Cfk7aBMwAHcy6XD7bKXqoQlt/OCi+b0cJZwJsFamIn7Nu446CM2MeQSE
         Swg6ltwBkHySKF88rnQG66wiSLi0XIFhFN9gB8BOD1cl8KoUdqkl1YnXPeQIZITB9XgL
         aDR252/M3vWF7OnxBrDgh7+q/SIVTa1lR/xE/d8Nuhr7bqa1jQMuHia3AZIXzMXMGB5b
         vBTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=IbaM44rkmlTT1gjmeeX72ZcY1dxEtnD4IBMb0LHC26k=;
        b=py7Q84c1ibJo16PSYyM8U+p7jcDq69dQfZnwpchPaW6venDx5wf64Jj3zy4jzM4FBK
         HaffRpEFBQk+pd4GlpOJ5eUIC3E2YVRsPAmZAZHZ8KHhY+GB2OSuoE5Y2y+oN7r8234A
         fruan3uMUA+w9xwxqSiC0l6HP4e5XSoOohrMHPgoWz9f96sD5pwuC9wqZCcLoHX+ICA9
         lya1yEUcdX2zsiblmVbVJommmJPU/4NjmyxXbHehAcnH5NmSFJXBDwGjSDwPStkup1vB
         6BA/7QhRJ/a/1FBE4TUytRJzahPFaredBzlNdfu21DNbBhd6Ol0wGAoSUruD2obn/VAo
         cGxw==
X-Gm-Message-State: AOAM530kqhdECSKKdYE6evIuAuSGpvzIDhbUoKmUS3U6HAYhyoac4b/b
        3DilCoPv+Ejgx64cY6g5NtCNSg==
X-Google-Smtp-Source: ABdhPJwyakkoiqpojLR0mTGtjAuUfUQRR6NcmK/JEz1nk4+LucVmW6kxhPjPs/aGItlGGDqZHa7wNw==
X-Received: by 2002:a05:600c:a03:b0:38c:f953:ae13 with SMTP id z3-20020a05600c0a0300b0038cf953ae13mr10929867wmp.99.1649319968301;
        Thu, 07 Apr 2022 01:26:08 -0700 (PDT)
Received: from ?IPV6:2a01:e34:ed2f:f020:f2a2:7d81:4e67:6c1c? ([2a01:e34:ed2f:f020:f2a2:7d81:4e67:6c1c])
        by smtp.googlemail.com with ESMTPSA id n37-20020a05600c3ba500b0038cc9d6ff5bsm7018898wms.4.2022.04.07.01.26.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Apr 2022 01:26:07 -0700 (PDT)
Message-ID: <7f3cbdf3-401c-6c30-20fa-b5121bd3f63d@linaro.org>
Date:   Thu, 7 Apr 2022 10:26:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/4] clocksource/drivers/timer-ti-dm: Update defines for
 am6 for inline functions
Content-Language: en-US
To:     Tony Lindgren <tony@atomide.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
References: <20220407071006.37031-1-tony@atomide.com>
 <20220407071006.37031-2-tony@atomide.com>
 <9671f0a5-6860-8a75-d65e-345ce890cd88@linaro.org>
 <Yk6drKxwOSVdrKp+@atomide.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <Yk6drKxwOSVdrKp+@atomide.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 07/04/2022 10:15, Tony Lindgren wrote:
> * Daniel Lezcano <daniel.lezcano@linaro.org> [220407 08:01]:
>> On 07/04/2022 09:10, Tony Lindgren wrote:
>>> @@ -251,7 +251,8 @@ int omap_dm_timers_active(void);
>>>     * The below are inlined to optimize code size for system timers. Other code
>>>     * should not need these at all.
>>>     */
>>> -#if defined(CONFIG_ARCH_OMAP1) || defined(CONFIG_ARCH_OMAP2PLUS)
>>> +#if defined(CONFIG_ARCH_OMAP1) || defined(CONFIG_ARCH_OMAP2PLUS) || \
>>> +	defined(CONFIG_ARCH_K3)
>>
>> Why not replace the above by CONFIG_OMAP_DM_TIMER ?
> 
> Hmm that's a good question for why it was not that way earlier.
> 
> This series changes things for tristate "OMAP dual-mode timer driver" if
> ARCH_K3 || COMPILE_TEST though. So the inline stubs are still needed for
> COMPILE_TEST it seems.

But if ARCH_K3 or COMPILE_TEST is set, CONFIG_DM_TIMER is also set, no?


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
