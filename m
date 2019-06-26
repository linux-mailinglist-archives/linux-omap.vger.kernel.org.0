Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A70155F5A
	for <lists+linux-omap@lfdr.de>; Wed, 26 Jun 2019 05:00:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726506AbfFZC77 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 25 Jun 2019 22:59:59 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:46566 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726387AbfFZC76 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 25 Jun 2019 22:59:58 -0400
Received: by mail-pf1-f193.google.com with SMTP id 81so465785pfy.13
        for <linux-omap@vger.kernel.org>; Tue, 25 Jun 2019 19:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XLW3VDfNQt+x4xgu019bZp6QUcWMy6VZjqr8H1WuSuI=;
        b=oun1IwP+E3E04t0XX3kzcUio+QFJqjeXWPRnlbMBHGvTgB/IiYGgyLa1gJxSEAIyH2
         3RZhntJLRouJl1hVn5LVnFFKeCAYoZKi7DoC8caZpm4tf5xIPMluWrd5Es1C8332il3C
         xjGmOL9DHdjYfMaG5+lMoF6qc9Zgyoia5lCw4YU5w3jja2oVSpp6q5CcUHmwrAmvl5my
         CiMbXvW4rX8qNyPGfy7thR4zMJk6BRQqVls7pZ0R3QBbXqD5CrZ7fwpkFiLdtTmiaZZC
         37b1s0g4xPRDz+wxrcdM6FoaT9PEI4lkRSqFN0x0JXGFwQuvoLrDYj2oLdb6d+EsTp/+
         Awvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XLW3VDfNQt+x4xgu019bZp6QUcWMy6VZjqr8H1WuSuI=;
        b=rxdB4OMljMN35RrL2zUWFyGZwajdfHLNXKYABod1koxRbHkIAr/hwRZ5Q2i8Tm2y4z
         FNSOyz4lYd9Sfwp1FxhDtAhFJ10qd5n5x7tcEPoDLiwNo/hgx/SSlLkt/T+k6BrNix4Q
         2OSTuvhilzT6A4AxL8hmxQZI+rehX7dNqKAEeOh8MTRp9VK5NJBd85sluKp//Z4dDeA6
         dAfRgBWovD04EptN5vqSZIgQBT4PqagVCem4iED1s/crFAQPI05JM/5H4cDrnHy8oFAP
         J1IbstTXihhHTGTKq+6ZWQe1oxBdXxDChS/VBQ2bkR9hKa7AMg1fJi3y3pg7cgFjhDtE
         zLOQ==
X-Gm-Message-State: APjAAAVNpfeovTwho/RKWbQG8eKzc7xWtNwEYfS0+JGz2sr/nE6d8WO+
        VLsWLhta3/JOUe7H/OOO3Dzv/g==
X-Google-Smtp-Source: APXvYqz7sDl1G+SanSLvGSdHna89CYWVbXaQu4UOduO+ENOz+KC4InOP11D/tqw7ZNaiziCaIL7nPQ==
X-Received: by 2002:a17:90a:3787:: with SMTP id v7mr1504677pjb.33.1561517997949;
        Tue, 25 Jun 2019 19:59:57 -0700 (PDT)
Received: from localhost ([122.172.211.128])
        by smtp.gmail.com with ESMTPSA id q13sm4019084pgq.90.2019.06.25.19.59.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Jun 2019 19:59:57 -0700 (PDT)
Date:   Wed, 26 Jun 2019 08:29:53 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     rjw@rjwysocki.net, edubezval@gmail.com,
        linux-kernel@vger.kernel.org,
        Amit Daniel Kachhap <amit.kachhap@gmail.com>,
        Javi Merino <javi.merino@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Keerthy <j-keerthy@ti.com>,
        "open list:THERMAL/CPU_COOLING" <linux-pm@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:TI BANDGAP AND THERMAL DRIVER" 
        <linux-omap@vger.kernel.org>
Subject: Re: [PATCH V3 3/3] thermal/drivers/cpu_cooling:
 cpufreq_cooling_register returns an int
Message-ID: <20190626025953.aapgyiein5tggxei@vireshk-i7>
References: <20190625113244.18146-1-daniel.lezcano@linaro.org>
 <20190625113244.18146-3-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190625113244.18146-3-daniel.lezcano@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 25-06-19, 13:32, Daniel Lezcano wrote:
> It looks like after the changes in the patch the only reason for

which patch ? Instead of "patch" you should refer to the latest
changes in code, like "now that cpufreq_cooling_unregister() doesn't
accept cdev as an argument ....."

> returning (struct thermal_cooling_device *) from
> cpufreq_cooling_register() is error checking, but it would be much
> more straightforward to return int for this purpose.
> 
> Moreover, that would prevent the callers of it from doing incorrect
> things with the returned pointers (like using it to unregister the
> cooling device).
> 
> Replace the returned value an integer instead of a pointer to a

                             as ?

> thermal cooling device structure.
> 
> Suggested-by: Rafael J. Wysocki <rafael@kernel.org>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>  drivers/thermal/cpu_cooling.c                 | 63 +++++++++----------
>  drivers/thermal/imx_thermal.c                 |  6 +-
>  .../ti-soc-thermal/ti-thermal-common.c        |  7 +--
>  include/linux/cpu_cooling.h                   | 16 ++---
>  4 files changed, 40 insertions(+), 52 deletions(-)

-- 
viresh
