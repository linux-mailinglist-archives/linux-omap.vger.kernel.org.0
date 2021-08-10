Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF72E3E5C43
	for <lists+linux-omap@lfdr.de>; Tue, 10 Aug 2021 15:53:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242020AbhHJNxv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Aug 2021 09:53:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242012AbhHJNxs (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 10 Aug 2021 09:53:48 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D4F3C061799
        for <linux-omap@vger.kernel.org>; Tue, 10 Aug 2021 06:53:26 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id r6so4160572wrt.4
        for <linux-omap@vger.kernel.org>; Tue, 10 Aug 2021 06:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KGQUuCBolB3utTNPACMz6iKuWRDIGgWJm/VpB8UjVfc=;
        b=Lt1tyTHbI94Kgt8wK9nxBSF3jPgGselZKupAsXiBd6uILEZdcKhg5LYPO6QfrIiNvi
         DWrV2wRXXA01ZHs26Vovn0Uojl4XIZZFox4wswtHZgW6Xuxv9jpzdV5pcfkzcnB8xjO1
         TBhoaYhdFbcRFLb7zW+HVGuD9FiUQp4XHqAABpYgaKY4UU49KRmdSyW6Gl4SH0P13q5B
         Y8wnQ6tNXvOlirXy8jU6Jnp8ImOSwA01aM1IFV5xhXKnjxp2c/EBgSwL8wXkddc1RRFa
         eVi+aWY8EqcCcAi0Ux4F4hsXAxDQinpBrytVKz9rF1QrcnzQ3f3cxJ1deYdyTrUpm9FP
         u/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KGQUuCBolB3utTNPACMz6iKuWRDIGgWJm/VpB8UjVfc=;
        b=knheTnlbDnwRr22wtTFS+o+b+kjEeX3Ow0a7hc103AWozwP3X0S4C/EFi4xVSKZn1P
         zbNpi9yJ5i8IEz0Zo7rnjjtIa+pEYz63cx55sCt1gbkOxPvUPPkEQ1vJSArzaUC7Luzt
         HBspuB6aoDhk9Jk66PsmND/vjcwTa5a97kRZmBjeksspLJtgMArEaoSFN5SLDBM4E60N
         El2iPSKR6jIKb+VeLIDTvapFMSdZD3zJRlFnK2Y2YUxlVbuqz5GgWmfdnKe9oZjbr4bi
         3OVeROKdzRiF54V+MhHoUQaj8MRQzjflhK8GdzJhYpmxGom0nwDPBt/Q1+OFABOV8LCs
         QlLw==
X-Gm-Message-State: AOAM533Sf/kUcqMOwbpV2zr0BDDjqnMrHPtIka5BbSpf0jhSlw9bgOR9
        GPaVzP2kRURceUYJnhagRXl9wg==
X-Google-Smtp-Source: ABdhPJyP5/KLF9l16H0O6iAMcu4TdoATOhVCPzOX8vMqts7ssz/9ljckqMeKlqZVUnJFhD3xwJoprg==
X-Received: by 2002:a5d:660e:: with SMTP id n14mr13818163wru.346.1628603604443;
        Tue, 10 Aug 2021 06:53:24 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:210:e920:cedf:a082:9d02])
        by smtp.gmail.com with ESMTPSA id 18sm3305981wmv.27.2021.08.10.06.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 06:53:24 -0700 (PDT)
Date:   Tue, 10 Aug 2021 14:53:18 +0100
From:   Quentin Perret <qperret@google.com>
To:     Lukasz Luba <lukasz.luba@arm.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Rafael Wysocki <rjw@rjwysocki.net>,
        Vincent Donnefort <vincent.donnefort@arm.com>,
        Andy Gross <agross@kernel.org>,
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
Message-ID: <YRKEztjdIFU1J5/9@google.com>
References: <cover.1628579170.git.viresh.kumar@linaro.org>
 <YRJym+Vn4bbwQzzs@google.com>
 <af06b333-3d8a-807c-9ccb-d491d6a54930@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af06b333-3d8a-807c-9ccb-d491d6a54930@arm.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tuesday 10 Aug 2021 at 14:25:15 (+0100), Lukasz Luba wrote:
> The way I see this is that the flag in cpufreq avoids
> mistakes potentially made by driver developer. It will automaticaly
> register the *simple* EM model via dev_pm_opp_of_register_em() on behalf
> of drivers (which is already done manually by drivers). The developer
> would just set the flag similarly to CPUFREQ_IS_COOLING_DEV and be sure
> it will register at the right time. Well tested flag approach should be
> safer, easier to understand, maintain.

I would agree with all that if calling dev_pm_opp_of_register_em() was
complicated, but that is not really the case. I don't think we ever call
PM_OPP directly from cpufreq core ATM, which makes a lot of sense if you
consider PM_OPP arch-specific. I could understand that we might accept a
little 'violation' of the abstraction with this series if there were
real benefits, but I just don't see them.
