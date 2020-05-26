Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F83919F6F7
	for <lists+linux-omap@lfdr.de>; Mon,  6 Apr 2020 15:30:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728381AbgDFNaK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 6 Apr 2020 09:30:10 -0400
Received: from foss.arm.com ([217.140.110.172]:45722 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728200AbgDFNaK (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 6 Apr 2020 09:30:10 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 313E231B;
        Mon,  6 Apr 2020 06:30:09 -0700 (PDT)
Received: from [10.37.12.4] (unknown [10.37.12.4])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BC4473F7D8;
        Mon,  6 Apr 2020 06:29:58 -0700 (PDT)
Subject: Re: [PATCH v5 1/5] PM / EM: add devices to Energy Model
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-imx@nxp.com
Cc:     Morten.Rasmussen@arm.com, Dietmar.Eggemann@arm.com,
        javi.merino@arm.com, cw00.choi@samsung.com,
        b.zolnierkie@samsung.com, rjw@rjwysocki.net, sudeep.holla@arm.com,
        viresh.kumar@linaro.org, nm@ti.com, sboyd@kernel.org,
        rui.zhang@intel.com, amit.kucheria@verdurent.com, mingo@redhat.com,
        peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, rostedt@goodmis.org,
        qperret@google.com, bsegall@google.com, mgorman@suse.de,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        kernel@pengutronix.de, khilman@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org,
        matthias.bgg@gmail.com, steven.price@arm.com,
        tomeu.vizoso@collabora.com, alyssa.rosenzweig@collabora.com,
        airlied@linux.ie, daniel@ffwll.ch, liviu.dudau@arm.com,
        lorenzo.pieralisi@arm.com, patrick.bellasi@matbug.net,
        orjan.eide@arm.com, rdunlap@infradead.org, mka@chromium.org
References: <20200318114548.19916-1-lukasz.luba@arm.com>
 <20200318114548.19916-2-lukasz.luba@arm.com>
 <09b680a5-a118-8c6e-0ae1-03ab5f10c573@linaro.org>
From:   Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <cb7f670a-a04f-ba6f-1486-0421f3cce2e9@arm.com>
Date:   Mon, 6 Apr 2020 14:29:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <09b680a5-a118-8c6e-0ae1-03ab5f10c573@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Daniel,

Thank you for the review.

On 4/3/20 5:05 PM, Daniel Lezcano wrote:
> 
> Hi Lukasz,
> 
> 
> On 18/03/2020 12:45, Lukasz Luba wrote:
>> Add support of other devices into the Energy Model framework not only the
>> CPUs. Change the interface to be more unified which can handle other
>> devices as well.
> 
> thanks for taking care of that. Overall I like the changes in this patch
> but it hard to review in details because the patch is too big :/
> 
> Could you split this patch into smaller ones?
> 
> eg. (at your convenience)
> 
>   - One patch renaming s/cap/perf/
> 
>   - One patch adding a new function:
> 
>      em_dev_register_perf_domain(struct device *dev,
> 				unsigned int nr_states,
> 				struct em_data_callback *cb);
> 
>     (+ EXPORT_SYMBOL_GPL)
> 
>      And em_register_perf_domain() using it.
> 
>   - One converting the em_register_perf_domain() user to
> 	em_dev_register_perf_domain
> 
>   - One adding the different new 'em' functions
> 
>   - And finally one removing em_register_perf_domain().

I agree and will do the split. I could also break the dependencies
for future easier merge.

> 
> 
>> Acked-by: Quentin Perret <qperret@google.com>
>> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
>> ---
> 
> [ ... ]
> 
>>   2. Core APIs
>> @@ -70,14 +72,16 @@ CONFIG_ENERGY_MODEL must be enabled to use the EM framework.
>>   Drivers are expected to register performance domains into the EM framework by
>>   calling the following API::
>>   
>> -  int em_register_perf_domain(cpumask_t *span, unsigned int nr_states,
>> -			      struct em_data_callback *cb);
>> +  int em_register_perf_domain(struct device *dev, unsigned int nr_states,
>> +		struct em_data_callback *cb, cpumask_t *cpus);
> 
> Isn't possible to get rid of this cpumask by using
> cpufreq_cpu_get() which returns the cpufreq's policy and from their get
> the related cpus ?

We had similar thoughts with Quentin and I've checked this.
Unfortunately, if the policy is a 'new policy' [1] it gets
allocated and passed into cpufreq driver ->init(policy) [2].
Then that policy is set into per_cpu pointer for each related_cpu [3]:

for_each_cpu(j, policy->related_cpus)
	per_cpu(cpufreq_cpu_data, j) = policy;


Thus, any calls of functions (i.e. cpufreq_cpu_get()) which try to
take this ptr before [3] won't work.

We are trying to register EM from cpufreq_driver->init(policy) and the
per_cpu policy is likely to be not populated at that phase.

Regards,
Lukasz

[1] 
https://elixir.bootlin.com/linux/latest/source/drivers/cpufreq/cpufreq.c#L1328
[2] 
https://elixir.bootlin.com/linux/latest/source/drivers/cpufreq/cpufreq.c#L1350
[3] 
https://elixir.bootlin.com/linux/latest/source/drivers/cpufreq/cpufreq.c#L1374


