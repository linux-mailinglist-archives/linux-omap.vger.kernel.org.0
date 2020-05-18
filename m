Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75FD11D7F81
	for <lists+linux-omap@lfdr.de>; Mon, 18 May 2020 19:01:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726958AbgERRBl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 18 May 2020 13:01:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728156AbgERRBl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 18 May 2020 13:01:41 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B90A8C05BD0A
        for <linux-omap@vger.kernel.org>; Mon, 18 May 2020 10:01:40 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id w7so12673489wre.13
        for <linux-omap@vger.kernel.org>; Mon, 18 May 2020 10:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=A6wVB9L5JuVcZQhVgNV1j0Bavs6H5jtfAqYurATa2Do=;
        b=bdA653P/QboIHjRsQ/kXQWemQ8gbXJMRQu3sewNP+YlMuTl/p+foWkhrLBStyDO3gs
         P2xavifo28Zofs/Rb7dMxZhbpgta+7Kk+bqr4BIbGuby4R3WDa5HKRGg2vGBBRVYB4YQ
         aEDQ+ayplQUHRW1UmsY0tBOxCcGFp4kf4pIW4vhdh0O3Vkmx23NrQLjGIW0bxNe7fNj3
         V7gc+n4557nQQNW5GXTQMVbWEL++D8cGjwykRK1eXP54o8As3O6011hEi6Ugivsi8Aeo
         m//EeAkt88jJOpWwhlanVeKgEjGYuzreqBkcqexXZUxp3lcCujAJH3Tu31bBPV06jEiR
         6l1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=A6wVB9L5JuVcZQhVgNV1j0Bavs6H5jtfAqYurATa2Do=;
        b=lalHJ4qbfr0ZupLSiauK4DoKBdHszjlXBoE2OxK3tYCQQYesY+fhQNH4+5jiTRAR58
         2hxTqJoXyqCsoHUpOJ4yyo4t5QgfPohOdhThTbzHILqBNL3EV8Chlu+v97Kl/OvBbMZZ
         JAR37Pz00JtrWKQ3AQ4rpoKpLywGsy/JwDxjslrKMBddIbqP1Szv8j+O5UAa01kR2y5E
         IKbrl76UeWow4IOmcACIydSvBikQDPSa7nH+O+TLexwHA765yL92G0UdeehdK5I93TSr
         VeDQ+slBqi5cZIij/2Tvo/84jfbfqDkvwNw2E4ZHh8KO4SN14IIQVMlXfiqrI5urDXZ1
         OxZw==
X-Gm-Message-State: AOAM532rYpFHRqFR4oPVS4Fbe9wR8/TMca8JTGMt9++AGjrf7+NPFk9j
        Hk7ChJh37k3fnKBLj4yEHSagrA==
X-Google-Smtp-Source: ABdhPJxWOh06HcVOViu4DIpbbOhR0OOnnCEwdTI40X9By447kp5WfnRE1ew1W4UPHl9Gn9nhNxTnxg==
X-Received: by 2002:a5d:6283:: with SMTP id k3mr20606675wru.62.1589821299348;
        Mon, 18 May 2020 10:01:39 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:9e7:3ac5:a930:2cd8? ([2a01:e34:ed2f:f020:9e7:3ac5:a930:2cd8])
        by smtp.googlemail.com with ESMTPSA id m13sm178601wmi.42.2020.05.18.10.01.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2020 10:01:38 -0700 (PDT)
Subject: Re: [PATCHv3 00/14] Update omaps to use drivers/clocksource timers
To:     Tony Lindgren <tony@atomide.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Adam Ford <aford173@gmail.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Brian Hutchinson <b.hutchman@gmail.com>,
        Graeme Smecher <gsmecher@threespeedlogic.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Tero Kristo <t-kristo@ti.com>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20200507172330.18679-1-tony@atomide.com>
 <340cdd4a-d996-073f-127d-89ce6c05f221@linaro.org>
 <20200518170059.GR37466@atomide.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <c2404711-af5e-e9a2-29c1-55378522ebd2@linaro.org>
Date:   Mon, 18 May 2020 19:01:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200518170059.GR37466@atomide.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 18/05/2020 19:00, Tony Lindgren wrote:
> * Daniel Lezcano <daniel.lezcano@linaro.org> [200518 16:59]:
>>
>> Hi Tony,
>>
>> On 07/05/2020 19:23, Tony Lindgren wrote:
>>> Hi all,
>>>
>>> Here's v3 series to udpate omaps to use drivers/clocksource timers for
>>> the 32k counter and dmtimer, and to remove the old legacy platform code.
>>> Please review and test.
>>>
>>> I've updated the timer-ti-dm-systimer.c patch based on the comments from
>>> Daniel and Rob, and added support for selecting the preferred timers to
>>> use.
>>>
>>> Then for merging when folks are happy with this series, Daniel if you
>>> can please apply the first three patches into an immutable branch it
>>> would be great.
>>
>> so the clk patch also ?
> 
> Oops sorry, just first two are needed as we no longer need the
> device tree binding changes :)

Ok


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
