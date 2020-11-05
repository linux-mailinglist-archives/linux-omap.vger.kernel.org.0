Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5144A2A8033
	for <lists+linux-omap@lfdr.de>; Thu,  5 Nov 2020 14:58:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730799AbgKEN6i (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Nov 2020 08:58:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730746AbgKEN6i (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 5 Nov 2020 08:58:38 -0500
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21584C0613CF;
        Thu,  5 Nov 2020 05:58:38 -0800 (PST)
Received: by mail-lj1-x244.google.com with SMTP id l10so1669622lji.4;
        Thu, 05 Nov 2020 05:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ua+XqBPg22ryhZgPJww6Uojlz0C1kaQl2r/pK/v+fys=;
        b=fBI+X77XrljCuJQUBTFf5PQggFuOyq+QXV5hbyuS74jAFpRO59bE2ERGvHoGY0CAvc
         0oRdE4s8eKfW3gH1wJSnyKiZcCxeeuLiqRckWXJB8oVoQENOBl8FtdP86pRrsV0Q6NWc
         ndM5fnXHKSDJk5//k1l5Sd/hKB0zjf6gYR5tv2micFUJ2IBqX9FJmxAp/3RDYopf8K5I
         nMhcC4ESBqtDfmkrnxWbAt3tPmcotxOO6ckZKrfL/BDMJLp6T+1X83Yh/N09R6aCiyq/
         1ah4XNo+K2RYtXJ4fj8mMYm7Xf5AbZF9c+KQUt3stN2qEypLm1QekSfD25Re1ksVC5io
         UdpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ua+XqBPg22ryhZgPJww6Uojlz0C1kaQl2r/pK/v+fys=;
        b=IZgFmGyOOvSPH2VVkisayIEm8zuzBY3K8SlShu0kDw3b7uqpA25FjTDz0lT9zbQkqq
         /GOUFlaLu3MhQy/dSoiHi1TD6BAt8jGecxNUZlf5Xj28Vh5U6xR6fRtGjLreYdwS4h4S
         5+kXmdkX4cGASBfG1r1cEfOVfA3k7wqf3SgDB7/W/TO8c1Wzwmd3HP/OQuZscfTyuvCX
         KO2NDSg2Cw+BiLiQ8+TdshMmpPiDNBOZK4LewKFQlj67eYa2IY7Qxoh92gdka2NrTJuh
         S6y50YrODyIrZlhHY4PQ0EfZJ2zMQdOtnoqwMq8vemEeFftx+jy3Qdl9kz5KEZJQouYv
         shBA==
X-Gm-Message-State: AOAM532UL8l3lya2R9m0XfttgLQG2JIXc9J4L4HeBYf4H4HUgtzsY5eg
        QxXpV/m8WHbm+I2OZJuStSxDNpn3KvE=
X-Google-Smtp-Source: ABdhPJzPPD5FYtvWKbpRa9qB0kCASYkqtaVWxPZuIFeF8V5t1el23qhcHAmjRSJgIVs+Irv03CnhMw==
X-Received: by 2002:a2e:9189:: with SMTP id f9mr874781ljg.295.1604584716456;
        Thu, 05 Nov 2020 05:58:36 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-83.dynamic.spd-mgts.ru. [109.252.192.83])
        by smtp.googlemail.com with ESMTPSA id a15sm190343lfi.165.2020.11.05.05.58.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2020 05:58:35 -0800 (PST)
Subject: Re: [PATCH v3] mfd: tps65910: Correct power-off programming sequence
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Tony Lindgren <tony@atomide.com>, Lee Jones <lee.jones@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Zack Pearsall <zpearsall@yahoo.com>,
        linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20201104134408.19911-1-digetx@gmail.com>
 <20201105013319.GA17266@qmqm.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d0f435c7-6c58-b9af-8b08-934ee63e54cf@gmail.com>
Date:   Thu, 5 Nov 2020 16:58:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201105013319.GA17266@qmqm.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

05.11.2020 04:33, Michał Mirosław пишет:
> On Wed, Nov 04, 2020 at 04:44:08PM +0300, Dmitry Osipenko wrote:
>> This patch fixes system shutdown on a devices that use TPS65910 as a
>> system's power controller. In accordance to the TPS65910 datasheet, the
>> PMIC's state-machine transitions into the OFF state only when DEV_OFF
>> bit of DEVCTRL_REG is set. The ON / SLEEP states also should be cleared,
>> otherwise PMIC won't get into a proper state on shutdown. Devices like
>> Nexus 7 tablet and Ouya game console are now shutting down properly.
> [...]
> 
> You might want to rebase on https://lkml.org/lkml/2020/9/26/397 as it's
> probably going to be accepted shortly. This just means replacing
> register accesses: tps65910_reg_*() -> regmap_*().

I'll update this patch once yours series will hit linux-next, thanks!
