Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DC6324FBD7
	for <lists+linux-omap@lfdr.de>; Mon, 24 Aug 2020 12:45:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726767AbgHXKp4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Aug 2020 06:45:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727047AbgHXKps (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 24 Aug 2020 06:45:48 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77718C061575
        for <linux-omap@vger.kernel.org>; Mon, 24 Aug 2020 03:45:47 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id h15so1425326wrt.12
        for <linux-omap@vger.kernel.org>; Mon, 24 Aug 2020 03:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=X8bdXVUd2ZafGrZsydrb9Z2SDYX2iihTQNdU7gM/cJc=;
        b=djzw2pFL0sp4R2OU4tnnwlDJLAAGiiLxvawtf/pn6iCIU6rKtkt8eaf+BO9jA5tE2W
         HZovWyr/D7Ev8X3iAu7c+3MY4uzodttKCiscrln/O2s/iYqiN9YbWpUN4FyV4nGzBjg9
         Do35p2yVIlrImH/KJctjLq2ogKxPgGIZeBKnMc+TspcSiWZOExXE41sQDtBBlRuHaz6a
         XmI+4kdnLPo5RHDZnS4V1DlhaO2+G1oWBmVUvkplQ9h8RurrZRW5GakuTOQFrmqktkfX
         ZzwwzpzXtTHBsetSZT4X3vJEMR66UvXTTL2O4Jh1ApfFSG6mYBIkW0Vs8orRt2G65qIq
         bHHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=X8bdXVUd2ZafGrZsydrb9Z2SDYX2iihTQNdU7gM/cJc=;
        b=MxwBs1pC/96n1nDZcrdto8lzJRXg+zWAJker2+lNNmdsswVRgWND1sJcDwdXcy/TkU
         uzlqwAz2gajzI0LqfSzGeuZE2HeCgeCwD9z0iRzbYHhCN96mxWY2JJI4FFwk8KnKciT3
         zpaXPMUWukB1KUYI1rO/0ltywjoqr7vMpYc5es8Kl57j12yPRBksDzLRA3jNuAZLCfs5
         53L1MIelgjQjQEiV75THZxOmHqC3ZE1/dvqeh2eRKN8j9a0Mx8zwk01a7AfQWpRLe3oj
         tsK6+Kjr7h8ia8j8Dnk7HynDY+UNuQFSyh/GNhiPqRSfl6WyfFQKhtQ85J9uQER9WXFS
         hFFA==
X-Gm-Message-State: AOAM531MTcQHwrFCJP3DUnuTAPBK1nlh8nH/OUk33GvU99oqEHsn9zoT
        kAhirjoahlMEBvya54+6LhIt16+0ixCLhg==
X-Google-Smtp-Source: ABdhPJwJNM3y0nTcF+wtJ6Cz0O5X4b7N5G51v7E2SaMTd8WX5GsGNsYigj8nrXHBthl9cvaB+mDhtg==
X-Received: by 2002:adf:fe50:: with SMTP id m16mr5499738wrs.27.1598265946046;
        Mon, 24 Aug 2020 03:45:46 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:cd42:2fa4:120f:76b0? ([2a01:e34:ed2f:f020:cd42:2fa4:120f:76b0])
        by smtp.googlemail.com with ESMTPSA id j7sm10146855wmj.38.2020.08.24.03.45.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2020 03:45:45 -0700 (PDT)
Subject: Re: [PATCH] thermal: ti-soc-thermal: Fix bogus thermal shutdowns for
 omap4430
To:     Pavel Machek <pavel@ucw.cz>, Tony Lindgren <tony@atomide.com>
Cc:     Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, Merlijn Wajer <merlijn@wizzup.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
References: <20200706183338.25622-1-tony@atomide.com>
 <20200823211204.zerldmljfd6rrk7g@duo.ucw.cz>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <d359b309-7fa2-5089-df14-e27eafed96d1@linaro.org>
Date:   Mon, 24 Aug 2020 12:45:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200823211204.zerldmljfd6rrk7g@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 23/08/2020 23:12, Pavel Machek wrote:
> Hi!
> 
>> We can sometimes get bogus thermal shutdowns on omap4430 at least with
>> droid4 running idle with a battery charger connected:
>>
>> thermal thermal_zone0: critical temperature reached (143 C), shutting down
>>
>> Dumping out the register values shows we can occasionally get a 0x7f value
>> that is outside the TRM listed values in the ADC conversion table. And then
>> we get a normal value when reading again after that. Reading the register
>> multiple times does not seem help avoiding the bogus values as they stay
>> until the next sample is ready.
>>
>> Looking at the TRM chapter "18.4.10.2.3 ADC Codes Versus Temperature", we
>> should have values from 13 to 107 listed with a total of 95 values. But
>> looking at the omap4430_adc_to_temp array, the values are off, and the
>> end values are missing. And it seems that the 4430 ADC table is similar
>> to omap3630 rather than omap4460.
>>
>> Let's fix the issue by using values based on the omap3630 table and just
>> ignoring invalid values. Compared to the 4430 TRM, the omap3630 table has
>> the missing values added while the TRM table only shows every second
>> value.
>>
>> Note that sometimes the ADC register values within the valid table can
>> also be way off for about 1 out of 10 values. But it seems that those
>> just show about 25 C too low values rather than too high values. So those
>> do not cause a bogus thermal shutdown.
> 
> This does not seem to be in recent -next. Ping?

Pong.

Going back from vacation. Will be in next very soon.


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
