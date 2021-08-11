Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9003C3E8D54
	for <lists+linux-omap@lfdr.de>; Wed, 11 Aug 2021 11:36:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236605AbhHKJgp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Aug 2021 05:36:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236668AbhHKJgo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 11 Aug 2021 05:36:44 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6624EC061765
        for <linux-omap@vger.kernel.org>; Wed, 11 Aug 2021 02:36:21 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id m24-20020a17090a7f98b0290178b1a81700so3756978pjl.4
        for <linux-omap@vger.kernel.org>; Wed, 11 Aug 2021 02:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=J02656YR2Fe+Hj72RiSigwAaGmAyuf7/C51n8U6jOdY=;
        b=wxXAi1TAzSCXJ4QCDlmvMQ90aBtvPmzeF2vdBsrRB91gYbhARcpyzZfqnHoV4G2xNg
         VC24e1WDKeK4nD1bFXlgcjRNkZCt2bEojXrNOOtiMgnVDLZSA489i6baRAfgRRe5oIwo
         k29UcaiaX1PjrV5lKsYOfvc8V6bWqq3Ey8mg7DOycJQ9elkfHIjitqfBM7RdeNY4X6RQ
         KqqiU13RUPRjNFXs6tG5Yh95/J38x6x5phrwCwYSFSmjuuClGEd84rHeij+/Kyszpz2B
         g4lbXalMWU282IPf6r4BarnwBCb45ZcWtA43eB2xFUwvyAlttMZbSvBTXlhirVuOsHV9
         KMsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=J02656YR2Fe+Hj72RiSigwAaGmAyuf7/C51n8U6jOdY=;
        b=OAt0FrjTaduDyoYE8QPsiwq39E7ArS+FLqUHG/685Ocx+HsdqBSeji3SxIAidFPWis
         FbvDg5P2/1dpfysAtKeVtTJkToPOhJGYYrSsM2ukHhfZFLNPMXuq0EFyHuz10Hg/v3hw
         GnvvjGqZKaEC1MPab+bSCf9ar3J3Da+vpGXm5Em5sLRkQBVZCD+ZHcCeLCdUtfA3XDLv
         63At+1k0xSfDEfPK0KZCyjGl5HhG3jEttJt0yCwUjdciFhdIUvaCtAFpRGlE7CnIFDSj
         outw80usxyD4C/kFQObqZJfeRl4cX5XObHvxZGjzeCdjKMA94g0XcSGqizMRjCfxAN7g
         x+cQ==
X-Gm-Message-State: AOAM531Wg28WgtGIdy4sbZBdflAL4CHuJ3Dr6NyZt4UPgt61ruL/bYjM
        FwMgC1JRM8dwFU/KaTwQ6yAynA==
X-Google-Smtp-Source: ABdhPJys+C5eNI9Pw3BvNOuNX3w2Mr6lTrvVQYtWv/q628SqQBf/F7vEkJNqmZGhccHk0WzM588r5g==
X-Received: by 2002:a17:90a:4a88:: with SMTP id f8mr9875619pjh.226.1628674581006;
        Wed, 11 Aug 2021 02:36:21 -0700 (PDT)
Received: from localhost ([122.172.201.85])
        by smtp.gmail.com with ESMTPSA id 26sm32218359pgx.72.2021.08.11.02.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 02:36:20 -0700 (PDT)
Date:   Wed, 11 Aug 2021 15:06:18 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Quentin Perret <qperret@google.com>
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
Message-ID: <20210811093618.7ncznvblttk6hjlt@vireshk-i7>
References: <cover.1628579170.git.viresh.kumar@linaro.org>
 <YRJym+Vn4bbwQzzs@google.com>
 <20210811051859.ihjzhvrnuct2knvy@vireshk-i7>
 <YROMZFHCor3pbhMr@google.com>
 <20210811091321.xtb776q4t6cwyanx@vireshk-i7>
 <YROZkbMEMAeXMt1W@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YROZkbMEMAeXMt1W@google.com>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 11-08-21, 10:34, Quentin Perret wrote:
> Yep, it's not immediately obvious, but see how it sets the struct
> em_data_callback to point at _get_power() where the actual energy
> calculation is done. So strictly speaking _get_power() is what uses
> these routines, but it goes in hand with dev_pm_opp_of_register_em() so
> I guess the same reasoning applies.

My bad.

-- 
viresh
