Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87A231D9BDD
	for <lists+linux-omap@lfdr.de>; Tue, 19 May 2020 18:00:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729160AbgESQAo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 19 May 2020 12:00:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729055AbgESQAo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 19 May 2020 12:00:44 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA18CC08C5C1
        for <linux-omap@vger.kernel.org>; Tue, 19 May 2020 09:00:43 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id y3so19929wrt.1
        for <linux-omap@vger.kernel.org>; Tue, 19 May 2020 09:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZgDKc3HEYEnyhOTY+wQvny/RRZ2rvIz9Ed6CzUywMNk=;
        b=Eq23zFrKqsJEF7WMk37RL9HDAg5eeAfNuJoLllOPXJZq5k3oneQ1YtMrHYsi4z39AL
         o4cJg/JHwMEUVYwWSoezsqcaXsMxGYv+nDOdlVBMgUI2MkOroGxR1QrYvy6VNMFqSnkM
         Xn+a2BnBAYcDYuYI8d1EdoYk8lxCoqkVhukHJSji8Q++Ywzqdt2eHIFg9K8GqFQ2R9Dg
         NnRYperS/dEp68p/jHcIdzoGjMVcCbW9I96vR/+S5CKl9kqL74rUj6nLWaAe/XWkILlv
         ngsJFGKW4rS0GS9ODLBTp7vdAJQGkQeque5riA0PgYITWqi2BRO847/Y1hNCfxaC5Cts
         UzJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZgDKc3HEYEnyhOTY+wQvny/RRZ2rvIz9Ed6CzUywMNk=;
        b=Sh+3IMhbwuwMCkdKknQWk78kAep4j3h620oJy+vqLGWTQ3Rp69BhgAtK55fE5l3UDe
         1zVxcT9p4b34RnArswnjIOpaHqMPPB97upEwBRS5sAOOZhaf/i1Ofvr4SqybLn+Y8y+c
         AKE0AIMs0X8afJQ+UNdGil4WeevxB+5n+fUu5lwTEZOk0YjgQ89J1Tor2rsddfVghqpB
         qLRBj3JcdRQWE9cm6TP0uGGn6jKQgHsmhZZ5Al00UgGrAbBpsUk710pFi8wcnATFXYgZ
         w0zll8+2oA7IrcesYRYs8tYumbCURTmBuJDEEWnIueUYVW3f2EcZDwNjtZf5gsi0tsnU
         H+ag==
X-Gm-Message-State: AOAM530GnmjLZGKsif6rmSjuV3HuTolOIM+u/LVzuuCekPn3+6niTMc9
        K+L+WSwxq6YekKGssZBjWmg1rQ==
X-Google-Smtp-Source: ABdhPJxGVpesohvaaRIa7+vBgDYIMXNEEmp86gTxM/Sz51g4e2Mut4SoxAPLfwG5D/qKdaXzK/rZ9g==
X-Received: by 2002:adf:e951:: with SMTP id m17mr26966121wrn.352.1589904042372;
        Tue, 19 May 2020 09:00:42 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:e504:4297:986:ffb0? ([2a01:e34:ed2f:f020:e504:4297:986:ffb0])
        by smtp.googlemail.com with ESMTPSA id c17sm21759979wrn.59.2020.05.19.09.00.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2020 09:00:41 -0700 (PDT)
Subject: Re: [PATCH] clocksource/drivers/timer-ti-dm: Fix warning for set but
 not used
To:     Tony Lindgren <tony@atomide.com>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        kbuild test robot <lkp@intel.com>
References: <20200519155157.12804-1-tony@atomide.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <2f67a110-e52f-94fc-fae2-c3171a67bb8a@linaro.org>
Date:   Tue, 19 May 2020 18:00:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200519155157.12804-1-tony@atomide.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 19/05/2020 17:51, Tony Lindgren wrote:
> We can get a warning for dmtimer_clocksource_init() with 'pa' set but
> not used. This was used in the earlier revisions of the code but no
> longer needed, so let's remove the unused pa and of_translate_address().
> Let's also do it for dmtimer_clockevent_init() that has a similar issue.
> 
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
