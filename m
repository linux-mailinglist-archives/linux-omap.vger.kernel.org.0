Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 363492BC3E4
	for <lists+linux-omap@lfdr.de>; Sun, 22 Nov 2020 06:33:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727267AbgKVFdY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 22 Nov 2020 00:33:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726564AbgKVFdV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 22 Nov 2020 00:33:21 -0500
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com [IPv6:2607:f8b0:4864:20::c44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD0CCC0613CF
        for <linux-omap@vger.kernel.org>; Sat, 21 Nov 2020 21:33:20 -0800 (PST)
Received: by mail-oo1-xc44.google.com with SMTP id z13so3213221ooa.5
        for <linux-omap@vger.kernel.org>; Sat, 21 Nov 2020 21:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rBk7AaJksPs4+dZwHUgGRS8rDbwOaPmlXDjOAF+UfIc=;
        b=hhAU5sN9lBkAewI2RLDDcIq0a5Vwrk8UjyMK72+Gd9D7VlAYG4V2MfOnam9ie3WDnG
         danw4b86caKXhZqCWe0Sz2eexJ7J1xP4UFKI2AUVoCB2HjtM6H0cvGfoZ1NYAXNL2cd8
         0xRhO1bCv2sjrQrh88yr9CHKCvqN1vixVBLkmUDhXerTfrEN6sOSsdXQqIVLxngVv5A0
         CfZFcd30U5i3gMngf5TESYHHtN7W6cJC+5KZmw958Da8bqQac8rwVRkwvK+fn8LswP+r
         LLdD4D1tg37JXgb5GaWkGDjQbCTuE1avXsDFzeLK2MtG7R6qjguVb9tHdf5Ie95rmgmr
         LDbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rBk7AaJksPs4+dZwHUgGRS8rDbwOaPmlXDjOAF+UfIc=;
        b=Ubt4BX6YtMN2w3XOgk+4aoOH88RCt3QSD5kbEMJdQZzqhxqODWE3ZsxbyMAB8z7LJU
         hSGol60obqnbadJFDOyDk+7u7PO/A7kEnEwPobVUBlzrcL4+GlBC7KtcksnaQV/h92JY
         DAf4TGeZQVD9jqpSq4PLj5PI/KHDyBFJKHTObHTiTMt47ytk5xioISmk9UmuUvhzUmyW
         vBDweRbrHdo7vbddjSj/zwEW1Q3nK1sdsezpjzeOYZYyzBpb0Dn2CjhArXa99Ws5Bbba
         F/3KpG6vn25cQtpyWZWxxLyXT0fchkDUl0f1K+1ntuhefrWtDKTSH1Tc9kpvyJNGRRWj
         y3lA==
X-Gm-Message-State: AOAM533fYyY5DjeIO0GVlKlwJTMmQ+t8s3hbe7SGDoV3yTNI7jrsdo/E
        k6Bb+fiHZH2X10/Y5t3/wBDch67a2QnPtA==
X-Google-Smtp-Source: ABdhPJxCG8bB6h3+L0WVbfQf1BLdyrSuovVTPEDjqE7NDspokJ/aQGbqIPtOsNvHLhq4DXw7W1xHPw==
X-Received: by 2002:a4a:9e02:: with SMTP id t2mr4957781ook.42.1606023200289;
        Sat, 21 Nov 2020 21:33:20 -0800 (PST)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id e15sm4342227otj.43.2020.11.21.21.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2020 21:33:19 -0800 (PST)
Date:   Sat, 21 Nov 2020 23:33:17 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Arnaud Pouliquen <arnaud.pouliquen@st.com>,
        Loic Pallardy <loic.pallardy@st.com>,
        Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        linux-remoteproc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] remoteproc: Introduce deny_sysfs_ops flag
Message-ID: <20201122053317.GJ807@yoga>
References: <20201121030156.22857-1-s-anna@ti.com>
 <20201121030156.22857-3-s-anna@ti.com>
 <20201121033810.GG9177@builder.lan>
 <e416b071-5cae-797e-5d15-7e947c99aa55@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e416b071-5cae-797e-5d15-7e947c99aa55@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri 20 Nov 21:44 CST 2020, Suman Anna wrote:

> On 11/20/20 9:38 PM, Bjorn Andersson wrote:
> > On Fri 20 Nov 21:01 CST 2020, Suman Anna wrote:
> > 
> >> The remoteproc framework provides sysfs interfaces for changing
> >> the firmware name and for starting/stopping a remote processor
> >> through the sysfs files 'state' and 'firmware'. The 'recovery'
> >> sysfs file can also be used similarly to control the error recovery
> >> state machine of a remoteproc. These interfaces are currently
> >> allowed irrespective of how the remoteprocs were booted (like
> >> remoteproc self auto-boot, remoteproc client-driven boot etc).
> >> These interfaces can adversely affect a remoteproc and its clients
> >> especially when a remoteproc is being controlled by a remoteproc
> >> client driver(s). Also, not all remoteproc drivers may want to
> >> support the sysfs interfaces by default.
> >>
> >> Add support to deny the sysfs state/firmware/recovery change by
> >> introducing a state flag 'deny_sysfs_ops' that the individual
> >> remoteproc drivers can set based on their usage needs. The default
> >> behavior is to allow the sysfs operations as before.
> >>
> > 
> > This makes sense, but can't we implement attribute_group->is_visible to
> > simply hide these entries from userspace instead of leaving them
> > "broken"?
> 
> I would have to look into that, but can that be changed dynamically?
> Also, note that the enforcement is only on the writes/stores which impact
> the state-machine, but not the reads/shows.
> 
> For PRU usecases, we will be setting this dynamically.
> 

It looks to be dynamic, but I don't know if there's any "caching"
involved. Please have a look and let me know.

Regards,
Bjorn

> regards
> Suman
> 
> > 
> > Regards,
> > Bjorn
> > 
> >> Signed-off-by: Suman Anna <s-anna@ti.com>
> >> ---
> >> v2: revised to account for the 'recovery' sysfs file as well, patch
> >>     description updated accordingly
> >> v1: https://patchwork.kernel.org/project/linux-remoteproc/patch/20180915003725.17549-5-s-anna@ti.com/
> >>
> >>  drivers/remoteproc/remoteproc_sysfs.c | 12 ++++++++++++
> >>  include/linux/remoteproc.h            |  2 ++
> >>  2 files changed, 14 insertions(+)
> >>
> >> diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
> >> index bd2950a246c9..3fd18a71c188 100644
> >> --- a/drivers/remoteproc/remoteproc_sysfs.c
> >> +++ b/drivers/remoteproc/remoteproc_sysfs.c
> >> @@ -49,6 +49,10 @@ static ssize_t recovery_store(struct device *dev,
> >>  {
> >>  	struct rproc *rproc = to_rproc(dev);
> >>  
> >> +	/* restrict sysfs operations if not allowed by remoteproc drivers */
> >> +	if (rproc->deny_sysfs_ops)
> >> +		return -EPERM;
> >> +
> >>  	if (sysfs_streq(buf, "enabled")) {
> >>  		/* change the flag and begin the recovery process if needed */
> >>  		rproc->recovery_disabled = false;
> >> @@ -158,6 +162,10 @@ static ssize_t firmware_store(struct device *dev,
> >>  	char *p;
> >>  	int err, len = count;
> >>  
> >> +	/* restrict sysfs operations if not allowed by remoteproc drivers */
> >> +	if (rproc->deny_sysfs_ops)
> >> +		return -EPERM;
> >> +
> >>  	err = mutex_lock_interruptible(&rproc->lock);
> >>  	if (err) {
> >>  		dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, err);
> >> @@ -225,6 +233,10 @@ static ssize_t state_store(struct device *dev,
> >>  	struct rproc *rproc = to_rproc(dev);
> >>  	int ret = 0;
> >>  
> >> +	/* restrict sysfs operations if not allowed by remoteproc drivers */
> >> +	if (rproc->deny_sysfs_ops)
> >> +		return -EPERM;
> >> +
> >>  	if (sysfs_streq(buf, "start")) {
> >>  		if (rproc->state == RPROC_RUNNING)
> >>  			return -EBUSY;
> >> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> >> index 3fa3ba6498e8..dbc3767f7d0e 100644
> >> --- a/include/linux/remoteproc.h
> >> +++ b/include/linux/remoteproc.h
> >> @@ -508,6 +508,7 @@ struct rproc_dump_segment {
> >>   * @has_iommu: flag to indicate if remote processor is behind an MMU
> >>   * @auto_boot: flag to indicate if remote processor should be auto-started
> >>   * @autonomous: true if an external entity has booted the remote processor
> >> + * @deny_sysfs_ops: flag to not permit sysfs operations on state, firmware and recovery
> >>   * @dump_segments: list of segments in the firmware
> >>   * @nb_vdev: number of vdev currently handled by rproc
> >>   * @char_dev: character device of the rproc
> >> @@ -545,6 +546,7 @@ struct rproc {
> >>  	bool has_iommu;
> >>  	bool auto_boot;
> >>  	bool autonomous;
> >> +	bool deny_sysfs_ops;
> >>  	struct list_head dump_segments;
> >>  	int nb_vdev;
> >>  	u8 elf_class;
> >> -- 
> >> 2.28.0
> >>
> 
