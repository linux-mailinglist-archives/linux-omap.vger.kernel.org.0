Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A11E2B03E0
	for <lists+linux-omap@lfdr.de>; Thu, 12 Nov 2020 12:31:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727789AbgKLLbv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Nov 2020 06:31:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726776AbgKLLbW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 12 Nov 2020 06:31:22 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0371EC0613D4
        for <linux-omap@vger.kernel.org>; Thu, 12 Nov 2020 03:31:21 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id p1so5596731wrf.12
        for <linux-omap@vger.kernel.org>; Thu, 12 Nov 2020 03:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3hFMOP1kaxx+iv9jwczEH0E7M8oIpI0wqn8jI0YaIqg=;
        b=KWiedg5B8zn8+OwTMdiLZ4n5EMt3C6INPsBizaMz8ELeM8BUQGUIavGDdB9r4HTo4c
         F+vGtgQu+WQ8/iG623+aYr8VF4o38HJZKpHY3uBooBfaPRBfKoO815KlHlLJ9aTzUsJ2
         pIuVq3+JI/A3T2nqK9xNMJD/bNOHF0DZS2eU9qF1DmJF8KVRier9cXpnFPvjx/Aoh+9e
         eEGLoeo3uTbbnZqUv3f0qXPHbzP8Cm8GwGmerb3VVxsh5s4P/YWB90B0BIyk+dyYQCeu
         YT0IVs71kpfrQl9SS1js/LmN7m5h4Woad3ZvPGpozgJfiVbyPj32xJlt7g85l5CyVkBU
         olQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3hFMOP1kaxx+iv9jwczEH0E7M8oIpI0wqn8jI0YaIqg=;
        b=PBaI6NhXNKWW5SvINtWH95B0hVVA8BVCYlXgFfPIhgbf4sz7igsm7v7DTCncz7LWIc
         nnV4zQTlCSU+Tl7dbtJ5gfAdVxEVrDaXfJGxIvLQ5JraiM8K3e6HxH4nBkttF686TjOe
         IOZBzl4671BmaiaLheal9dBPgMsMORhjcR2laAOOyg7ReLbGYg9GtQS6FmZu3QRCKnWH
         SlC9ezRlQBBRQvyrlHRQes7emLRHfDYLjtLQgwORy/lXOejjQl6gBYpfZ0tDbEQKyz7v
         BD9yuthVIYeCJN1HXVAgcSnhAEBr8TimfDfoi42m3Xx7ErglIPVEBLUCzaFMLmlKyg9S
         9TGg==
X-Gm-Message-State: AOAM531IMwecsE3tLWlF/QbKzi+mr4aQPq1VeqtFlTClIP5zHLe0zUA0
        8h9NQHeaqdT3LCtXNIbRQHw2SQ==
X-Google-Smtp-Source: ABdhPJxJS6tYcViiFkrzHimtT5xX5JSJCBovTbYGDgIf8pM3wALfxQu5oLVoNrcxEt8jioJWJdBHuQ==
X-Received: by 2002:adf:82cc:: with SMTP id 70mr34276916wrc.74.1605180680484;
        Thu, 12 Nov 2020 03:31:20 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:6971:b700:3764:fa96? ([2a01:e34:ed2f:f020:6971:b700:3764:fa96])
        by smtp.googlemail.com with ESMTPSA id a18sm5854108wmm.22.2020.11.12.03.31.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2020 03:31:19 -0800 (PST)
Subject: Re: [PATCH] thermal: ti-soc-thermal: Disable the CPU PM notifier for
 OMAP4430
To:     Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Tony Lindgren <tony@atomide.com>
Cc:     edubezval@gmail.com, j-keerthy@ti.com, aford173@gmail.com,
        linux-pm@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        andreas@kemnade.info
References: <20201029100335.27665-1-peter.ujfalusi@ti.com>
 <20201029105125.GJ5639@atomide.com>
 <b05f4bae-c285-828b-d5f1-fbf8613b4ca4@ti.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <77940e9a-0e1a-f389-645a-071db5e1fcb5@linaro.org>
Date:   Thu, 12 Nov 2020 12:31:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b05f4bae-c285-828b-d5f1-fbf8613b4ca4@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 03/11/2020 07:42, Peter Ujfalusi wrote:
> Eduardo, Keerthy,
> 
> On 29/10/2020 12.51, Tony Lindgren wrote:
>> * Peter Ujfalusi <peter.ujfalusi@ti.com> [201029 10:03]:
>>> Disabling the notifier fixes the random shutdowns on OMAP4430 (ES2.0 and ES2.1)
>>> but it does not cause any issues on OMAP4460 (PandaES) or OMAP3630 (BeagleXM).
>>> Tony's duovero with OMAP4430 ES2.3 did not ninja-shutdown, but he also have
>>> constant and steady stream of:
>>> thermal thermal_zone0: failed to read out thermal zone (-5)
>>
>> Works for me and I've verified duovero still keeps hitting core ret idle:
> 
> Can you pick this one up for 5.10 to make omap4430-sdp to be usable (to
> not shut down randomly).
> The regression was introduced in 5.10-rc1.
> 
>> Tested-by: Tony Lindgren <tony@atomide.com>

Applied as a fix for v5.10-rc



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
