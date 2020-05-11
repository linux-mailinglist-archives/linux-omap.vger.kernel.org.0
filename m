Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EBE11CD8EA
	for <lists+linux-omap@lfdr.de>; Mon, 11 May 2020 13:52:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729661AbgEKLvz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 11 May 2020 07:51:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729490AbgEKLvz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Mon, 11 May 2020 07:51:55 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22A19C05BD0A
        for <linux-omap@vger.kernel.org>; Mon, 11 May 2020 04:51:55 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id w19so4105336wmc.1
        for <linux-omap@vger.kernel.org>; Mon, 11 May 2020 04:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oiiy7yzaDZrfNFpAYBwGY7qa9RdD+rUsUN7jZCiG/Nk=;
        b=IZ1GX1h8kyIJjla0cM+4zc64f4XSRKtANiqnwZRYC6TXvTREkBTOmgF97cWJX4JMN/
         D/hplVMrCmD687Q5l5bjArc0/bJ6CNx5Rcq/W1h6i0myjroW0TzhSMtwawnkpMDfsTHq
         lqQ294S9l97u/OG5FE2Wiy23OxON2aIG+TE1iUsbgrx1gS1LXORQ2ETyZ5FHCdJBoH9+
         1oUqEX2YHtu+WMiP/UojhLfG28tPH0V7OaTzaqSC6sElvY86pIbB1PbMl0FJ4CzfJ0M4
         13iRj1wn0M7XLyqegXuuzYmIzCfr36AWq3H0s+vdE7dKO/T9b+qT2mX+yhE6fUk6dCLp
         DPrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oiiy7yzaDZrfNFpAYBwGY7qa9RdD+rUsUN7jZCiG/Nk=;
        b=Q3HGWQvNrUsxmRF3rpW3QUk4GCwionIbB5Mq3Hi0UNSBbtTy0yCCL/hnCK6C/3x+PK
         zcgNwuudNZL/b627h2dh7qxhOanMQ73yNpMLu4jD9irmMRGx3jOfzU+r4aMvr76bVNwi
         9Kvgq2M9Mvi9WMtwrNh0mYt6q5zlY/rFWzx4Rpz6W+2JHzv3VqRIPkSYQ/tynVtlj+WS
         kYXkZ9ZlUVMz2bVbSr+7inXIqudWqL3FDYzzXkPscOY1aQ/YNCA+t2EcdIwtsRk/ui0S
         wSyD/SB7NQibWaqspWWmhs1khshTjPCJk4ecX51zHMxGvk8HbmWOOIDQoKng0MhYQy80
         6wew==
X-Gm-Message-State: AGi0PuYm0nVju4OFHB3ISeObFawFPl0/bYEY6aTlbHGrLjbOl1VmIQvA
        wsO+5m9hRE9j1GVWMSakunjZOQ==
X-Google-Smtp-Source: APiQypIvoIlZRhIOKzLOkS565PA6K4LY8QgOBxFSsIjfZbiD6pG33iH6F5Up0icIdMnR0Z6CC5DX/Q==
X-Received: by 2002:a1c:b604:: with SMTP id g4mr7883523wmf.103.1589197913440;
        Mon, 11 May 2020 04:51:53 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
        by smtp.gmail.com with ESMTPSA id f26sm26316916wmj.11.2020.05.11.04.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 04:51:52 -0700 (PDT)
Date:   Mon, 11 May 2020 12:51:49 +0100
From:   Quentin Perret <qperret@google.com>
To:     Lukasz Luba <lukasz.luba@arm.com>
Cc:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-imx@nxp.com, Dietmar.Eggemann@arm.com, cw00.choi@samsung.com,
        b.zolnierkie@samsung.com, rjw@rjwysocki.net, sudeep.holla@arm.com,
        viresh.kumar@linaro.org, nm@ti.com, sboyd@kernel.org,
        rui.zhang@intel.com, amit.kucheria@verdurent.com,
        daniel.lezcano@linaro.org, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        kernel@pengutronix.de, khilman@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, robh@kernel.org,
        matthias.bgg@gmail.com, steven.price@arm.com,
        tomeu.vizoso@collabora.com, alyssa.rosenzweig@collabora.com,
        airlied@linux.ie, daniel@ffwll.ch, liviu.dudau@arm.com,
        lorenzo.pieralisi@arm.com, patrick.bellasi@matbug.net,
        orjan.eide@arm.com, rdunlap@infradead.org, mka@chromium.org
Subject: Re: [PATCH v7 02/15] PM / EM: introduce em_dev_register_perf_domain
 function
Message-ID: <20200511115149.GB11091@google.com>
References: <20200511111912.3001-1-lukasz.luba@arm.com>
 <20200511111912.3001-3-lukasz.luba@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200511111912.3001-3-lukasz.luba@arm.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Monday 11 May 2020 at 12:18:59 (+0100), Lukasz Luba wrote:
> Add now function in the Energy Model framework which is going to support
> new devices. This function will help in transition and make it smoother.
> For now it still checks if the cpumask is a valid pointer, which will be
> removed later when the new structures and infrastructure will be ready.
> 
> Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>

Acked-by: Quentin Perret <qperret@google.com>
