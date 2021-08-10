Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFCF03E5A06
	for <lists+linux-omap@lfdr.de>; Tue, 10 Aug 2021 14:36:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240626AbhHJMgQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Aug 2021 08:36:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240603AbhHJMgK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 10 Aug 2021 08:36:10 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7944EC06179B
        for <linux-omap@vger.kernel.org>; Tue, 10 Aug 2021 05:35:47 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id x12so2575656wrr.11
        for <linux-omap@vger.kernel.org>; Tue, 10 Aug 2021 05:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cXcVfaJa9gxQfqomI6BeLC46V441BROQ5crN/C0u7tQ=;
        b=aFsv3vr+XQ6POKdiOCpyItN/s1A3yD15/zjn5UostldN1x0iL5S1t/7EXoUl4mMz8Q
         8uowNLbyuG2VkEPcjjwnxbK6tW9BeU8zchx6GlPqOffGl7lbLoMYd2ECnz8EIIuFGAW4
         Rjt6Db4jWbDc7edO/2yn9cC82+Y6maFBe7ARMIb6MT9SB32P8lSW/xxLmi6ooVHg1n1R
         fWj5yHcEtOUtG6Zie4y9ktNsQrvGTNFnDBCFkPxHUKFMLVmRIrHiV6Yn7GSXi+ytpjxw
         UFqTo3igkPxFx/S9aTva5s6e+RD887u4ahF5QGcNM7fvB5Dfu3sNWWxy584kPwVotjxq
         cW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cXcVfaJa9gxQfqomI6BeLC46V441BROQ5crN/C0u7tQ=;
        b=r83vt6dEQ50HMFlh/08h56zITBU8wFL5EYF2D8BjVdMcAJTiE0m43XR9sSBjQpITic
         oJmNfhcqAc19rHzFXDbVA8Yy4O07S6c9NJIo/D0KqWJlzavPq9BIzXmrVtEqTOIFutP8
         P+u1yuEMODYpISGszuiJsbN3n1sMXaxTUlS8qhFA0gbGv8u6gmf0yrIaIbKtZPGT0VIm
         Zw2ViG9CO64n6TyOnx3PFdBzexG+k0hJBkztk86nrxpUz7iPBs3wnhD8uexgbHFSeIxo
         hFzG2rYgiseYdsETiiGSTCfamXBCZEKK/IAx08yQJyhWnazY3njSj5DlN8suQSCIscXW
         G5Pw==
X-Gm-Message-State: AOAM533qTryp9dyF5N8kAXMN82O4/D8jmUJNppa5nVUZIhaJTRl6v+5j
        Hei7uliUzCIDot8D9+JO6n1IRg==
X-Google-Smtp-Source: ABdhPJyrxhF8E0q6i871koPqo7IgwEwcQPwaC+jYoSQxm92eBV0IEuOY/clY+5owwOhTp0yntrvIQw==
X-Received: by 2002:adf:e5cf:: with SMTP id a15mr30538552wrn.362.1628598945798;
        Tue, 10 Aug 2021 05:35:45 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:210:e920:cedf:a082:9d02])
        by smtp.gmail.com with ESMTPSA id 104sm23687271wrc.4.2021.08.10.05.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 05:35:45 -0700 (PDT)
Date:   Tue, 10 Aug 2021 13:35:39 +0100
From:   Quentin Perret <qperret@google.com>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Rafael Wysocki <rjw@rjwysocki.net>,
        Vincent Donnefort <vincent.donnefort@arm.com>,
        lukasz.luba@arm.com, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Fabio Estevam <festevam@gmail.com>,
        Kevin Hilman <khilman@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>, linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH 0/8] cpufreq: Auto-register with energy model
Message-ID: <YRJym+Vn4bbwQzzs@google.com>
References: <cover.1628579170.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1628579170.git.viresh.kumar@linaro.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tuesday 10 Aug 2021 at 13:06:47 (+0530), Viresh Kumar wrote:
> Provide a cpufreq driver flag so drivers can ask the cpufreq core to register
> with the EM core on their behalf.

Hmm, that's not quite what this does. This asks the cpufreq core to
use *PM_OPP* to register an EM, which I think is kinda wrong to do from
there IMO. The decision to use PM_OPP or another mechanism to register
an EM belongs to platform specific code (drivers), so it is odd for the
PM_OPP registration to have its own cpufreq flag but not the other ways.

As mentioned in another thread, the very reason to have PM_EM is to not
depend on PM_OPP, so I'm worried about the direction of travel with this
series TBH.

> This allows us to get rid of duplicated code
> in the drivers and fix the unregistration part as well, which none of the
> drivers have done until now.

This series adds more code than it removes, and the unregistration is
not a fix as we don't ever remove the EM tables by design, so not sure
either of these points are valid arguments.

> This would also make the registration with EM core to happen only after policy
> is fully initialized, and the EM core can do other stuff from in there, like
> marking frequencies as inefficient (WIP). Though this patchset is useful without
> that work being done and should be merged nevertheless.
> 
> This doesn't update scmi cpufreq driver for now as it is a special case and need
> to be handled differently. Though we can make it work with this if required.

Note that we'll have more 'special cases' if other architectures start
using PM_EM, which is what we have been trying to allow since the
beginning, so that's worth keeping in mind.

Thanks,
Quentin
