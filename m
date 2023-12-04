Return-Path: <linux-omap+bounces-106-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 368DB803BDF
	for <lists+linux-omap@lfdr.de>; Mon,  4 Dec 2023 18:42:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF15F1F211DE
	for <lists+linux-omap@lfdr.de>; Mon,  4 Dec 2023 17:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 489662E84F;
	Mon,  4 Dec 2023 17:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DZmIx9fA"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D7ECDF
	for <linux-omap@vger.kernel.org>; Mon,  4 Dec 2023 09:42:22 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40c0f3a7717so4918795e9.1
        for <linux-omap@vger.kernel.org>; Mon, 04 Dec 2023 09:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701711741; x=1702316541; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g+fpeW75cFZBqvUHhUaPqs/+/3ysyB7NjQ95Y7Hzi7I=;
        b=DZmIx9fArHow03bPVgM9F/FtdrIR4PlyWGO7bR8D76/Upg+2ZnwGE7DM56RJ0BlObJ
         lGGESnVuzRVm1mtDZXZfajiP7LdJSO3zunB0Z7KU2vWRnmOGb9j6nHQdLkP0FUaUK5HN
         RhNQj+BB30iACGoLZhTRxWwGY90PmzBk15IgmN7nqQJxr1VUtnaTWX7vL22giJ8fp588
         QhkcjWeBDkkGHTqlu3FfjbIqGRkg/7BnHWd9cT0PpxLGK9OJHsJQe0/X7NeP2hIqApGU
         EUlQV55DUenm26Ms1IGF5BtODGC2lWpbgwMowcq8fH2JnuvE6TS2gsm/tnV4tIF0nQnS
         SVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701711741; x=1702316541;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g+fpeW75cFZBqvUHhUaPqs/+/3ysyB7NjQ95Y7Hzi7I=;
        b=Dc7m/8SgeuT2LKi/cCljccbPE029MatrQaxvbBUQeDugUQk3dRZjQ7ZLmXvdZUvEER
         Z2Vjip+qFZm1fjVhnggRZMpcS8NJ0j1VsepOZusrNNr05ymUkquZOqbKskroL9ZNWLGm
         s5LjvOLZSIeioT7CkZX14PA+w98DWjXZ9OYoNUeoEJERZWSXUdwH6UYW/k1/zEZoIHO8
         tAOs2CcmxJ0CWE3dAnajBQsX9eMbMafKw+/4agfRtWyaD/OaEJv/00DzmAPVfl3yo3gY
         vWxQAqVL/z4l5oEccuHpIh5jIG3hluNVKyYdkp9ELNIoW3zUfU7C6dVFbVud40iEPWXP
         8CCQ==
X-Gm-Message-State: AOJu0Yz+OXr/iFvDDwHYxUbOwtYdrwAvotmQLA/Pj3lS+vbQEi2nS2WM
	UZq99yYngaX6/QJ/leZ2EzWsnA==
X-Google-Smtp-Source: AGHT+IGhQZZ94dA54Rfw2Y5eYQSc3rlXgIaoo1hyGbcQptAOJkiBtiKTsWlLIk295LwmaGZHBcn+2g==
X-Received: by 2002:a05:600c:5249:b0:40b:5f03:b3ce with SMTP id fc9-20020a05600c524900b0040b5f03b3cemr1468213wmb.240.1701711740721;
        Mon, 04 Dec 2023 09:42:20 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:c831:1e47:2:5b96? ([2a05:6e02:1041:c10:c831:1e47:2:5b96])
        by smtp.googlemail.com with ESMTPSA id j11-20020a05600c190b00b0040b47c69d08sm19415061wmq.18.2023.12.04.09.42.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 09:42:20 -0800 (PST)
Message-ID: <8a71b223-defb-4c30-b34d-d024eccbf86c@linaro.org>
Date: Mon, 4 Dec 2023 18:42:19 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clocksource: timer-ti-dm: Fix make W=n kerneldoc warnings
Content-Language: en-US
To: Tony Lindgren <tony@atomide.com>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel test robot <lkp@intel.com>
References: <20231114072930.40615-1-tony@atomide.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20231114072930.40615-1-tony@atomide.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 14/11/2023 08:29, Tony Lindgren wrote:
> Kernel test robot reports of kerneldoc related warnings that happen with
> make W=n for "parameter or member not described".
> 
> These were caused by changes to function parameter names with
> earlier commits where the kerneldoc parts were not updated.
> 
> Fixes: 49cd16bb573e ("clocksource/drivers/timer-ti-dm: Simplify register writes with dmtimer_write()")
> Fixes: a6e543f61531 ("clocksource/drivers/timer-ti-dm: Move struct omap_dm_timer fields to driver")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202311040403.DzIiBuwU-lkp@intel.com/
> Closes: https://lore.kernel.org/oe-kbuild-all/202311040606.XL5OcR9O-lkp@intel.com/
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


