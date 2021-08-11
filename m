Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EF223E8D45
	for <lists+linux-omap@lfdr.de>; Wed, 11 Aug 2021 11:34:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236553AbhHKJem (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Aug 2021 05:34:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236321AbhHKJel (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 11 Aug 2021 05:34:41 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E693AC061798
        for <linux-omap@vger.kernel.org>; Wed, 11 Aug 2021 02:34:17 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 203-20020a1c00d40000b02902e6a4e244e4so1483034wma.4
        for <linux-omap@vger.kernel.org>; Wed, 11 Aug 2021 02:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vnsVN4bcM0E0y8yL+4jX4NPKN0s5XVfHXg6t0sA+kKU=;
        b=u8FXx8PbqKg72yRV7K6aX2nwg+RaUIMIKfNSyZDi54QHZNgrnmHHhpQ3uW6MNefq+t
         X/92op1mryh95Wm/AH8EEK6FZ9dY6WHyWJJ6gWW9CV/snKBi8+dpGzZiAUW4j3bT+sQA
         kEkRFMvY/K+F2WRBhUU/Aw+ZhvCvgDYP07VdNhurn9IQQUMuRJhYvRvsUghUHu0Cd7lm
         2HxjMjXHAezdkF4PXpqZnFGn0GCPqevGzJ4qOY7sM7q2tRu5scxmVsHV2bkXeB5xOZay
         Vb/qjRNLocExEd0jwIXNuWn1dpNVgbP5WBCp0KJvYay/+69ktW+ZNYmVv3DQXiNSoqSs
         F/Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vnsVN4bcM0E0y8yL+4jX4NPKN0s5XVfHXg6t0sA+kKU=;
        b=MmNWOTGeY9Mgxbt4j1MFb8nTI3zEGQ1vyvgcBKE+AqNU4WPy8DHzfFpSoCKJsJDti0
         YAyi2gGdNPZpl4fUqFajcZ84A01kS1M9m3fsajXlWy+JB4beSCYU828rjgMfL8MHRP5m
         XGxLdKTRzuzYMmw4QVk57xrdqJqRuK8xcdkVYQwT1RlEMVb3nWzSoLeA0bb45dC2JNOi
         wtR+3caJ8ccQUyoxeSHkDsQCbULVq+sEkr6EaXRkog9FnD1JrsN1VyPZkVUGWffy6L3F
         n6w1hjTVlo7Hi7atgB3JhKhz5vqr1VDYPjqHu296DqvT1qeJSVp7/QU+fiWJZaL/NOei
         AdRA==
X-Gm-Message-State: AOAM530atSGVZXE6eHzixsIa/emLfp3WpgAwf7IFUa5djp77dwE52B8B
        E725Y6n2rOJ498qthEASp2CbHg==
X-Google-Smtp-Source: ABdhPJwkwReehafMcUbIlZNd433otHjSQ1cTcW/iaeTfVVwqL8nOZJoLVmtkJ6iZwqwM5f+LD1MLMA==
X-Received: by 2002:a7b:cd83:: with SMTP id y3mr26353421wmj.126.1628674455789;
        Wed, 11 Aug 2021 02:34:15 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:210:43fd:e634:73d9:e10e])
        by smtp.gmail.com with ESMTPSA id i14sm20670426wmq.40.2021.08.11.02.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 02:34:15 -0700 (PDT)
Date:   Wed, 11 Aug 2021 10:34:09 +0100
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
Message-ID: <YROZkbMEMAeXMt1W@google.com>
References: <cover.1628579170.git.viresh.kumar@linaro.org>
 <YRJym+Vn4bbwQzzs@google.com>
 <20210811051859.ihjzhvrnuct2knvy@vireshk-i7>
 <YROMZFHCor3pbhMr@google.com>
 <20210811091321.xtb776q4t6cwyanx@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210811091321.xtb776q4t6cwyanx@vireshk-i7>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wednesday 11 Aug 2021 at 14:43:21 (+0530), Viresh Kumar wrote:
> On 11-08-21, 09:37, Quentin Perret wrote:
> > On Wednesday 11 Aug 2021 at 10:48:59 (+0530), Viresh Kumar wrote:
> > > I had to use the pm-opp version, since almost everyone was using that.
> > > 
> > > On the other hand, there isn't a lot of OPP specific stuff in
> > > dev_pm_opp_of_register_em(). It just uses dev_pm_opp_get_opp_count(),
> > > that's all. This ended up in the OPP core, nothing else. Maybe we can
> > > now move it back to the EM core and name it differently ?
> > 
> > Well it also uses dev_pm_opp_find_freq_ceil() and
> > dev_pm_opp_get_voltage(), so not sure how easy it will be to move, but
> > if it is possible no objection from me.
> 
> What uses these routines ? dev_pm_opp_of_register_em() ? I am not able
> to see that at least :(

Yep, it's not immediately obvious, but see how it sets the struct
em_data_callback to point at _get_power() where the actual energy
calculation is done. So strictly speaking _get_power() is what uses
these routines, but it goes in hand with dev_pm_opp_of_register_em() so
I guess the same reasoning applies.

> > Right but the EM is a description of the hardware, so it seemed fair
> > to assume this wouldn't change across the lifetime of the OS, similar
> > to the DT which we can't reload at run-time. Yes it can be a little odd
> > if you load/unload your driver module, but note that you generally can't
> > load two completely different drivers on a single system. You'll just
> > load the same one again and the hardware hasn't changed in the meantime,
> > so the previously loaded EM will still be correct.
> 
> Yeah, it will be the same driver but a different version of it, which
> may have updated the freq table. For me the EM is attached to the
> freq-table, and the freq-table is not available anymore after the
> driver is gone.
> 
> Anyway, I will leave that for you guys to decide :)

IIUC Lukasz is working on something that should allow changing the EM at
run-time, so hopefully it'll enable this use-case as well, but we'll see :)
