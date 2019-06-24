Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 231F4505ED
	for <lists+linux-omap@lfdr.de>; Mon, 24 Jun 2019 11:39:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728158AbfFXJjk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Jun 2019 05:39:40 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:34898 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727677AbfFXJjk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 24 Jun 2019 05:39:40 -0400
Received: by mail-pl1-f193.google.com with SMTP id p1so6580113plo.2
        for <linux-omap@vger.kernel.org>; Mon, 24 Jun 2019 02:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=0xq4Hf3p8ZFDHvrAu4X/XVuAS4nlGCqTsPVT41F3h+A=;
        b=VCyHBpwOAxYJLGT3NUX1EldqHeUq4P8q3nWC/ggkGk83WZP0Bdz4M70ji4gMknvKuG
         lSXTS4CenwFe2vme1ep79JzwnKdJxMFE9YMXFU1dsSEdjuokcf1MVi5syKRTLeYr5raR
         j95F+KOseTPvwsmEqD1WwduScRG6Zd/zZEYJvCuMxMdFIUACQoPdR9pTO8xyDTGhe2kI
         cLnIvMl/lhW3iVY+8+SL6wlvssIsO14aONeLkxL7WB9fzf3HyEH0qTmE6WNqEvbGy+d5
         aShUU5ZwdHp3f/7NXDZPw07J6OciSPGUsjNgrboTyZdeaMq40mHR41rQiyH/7fWHRG+U
         qGVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0xq4Hf3p8ZFDHvrAu4X/XVuAS4nlGCqTsPVT41F3h+A=;
        b=rhOw5cXifoggmRGbGCfQqoiwqwVvpYGydVgR6r37b0Qot3tKgfFSicCp5hGRlLAoRr
         0idKkxw/pvb4gonQ4LRiNp9N9Opq7QFzopTv5xS49IEIzFowFZe0dsiwDHqJ91TyvhXd
         yHxM59MJpMEcL+57Kd6dSnMxZtribaPz0cGR6J2rEYVyDo2N8ASZ9cKuZ61UWVDnvaQd
         reY61D2WNxJO2XLcWWkxuivyTYJj69YEEWJDfxMAAuar0bDZvyGejUcXVRf3VNPC1NwF
         jwPp7VhLUaS4+oQV2nlv+95GBzD6ZJjswoPsLVTzCCx8xWWVxmGBEXI+5ueE7XCYRDE1
         sWrw==
X-Gm-Message-State: APjAAAUQtOQZxGeRCG70H6c7Xrv3eY9d+TosCqWwPOdJT/TrR7yBkNda
        8kDWsYk0nt3KPSY0N4Mqq1iCvA==
X-Google-Smtp-Source: APXvYqx0+2hKXME82DJG31VBC8K3kY/7y2gRKipDpmCiTehdcrm7FLF0wonH5OMqNa4QeSarJjGr7w==
X-Received: by 2002:a17:902:42a5:: with SMTP id h34mr111526412pld.16.1561369179880;
        Mon, 24 Jun 2019 02:39:39 -0700 (PDT)
Received: from localhost ([122.172.211.128])
        by smtp.gmail.com with ESMTPSA id 12sm10459621pfi.60.2019.06.24.02.39.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Jun 2019 02:39:39 -0700 (PDT)
Date:   Mon, 24 Jun 2019 15:09:37 +0530
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
Message-ID: <20190624093937.hmfzfm2s46hfhvhm@vireshk-i7>
References: <20190621132302.30414-1-daniel.lezcano@linaro.org>
 <20190621132302.30414-2-daniel.lezcano@linaro.org>
 <20190624060334.kak2mjuou4napi4x@vireshk-i7>
 <3f324189-aa1e-ae78-1d69-61e00c5d033a@linaro.org>
 <20190624073747.hf7jd6ulkmebbxtm@vireshk-i7>
 <d31f65c8-53df-ae59-5f6f-211c0ddcff3f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d31f65c8-53df-ae59-5f6f-211c0ddcff3f@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 24-06-19, 09:45, Daniel Lezcano wrote:
> Actually I'm asking your opinion :)
> 
> The structure in drivers/thermal/imx_thermal.c
> 
> struct imx_thermal_data {
>         struct cpufreq_policy *policy; <<<< in the thermal data ?!
> 	[ ... ]
> };
> 
> And then:
> 
> #ifdef CONFIG_CPU_FREQ
> /*
>  * Create cooling device in case no #cooling-cells property is available in
>  * CPU node
>  */
> static int imx_thermal_register_legacy_cooling(struct imx_thermal_data
> *data)
> {
>         struct device_node *np;
>         int ret;
> 
>         data->policy = cpufreq_cpu_get(0);
>         if (!data->policy) {
>                 pr_debug("%s: CPUFreq policy not found\n", __func__);
>                 return -EPROBE_DEFER;
>         }
> 
>         np = of_get_cpu_node(data->policy->cpu, NULL);
> 
>         if (!np || !of_find_property(np, "#cooling-cells", NULL)) {
>                 data->cdev = cpufreq_cooling_register(data->policy);
>                 if (IS_ERR(data->cdev)) {
>                         ret = PTR_ERR(data->cdev);
>                         cpufreq_cpu_put(data->policy);
>                         return ret;
>                 }
>         }
> 
>         return 0;
> }
> 
> [ ... ]
> 
> Shouldn't this be move in the drivers/cpufreq/<whatever driver> ?

Sure, we have platform specific drivers where this can be moved :)

-- 
viresh
