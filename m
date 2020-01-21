Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6D74143982
	for <lists+linux-omap@lfdr.de>; Tue, 21 Jan 2020 10:32:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727360AbgAUJcH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Jan 2020 04:32:07 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53594 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727220AbgAUJcF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 21 Jan 2020 04:32:05 -0500
Received: by mail-wm1-f66.google.com with SMTP id m24so2149658wmc.3
        for <linux-omap@vger.kernel.org>; Tue, 21 Jan 2020 01:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=imtrsyE4PqkfOuBH2bEU5/ycShpe5DgMQpGEtomyMa0=;
        b=rtcJ+LQlDZ/dhGfo9Iu5OJd4+HKMy2yzD9iSGdalzOoIEncUjzsz5/aNNTd5RjsSc8
         zO8R7IWeVumQmIJtNgo4RVZt7gUhd5yZRRBQqVDryoKs8BU04+PpGfSZJNvnjsH/62yj
         utNq7GGLPGyTxTb1yb3mltp6nzJAjgAWU6qQKOTamwB12SgQZpUurDCVdShHDY4zSwRt
         27hnYDJCXhMMgdvO1mW+7T9xCr4uphzvbjrusTEF0ylfATpdKENfYomQu6F+lwzn6RUS
         UpDbh4WVRvpRmqp5fb/B2A+GM9Tidwg6k1/Hgf4wLH/tybPmLM/Hd8ve+be8A6ZldBH9
         pQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=imtrsyE4PqkfOuBH2bEU5/ycShpe5DgMQpGEtomyMa0=;
        b=R99jb34hcYSutVFZHwpNUNppQSEZYwV+FPP/D6NdHXdEXoH7EweTPkJSPCuWtCyD9c
         F8lF1Sh1K39Wu4FJpAWnRlSkiouCORdNM7Bk0CEbIryJQqjdmgUYubytvfaJ3/irCLhl
         hA7hHpr4oa1by1c5+sJSG+ewLwMoYC4zivGSGvMkxtGZ9+2uoS/TFCVJPtzY42eR2Pd4
         /08RFkejwViVac/UXNPLjAnH7yTTdXlq87CefN1m7MLOXNGLGJK1cDcKCRBTJI4D/QkF
         R07o2IJMLe+ZTCYN3Xbp71gRZE3czUAygPkJ+NyQ4Jdxv39wJUvQv6Z/FUq36JZFDwVV
         HbeA==
X-Gm-Message-State: APjAAAWRi31hiRu+EIVipsJOCPFyjnRkmj2D6VeDZb9XUVcr2J3vFDFW
        tr6gwTX3AHN7qUiFO7n3t1SH5w==
X-Google-Smtp-Source: APXvYqxXLTNXCnqXFHWAqOhNn4BqFUdupPBlV6/fm+9Ho9HF0rYCv/gYw3ZqBCY91j9ikIx2kYRjiw==
X-Received: by 2002:a1c:a584:: with SMTP id o126mr3199652wme.163.1579599122625;
        Tue, 21 Jan 2020 01:32:02 -0800 (PST)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
        by smtp.gmail.com with ESMTPSA id g7sm51210925wrq.21.2020.01.21.01.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2020 01:32:01 -0800 (PST)
Date:   Tue, 21 Jan 2020 09:31:58 +0000
From:   Quentin Perret <qperret@google.com>
To:     Lukasz Luba <lukasz.luba@arm.com>
Cc:     Dietmar Eggemann <dietmar.eggemann@arm.com>,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-imx@nxp.com, Morten.Rasmussen@arm.com, Chris.Redpath@arm.com,
        ionela.voinescu@arm.com, javi.merino@arm.com,
        cw00.choi@samsung.com, b.zolnierkie@samsung.com, rjw@rjwysocki.net,
        sudeep.holla@arm.com, viresh.kumar@linaro.org, nm@ti.com,
        sboyd@kernel.org, rui.zhang@intel.com, amit.kucheria@verdurent.com,
        daniel.lezcano@linaro.org, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        kernel@pengutronix.de, khilman@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org,
        matthias.bgg@gmail.com, steven.price@arm.com,
        tomeu.vizoso@collabora.com, alyssa.rosenzweig@collabora.com,
        airlied@linux.ie, daniel@ffwll.ch, kernel-team@android.com
Subject: Re: [PATCH 1/4] PM / EM: and devices to Energy Model
Message-ID: <20200121093158.GA154455@google.com>
References: <20200116152032.11301-1-lukasz.luba@arm.com>
 <20200116152032.11301-2-lukasz.luba@arm.com>
 <20200117105437.GA211774@google.com>
 <40587d98-0e8d-cbac-dbf5-d26501d47a8c@arm.com>
 <20200120150918.GA164543@google.com>
 <8332c4ac-2a7d-1e2d-76e9-7c979a666257@arm.com>
 <b02da0ed-9e0b-36db-9813-daa334cbf2ba@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b02da0ed-9e0b-36db-9813-daa334cbf2ba@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Monday 20 Jan 2020 at 18:38:41 (+0000), Lukasz Luba wrote:
> I think we could avoid this additional argument 'cpumask'. I have
> checked the cpufreq_cpu_get function, which should do be good for this:
> 
> ---------->8-------------------------
> static int _get_sharing_cpus(struct device *cpu_dev, struct cpumask *span)
> {
>         struct cpufreq_policy *policy;
> 
>         policy = cpufreq_cpu_get(cpu_dev->id);
>         if (policy) {
>                 cpumask_copy(span, policy->cpus);

That should be with 'policy->related_cpus', but yes if the policy
cpumasks have been populated this approach is OK I think.

>                 cpufreq_cpu_put(policy);
>                 return 0;
>         } else {
>                 return -EINVAL;
>         }
> }
> --------------------------8<-------------------------------

Thanks,
Quentin
