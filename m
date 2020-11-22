Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53E3B2BC792
	for <lists+linux-omap@lfdr.de>; Sun, 22 Nov 2020 18:50:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727972AbgKVRsw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 22 Nov 2020 12:48:52 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:43092 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727567AbgKVRsw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 22 Nov 2020 12:48:52 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AMHmiD4073306;
        Sun, 22 Nov 2020 11:48:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1606067324;
        bh=egm0vCVcqJrsWJaT4E6pP8bZGHQ8X8UOvlmsF/oNS10=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=uBGArDuzJMG4hrWeaTtmXS35Ui2AA6mk50W2afDjPL21aFoAko57gcoOE6UUYaMWW
         AnSGQ3GbQDeb6TxeEQ/BiiR0Mz2lfGjvZYww4qKAxIOu4FnE+mIhmfjI7mm+LeqkGl
         IUlgoiCT+gKhwHl53fWJbkgKYQQJ88QaYqPGmyME=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AMHmilg037864
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sun, 22 Nov 2020 11:48:44 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sun, 22
 Nov 2020 11:48:44 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Sun, 22 Nov 2020 11:48:44 -0600
Received: from [10.250.68.46] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AMHmh9w018260;
        Sun, 22 Nov 2020 11:48:44 -0600
Subject: Re: [PATCH v2 2/3] remoteproc: Introduce deny_sysfs_ops flag
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Arnaud Pouliquen <arnaud.pouliquen@st.com>,
        Loic Pallardy <loic.pallardy@st.com>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20201121030156.22857-1-s-anna@ti.com>
 <20201121030156.22857-3-s-anna@ti.com> <20201121033810.GG9177@builder.lan>
 <e416b071-5cae-797e-5d15-7e947c99aa55@ti.com> <20201122053317.GJ807@yoga>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <1930fba4-70bd-f602-6dbd-f1cc8071da10@ti.com>
Date:   Sun, 22 Nov 2020 11:48:43 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201122053317.GJ807@yoga>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 11/21/20 11:33 PM, Bjorn Andersson wrote:
> On Fri 20 Nov 21:44 CST 2020, Suman Anna wrote:
> 
>> On 11/20/20 9:38 PM, Bjorn Andersson wrote:
>>> On Fri 20 Nov 21:01 CST 2020, Suman Anna wrote:
>>>
>>>> The remoteproc framework provides sysfs interfaces for changing
>>>> the firmware name and for starting/stopping a remote processor
>>>> through the sysfs files 'state' and 'firmware'. The 'recovery'
>>>> sysfs file can also be used similarly to control the error recovery
>>>> state machine of a remoteproc. These interfaces are currently
>>>> allowed irrespective of how the remoteprocs were booted (like
>>>> remoteproc self auto-boot, remoteproc client-driven boot etc).
>>>> These interfaces can adversely affect a remoteproc and its clients
>>>> especially when a remoteproc is being controlled by a remoteproc
>>>> client driver(s). Also, not all remoteproc drivers may want to
>>>> support the sysfs interfaces by default.
>>>>
>>>> Add support to deny the sysfs state/firmware/recovery change by
>>>> introducing a state flag 'deny_sysfs_ops' that the individual
>>>> remoteproc drivers can set based on their usage needs. The default
>>>> behavior is to allow the sysfs operations as before.
>>>>
>>>
>>> This makes sense, but can't we implement attribute_group->is_visible to
>>> simply hide these entries from userspace instead of leaving them
>>> "broken"?
>>
>> I would have to look into that, but can that be changed dynamically?
>> Also, note that the enforcement is only on the writes/stores which impact
>> the state-machine, but not the reads/shows.
>>
>> For PRU usecases, we will be setting this dynamically.
>>
> 
> It looks to be dynamic, but I don't know if there's any "caching"
> involved. Please have a look and let me know.

OK, will do. I can only check the week after though.

regards
Suman

> 
> Regards,
> Bjorn
> 
>> regards
>> Suman
>>
>>>
>>> Regards,
>>> Bjorn
>>>
>>>> Signed-off-by: Suman Anna <s-anna@ti.com>
>>>> ---
>>>> v2: revised to account for the 'recovery' sysfs file as well, patch
>>>>     description updated accordingly
>>>> v1: https://patchwork.kernel.org/project/linux-remoteproc/patch/20180915003725.17549-5-s-anna@ti.com/
>>>>
>>>>  drivers/remoteproc/remoteproc_sysfs.c | 12 ++++++++++++
>>>>  include/linux/remoteproc.h            |  2 ++
>>>>  2 files changed, 14 insertions(+)
>>>>
>>>> diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
>>>> index bd2950a246c9..3fd18a71c188 100644
>>>> --- a/drivers/remoteproc/remoteproc_sysfs.c
>>>> +++ b/drivers/remoteproc/remoteproc_sysfs.c
>>>> @@ -49,6 +49,10 @@ static ssize_t recovery_store(struct device *dev,
>>>>  {
>>>>  	struct rproc *rproc = to_rproc(dev);
>>>>  
>>>> +	/* restrict sysfs operations if not allowed by remoteproc drivers */
>>>> +	if (rproc->deny_sysfs_ops)
>>>> +		return -EPERM;
>>>> +
>>>>  	if (sysfs_streq(buf, "enabled")) {
>>>>  		/* change the flag and begin the recovery process if needed */
>>>>  		rproc->recovery_disabled = false;
>>>> @@ -158,6 +162,10 @@ static ssize_t firmware_store(struct device *dev,
>>>>  	char *p;
>>>>  	int err, len = count;
>>>>  
>>>> +	/* restrict sysfs operations if not allowed by remoteproc drivers */
>>>> +	if (rproc->deny_sysfs_ops)
>>>> +		return -EPERM;
>>>> +
>>>>  	err = mutex_lock_interruptible(&rproc->lock);
>>>>  	if (err) {
>>>>  		dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, err);
>>>> @@ -225,6 +233,10 @@ static ssize_t state_store(struct device *dev,
>>>>  	struct rproc *rproc = to_rproc(dev);
>>>>  	int ret = 0;
>>>>  
>>>> +	/* restrict sysfs operations if not allowed by remoteproc drivers */
>>>> +	if (rproc->deny_sysfs_ops)
>>>> +		return -EPERM;
>>>> +
>>>>  	if (sysfs_streq(buf, "start")) {
>>>>  		if (rproc->state == RPROC_RUNNING)
>>>>  			return -EBUSY;
>>>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
>>>> index 3fa3ba6498e8..dbc3767f7d0e 100644
>>>> --- a/include/linux/remoteproc.h
>>>> +++ b/include/linux/remoteproc.h
>>>> @@ -508,6 +508,7 @@ struct rproc_dump_segment {
>>>>   * @has_iommu: flag to indicate if remote processor is behind an MMU
>>>>   * @auto_boot: flag to indicate if remote processor should be auto-started
>>>>   * @autonomous: true if an external entity has booted the remote processor
>>>> + * @deny_sysfs_ops: flag to not permit sysfs operations on state, firmware and recovery
>>>>   * @dump_segments: list of segments in the firmware
>>>>   * @nb_vdev: number of vdev currently handled by rproc
>>>>   * @char_dev: character device of the rproc
>>>> @@ -545,6 +546,7 @@ struct rproc {
>>>>  	bool has_iommu;
>>>>  	bool auto_boot;
>>>>  	bool autonomous;
>>>> +	bool deny_sysfs_ops;
>>>>  	struct list_head dump_segments;
>>>>  	int nb_vdev;
>>>>  	u8 elf_class;
>>>> -- 
>>>> 2.28.0
>>>>
>>

