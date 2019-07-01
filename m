Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0CC1503B3
	for <lists+linux-omap@lfdr.de>; Mon, 24 Jun 2019 09:38:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727868AbfFXHh5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Jun 2019 03:37:57 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:44993 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727022AbfFXHhu (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 24 Jun 2019 03:37:50 -0400
Received: by mail-pg1-f194.google.com with SMTP id n2so6625554pgp.11
        for <linux-omap@vger.kernel.org>; Mon, 24 Jun 2019 00:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OeWUAdnx0L1hjDpfMtx2IyzWmQaeGBQ1LmUUqXpZp+s=;
        b=PHqSc71VmMVb7KzIIyYV1T/rvk/8ZXT5M79sW38Oa+4BxNZzqQK7Oi0R77jVv26b76
         63BIhZgKTVFXcVezHgdv6UwSjVmbWNkZ1FfAnm35FwEGQQbdMT3wktAWIZ+PC1V/VVm8
         9f3fzUcUScUB8epezz9gDsL0uZarFESR+Ok8KG1nPjNNez82ZecAytvGDqUFH5wbvqsl
         gayGuluLt0jT6JxztAX2UtwGMpwDn1gB4m0ZXnySZ8BRnQCsWW7fKB3ljQ8A/nS3cSjg
         pAKz2Zqwvcp3OqCjOA8s6yP90bcE2RdDO5r91AW5GtVnWUP4FRuQIXomlIcHhIB6UlLx
         FKmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OeWUAdnx0L1hjDpfMtx2IyzWmQaeGBQ1LmUUqXpZp+s=;
        b=oXhTZujTlq1IqoJenHKSKiYcycHwyofYjKhzYElqWpHCRXbNxSjG5XHNGGGSlWEPZp
         auiaAskrVRWJsDVQa3+e0XwUibbOwvaeA1jZUIyYyjvIlrxtbmba+D/R5oGw1Q3PlDxZ
         HjOjAzt6uhnpUqLg/wZqY1HowJZgyUj1F+3+kGwQZj2y59vqZrZRrJbVg4z8jA2mNV8s
         gc3ZPE7oVg3Sh0xuFro6pnjqLKeSbcgQ2dc9Sxezvzvl8BsrfJ+fKCu6g50TSzreRfOl
         XQfJ4E8YJXZqa6K4azx/p90Nxodor5QknslEb9ClF8hMos8ZUpOhO0Dk2OE+zqELCl5w
         V7hA==
X-Gm-Message-State: APjAAAU4DH94mRFr3aln72pOg2t2R/CnrkCZZXYdv4G59pKMFcM3MWf1
        kmjpNTakrMAxjujzHaiO+NjTRg==
X-Google-Smtp-Source: APXvYqzw6cAd7oVJ4Rd/hA/i0R7A5vczq5bhj7cIdGgVJjVtof9rhhMbhMIYeGn+Iziy3CzvAYc/pQ==
X-Received: by 2002:a17:90a:f488:: with SMTP id bx8mr22856976pjb.91.1561361869345;
        Mon, 24 Jun 2019 00:37:49 -0700 (PDT)
Received: from localhost ([122.172.211.128])
        by smtp.gmail.com with ESMTPSA id f14sm11537304pfn.53.2019.06.24.00.37.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Jun 2019 00:37:48 -0700 (PDT)
Date:   Mon, 24 Jun 2019 13:07:47 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     edubezval@gmail.com, linux-kernel@vger.kernel.org,
        Sudeep Holla <sudeep.holla@arm.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Amit Daniel Kachhap <amit.kachhap@gmail.com>,
        Javi Merino <javi.merino@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Keerthy <j-keerthy@ti.com>,
        "open list:CPU FREQUENCY DRIVERS - ARM BIG LITTLE" 
        <linux-pm@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:TI BANDGAP AND THERMAL DRIVER" 
        <linux-omap@vger.kernel.org>
Subject: Re: [PATCH 2/6] thermal/drivers/cpu_cooling: Unregister with the
 policy
Message-ID: <20190624073747.hf7jd6ulkmebbxtm@vireshk-i7>
References: <20190621132302.30414-1-daniel.lezcano@linaro.org>
 <20190621132302.30414-2-daniel.lezcano@linaro.org>
 <20190624060334.kak2mjuou4napi4x@vireshk-i7>
 <3f324189-aa1e-ae78-1d69-61e00c5d033a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f324189-aa1e-ae78-1d69-61e00c5d033a@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 24-06-19, 09:30, Daniel Lezcano wrote:
> On 24/06/2019 08:03, Viresh Kumar wrote:
> > On 21-06-19, 15:22, Daniel Lezcano wrote:
> >> Currently the function cpufreq_cooling_register() returns a cooling
> >> device pointer which is used back as a pointer to call the function
> >> cpufreq_cooling_unregister(). Even if it is correct, it would make
> >> sense to not leak the structure inside a cpufreq driver and keep the
> >> code thermal code self-encapsulate. Moreover, that forces to add an
> >> extra variable in each driver using this function.
> >>
> >> Instead of passing the cooling device to unregister, pass the policy.
> >>
> >> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> >> ---
> >>  drivers/cpufreq/arm_big_little.c               |  2 +-
> >>  drivers/cpufreq/cpufreq.c                      |  2 +-
> >>  drivers/thermal/cpu_cooling.c                  | 18 ++++++++++--------
> >>  drivers/thermal/imx_thermal.c                  |  4 ++--
> >>  .../thermal/ti-soc-thermal/ti-thermal-common.c |  2 +-
> >>  include/linux/cpu_cooling.h                    |  6 +++---
> >>  6 files changed, 18 insertions(+), 16 deletions(-)
> > 
> > Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> 
> Just a side note, does it make sense to have the function called from
> imx_thermal.c and ti-thermal-common.c? Sounds like also a leakage from
> cpufreq to thermal drivers, no?

I am not sure what you are proposing here :)

-- 
viresh
