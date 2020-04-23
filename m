Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6BDE1B6140
	for <lists+linux-omap@lfdr.de>; Thu, 23 Apr 2020 18:48:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729689AbgDWQsH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Apr 2020 12:48:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729661AbgDWQsG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Thu, 23 Apr 2020 12:48:06 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97FE8C09B041
        for <linux-omap@vger.kernel.org>; Thu, 23 Apr 2020 09:48:06 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id y24so7290786wma.4
        for <linux-omap@vger.kernel.org>; Thu, 23 Apr 2020 09:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oeW7DpwK6OFjCBKNQLrqnMbfGJLDE0OYjEBqgEog0ow=;
        b=BZAU2ZE5Ne/lQJ9uzrq8Y6uSMWk2RcQiCd+b+CVY3yzxGoOUoDmU1pFRzaKcLc3JOA
         hb9PbGSk3EG61c2VuKMh6n9nVdeCeKdREDewxGx/cfMu7d/fdgQ5NJjOQfO8cyEYmuWy
         Ck60HvH+uctNWqEGuN32PGsDQZnbPrP5HSsiWC+kJeuFNkdgdMmQ3iqrZGNADnBi2Mo8
         MfqCco6iumadOLg9jIS/GhZufVO/mUhu+P3cgkrAhO/w96tB6Yvmf7fIEbLSelHxAs4q
         RM24gcZ/PnV/LQr9mWTKhfYKOuDyTFtT3m0wjORsqAndwMtN7yTnUaW/M18X37gEhghl
         oEGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oeW7DpwK6OFjCBKNQLrqnMbfGJLDE0OYjEBqgEog0ow=;
        b=X7keXICPVcIAS3IeoeNwhAHJtgejQYGwCqIXVUAplPOcjW2zPgGU8ZOeO0lsFCZFwE
         8RkAhENV2RbN5Cevx3OM4yr6HwLQA7UzrVix4jh7n40uX5rFQKkXTMfWl5oX/MydTjU3
         y3fnrto8iDwuQZrSSKwT5vFyzYWpZsFm1iw7ajScHoDohUGR1EkDQzJkcuXxsqC0Qs6m
         vdn+l4YkF5GUzNitzR740hXH2DgjDRt05+jbC94npF6Qs0cZ8cp/PZGehSIqEslmNlVL
         YhJK/8Qe3fNdrrjZvA7a2SI+Mg6VoIgenWmSTaR+eVOmprYrwccHDZSbFZWkx0waX+23
         hbuw==
X-Gm-Message-State: AGi0PuYc9gVOxBc8u+WMvuwv1x4wWmwkajdObJyADqPvAPrW83r7HezM
        g5v6hhwlUc0GhwSxmVTC+ZGC0g==
X-Google-Smtp-Source: APiQypL1N3VJZzRRWP+PtS/fdnZb1T66+D/zjqtbVIUR8pO7XtbEvjwXmID9KnBgg0fgEaDYfwzw+Q==
X-Received: by 2002:a1c:ac44:: with SMTP id v65mr5176929wme.33.1587660485234;
        Thu, 23 Apr 2020 09:48:05 -0700 (PDT)
Received: from linaro.org ([37.167.216.250])
        by smtp.gmail.com with ESMTPSA id a20sm4857880wra.26.2020.04.23.09.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2020 09:48:04 -0700 (PDT)
Date:   Thu, 23 Apr 2020 18:47:59 +0200
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     Lukasz Luba <lukasz.luba@arm.com>
Cc:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-imx@nxp.com, Dietmar.Eggemann@arm.com, cw00.choi@samsung.com,
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
Subject: Re: [PATCH v6 08/10] OPP: refactor dev_pm_opp_of_register_em() and
 update related drivers
Message-ID: <20200423164759.GF65632@linaro.org>
References: <20200410084210.24932-1-lukasz.luba@arm.com>
 <20200410084210.24932-9-lukasz.luba@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200410084210.24932-9-lukasz.luba@arm.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Apr 10, 2020 at 09:42:08AM +0100, Lukasz Luba wrote:
> The Energy Model framework supports not only CPU devices. Drop the CPU
> specific interface with cpumask and add struct device. Add also a return
> value, user might use it. This new interface provides easy way to create
> a simple Energy Model, which then might be used by e.g. thermal subsystem.
>
> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>

