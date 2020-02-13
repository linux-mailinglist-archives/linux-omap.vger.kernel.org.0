Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6213915C611
	for <lists+linux-omap@lfdr.de>; Thu, 13 Feb 2020 17:11:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728629AbgBMP4u (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 13 Feb 2020 10:56:50 -0500
Received: from foss.arm.com ([217.140.110.172]:47890 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727973AbgBMPZZ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 13 Feb 2020 10:25:25 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3E55A328;
        Thu, 13 Feb 2020 07:25:24 -0800 (PST)
Received: from [10.37.12.116] (unknown [10.37.12.116])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 130463F68E;
        Thu, 13 Feb 2020 07:25:13 -0800 (PST)
Subject: Re: [PATCH v2 1/4] PM / EM: add devices to Energy Model
To:     Dietmar Eggemann <dietmar.eggemann@arm.com>,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-imx@nxp.com
Cc:     Morten.Rasmussen@arm.com, Chris.Redpath@arm.com,
        ionela.voinescu@arm.com, javi.merino@arm.com,
        cw00.choi@samsung.com, b.zolnierkie@samsung.com, rjw@rjwysocki.net,
        sudeep.holla@arm.com, viresh.kumar@linaro.org, nm@ti.com,
        sboyd@kernel.org, rui.zhang@intel.com, amit.kucheria@verdurent.com,
        daniel.lezcano@linaro.org, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        rostedt@goodmis.org, qperret@google.com, bsegall@google.com,
        mgorman@suse.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, kernel@pengutronix.de, khilman@kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org, robh@kernel.org,
        matthias.bgg@gmail.com, steven.price@arm.com,
        tomeu.vizoso@collabora.com, alyssa.rosenzweig@collabora.com,
        airlied@linux.ie, daniel@ffwll.ch, liviu.dudau@arm.com,
        lorenzo.pieralisi@arm.com, patrick.bellasi@matbug.net
References: <20200206134640.11367-1-lukasz.luba@arm.com>
 <20200206134640.11367-2-lukasz.luba@arm.com>
 <62a54ec9-0491-367d-0a36-7ea32c449acc@arm.com>
From:   Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <6b1921bb-42c8-999f-abfa-5682e73015d5@arm.com>
Date:   Thu, 13 Feb 2020 15:25:11 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <62a54ec9-0491-367d-0a36-7ea32c449acc@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 2/13/20 10:59 AM, Dietmar Eggemann wrote:
> On 06/02/2020 14:46, lukasz.luba@arm.com wrote:
>> From: Lukasz Luba <lukasz.luba@arm.com>
> 
> [..]
> 
>> @@ -26,7 +28,7 @@ framework, and interested clients reading the data from it::
> 
> s/::/: ?
> 
>>          | Thermal (IPA) |  | Scheduler (EAS) |  |     Other     |
>>          +---------------+  +-----------------+  +---------------+
>>                  |                   | em_pd_energy()    |
>> -               |                   | em_cpu_get()      |
>> +               |  em_get_pd()      | em_cpu_get()      |
>>                  +---------+         |         +---------+
> 
> em_get_pd() and em_cpu_get()? Why not em_pd_get()? em_cpu_get() is a
> specific em_get_pd(). right?

Yes. I will rename 'em_get_pd' to 'em_pd_get'

> 
> [...]
> 
>> @@ -85,13 +89,20 @@ API.
>>   2.3 Accessing performance domains
>>   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>   
>> +There is two API functions which provide the access to the energy model:
>> +em_cpu_get() which takes CPU id as an argument and em_get_pd() with device
>> +pointer as an argument. It depends on the subsystem which interface it is
>> +going to use, but in case of CPU devices both functions return the same
>> +performance domain.
> 
> There is probably a reason why we need this specific function for CPU
> devices? The reason should be described. People might ask why
> em_get_pd() is not sufficient.

True, good point. I will extend the comment in em_cpu_get().

> 
> [...]
> 
>> - * A "performance domain" represents a group of CPUs whose performance is
>> - * scaled together. All CPUs of a performance domain must have the same
>> - * micro-architecture. Performance domains often have a 1-to-1 mapping with
>> - * CPUFreq policies.
>> + * In case of CPU device, a "performance domain" represents a group of CPUs
>> + * whose performance is scaled together. All CPUs of a performance domain
>> + * must have the same micro-architecture. Performance domains often have
>> + * a 1-to-1 mapping with CPUFreq policies.
>> + * In case of other devices the 'priv' field is unused.
>>    */
>>   struct em_perf_domain {
>> -	struct em_cap_state *table;
>> -	int nr_cap_states;
>> -	unsigned long cpus[0];
>> +	struct em_perf_state *table;
>> +	int nr_perf_states;
>> +	void *priv;
> 
> In case you go back to the variable length field plus type field to
> distingush EM devices, keep cpus[0] as the name.

OK, I will.

> 
> [..]
> 
>>   /**
>> - * em_pd_energy() - Estimates the energy consumed by the CPUs of a perf. domain
>> + * em_pd_energy() - Estimates the energy consumed by the CPUs of a perf.
>> +			domain
> 
> Why this change?

hmmm, that's odd, maybe there was 'device' then I changed it back to
'CPUs' but forgot to move the 'domain' to the old place.

> 
> [...]
> 
>> @@ -141,12 +210,12 @@ static struct em_perf_domain *em_create_pd(cpumask_t *span, int nr_states,
>>   		 */
>>   		opp_eff = freq / power;
>>   		if (opp_eff >= prev_opp_eff)
>> -			pr_warn("pd%d: hertz/watts ratio non-monotonically decreasing: em_cap_state %d >= em_cap_state%d\n",
>> -					cpu, i, i - 1);
>> +			dev_warn(dev, "energy_model: hertz/watts ratio non-monotonically decreasing: em_perf_state %d >= em_perf_state%d\n",
> 
> s/energy_model/EM ?

OK, I will rename them in all places.

Thank you for the review.

Regards,
Lukasz
