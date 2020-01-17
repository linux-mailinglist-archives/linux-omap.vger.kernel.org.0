Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 510F814086F
	for <lists+linux-omap@lfdr.de>; Fri, 17 Jan 2020 11:54:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726479AbgAQKyp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 17 Jan 2020 05:54:45 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:40706 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726855AbgAQKyo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 17 Jan 2020 05:54:44 -0500
Received: by mail-wr1-f68.google.com with SMTP id c14so22230497wrn.7
        for <linux-omap@vger.kernel.org>; Fri, 17 Jan 2020 02:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZIor9gKMoZIiatH4TckXR6kw5rMM1XpWfkSuSCSgKXE=;
        b=OWTd1xPAQY9tXJXOZoWIjFDzF/j5k4C12aIyvlJSkkdhXlVbD45jelTm6GVI3uVYL7
         n9xkBrIBsIRyofHDfGxI/l2E5DARRbN+kNYjfXDlt0D2NMz3tS9otMH27qG8unAMXkVK
         vbv+o0soDwEv+wngnnE6P2hSuYjaWEszgXFVB2E8sY/8BNNmwio0HXgTBeM5ojO90Xqz
         eXsC84eVsPLNozUlGBGgx1RDyImJeajA48zW6/mFqj9bm+S8xvtQCF24bQIklM7kmSQd
         UX9n+G82Jt0cw5vAEM+XOAz116BMbTc1FuSDri3NMDqzY9VqQE8QDk2hGTzsWxJxyW1O
         /sRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZIor9gKMoZIiatH4TckXR6kw5rMM1XpWfkSuSCSgKXE=;
        b=FMd3OqpQNR/voY7MJ0I3QwdQEMJmNUCDV2tuxxsyiTPYWZXdUD5vClQxwfnpi4nRIV
         yrlStJcgFDxJD0LBH8AMyFK1tx768ozKJ77N7Z3SGe7aHDc7xloHaZP50Nqq6pA2Fw9E
         JcNFcU9taFfXtEOgQ43LxuUNof2VVSQp5Z932FKHJZpb6stN7cKdkdt1iQjkwIcWwjl9
         OT/s6Vuv/VN6ISkyGo+sT3+mSnaDXsVs385Yx+RaTFRuj0YeluEpA000tXMhma+FVoM9
         ejvuDtpJuwqdx0gp5ROfVKhN0x25Z0PFh6HNiCa7YhfA5Fivqd7ZqZeotgjTEjaSEK6m
         O0Cw==
X-Gm-Message-State: APjAAAXlYHJnrwh9LGC17mz8jET+lEKiv1lnU/odTr9XwPBe6y69wT5V
        5g07y+zmKPcGNrDgIaghQsRvbpfWEMh5dFe3
X-Google-Smtp-Source: APXvYqxFsuT0KTxqOuP7M5Z4+OnjHn0WdKusB9YxUQXSRSUEjOMXSk8sV+Vlqk3Ea2XuYbdpzPevfg==
X-Received: by 2002:a05:6000:1288:: with SMTP id f8mr2534273wrx.66.1579258481679;
        Fri, 17 Jan 2020 02:54:41 -0800 (PST)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
        by smtp.gmail.com with ESMTPSA id b17sm33252857wrp.49.2020.01.17.02.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2020 02:54:40 -0800 (PST)
Date:   Fri, 17 Jan 2020 10:54:37 +0000
From:   Quentin Perret <qperret@google.com>
To:     lukasz.luba@arm.com
Cc:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-imx@nxp.com, Morten.Rasmussen@arm.com,
        Dietmar.Eggemann@arm.com, Chris.Redpath@arm.com,
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
Message-ID: <20200117105437.GA211774@google.com>
References: <20200116152032.11301-1-lukasz.luba@arm.com>
 <20200116152032.11301-2-lukasz.luba@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200116152032.11301-2-lukasz.luba@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hey Lukasz,

Still reading through this, but with small changes, this looks pretty
good to me.

On Thursday 16 Jan 2020 at 15:20:29 (+0000), lukasz.luba@arm.com wrote:
> +int em_register_perf_domain(struct device *dev, unsigned int nr_states,
> +			struct em_data_callback *cb)
>  {
>  	unsigned long cap, prev_cap = 0;
>  	struct em_perf_domain *pd;
> -	int cpu, ret = 0;
> +	struct em_device *em_dev;
> +	cpumask_t *span = NULL;
> +	int cpu, ret;
>  
> -	if (!span || !nr_states || !cb)
> +	if (!dev || !nr_states || !cb || !cb->active_power)

Nit: you check !cb->active_power in em_create_pd() too I think, so only
one of the two is needed.

>  		return -EINVAL;
>  
> -	/*
> -	 * Use a mutex to serialize the registration of performance domains and
> -	 * let the driver-defined callback functions sleep.
> -	 */
>  	mutex_lock(&em_pd_mutex);
>  
> -	for_each_cpu(cpu, span) {
> -		/* Make sure we don't register again an existing domain. */
> -		if (READ_ONCE(per_cpu(em_data, cpu))) {
> +	if (_is_cpu_device(dev)) {
> +		span = kzalloc(cpumask_size(), GFP_KERNEL);
> +		if (!span) {
> +			mutex_unlock(&em_pd_mutex);
> +			return -ENOMEM;
> +		}
> +
> +		ret = dev_pm_opp_get_sharing_cpus(dev, span);
> +		if (ret)
> +			goto free_cpumask;

That I think should be changed. This creates some dependency on PM_OPP
for the EM framework. And in fact, the reason we came up with PM_EM was
precisely to not depend on PM_OPP which was deemed too Arm-specific.

Suggested alternative: have two registration functions like so:

	int em_register_dev_pd(struct device *dev, unsigned int nr_states,
			       struct em_data_callback *cb);
	int em_register_cpu_pd(cpumask_t *span, unsigned int nr_states,
			       struct em_data_callback *cb);

where em_register_cpu_pd() does the CPU-specific work and then calls
em_register_dev_pd() (instead of having that big if (_is_cpu_device(dev))
as you currently have). Would that work ?

Another possibility would be to query CPUFreq instead of PM_OPP to get
the mask, but I'd need to look again at the driver registration path in
CPUFreq to see if the policy masks have been populated when we enter
PM_EM ... I am not sure if this is the case, but it's worth having a
look too.

Thanks,
Quentin
