Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5A1C1CD8C3
	for <lists+linux-omap@lfdr.de>; Mon, 11 May 2020 13:46:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728531AbgEKLqc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 11 May 2020 07:46:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726068AbgEKLqb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Mon, 11 May 2020 07:46:31 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F2B5C05BD0A
        for <linux-omap@vger.kernel.org>; Mon, 11 May 2020 04:46:30 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id w19so4086761wmc.1
        for <linux-omap@vger.kernel.org>; Mon, 11 May 2020 04:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8HihaMjBho7yHhoZ4dXDWrBXozE3xr0NvWok/3IgXso=;
        b=KTJtUy+xvCilgtfASvMVkrHFxJGWQd6oQfRtMj53UFUDKm0GLZdcKmysVquVdcGnNQ
         GnLnowb53q2mnDekrftfm5idSn2La4Hwi3EQlRIr2/x9kLZEGljvyDzDJ/tH/iPMhCm1
         Br1Mj0mQ+w2yON0HQ2T8K1qFr/JqndsQWJkbeeocTf/p+tdDaBtBm97H2lzKg+T6eaZa
         e1c0Mmv7ay3WSrdGzzxq+HftjVHi1YFqLO/rTY4o27q48B7uXHJnRU8plAj3pMPpDMjc
         48oZp2j9ep2hx9TCcvQ4njLDs5w+TaPPZM4SJGoDmaM0Jh1BZ2wDTD7I2hrixnS3uVeE
         pxUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8HihaMjBho7yHhoZ4dXDWrBXozE3xr0NvWok/3IgXso=;
        b=GOTAzGEbEop9FtA/Epaoe1TBCziv3zvZ/A16WM8jv3371Z7nquZJZRp3URnMvsOyiJ
         G7uYyXU5ffADt3KxPxCHQu82rOQeX8wmYeEOQTrweEb6nZO9Ci4gMv70yUDwu/jOFgar
         6CBwYOjhBhWCBqIIv4+DvgIXctYMsMaAJ0R2dFWHEzXjDxojNQVNHmO6ZWG/UXemYPOP
         tSHJ///bFHdLHf2l7hyDo0iRGT7cUjXtsmhWrwP6PFzfmfLTY9SCd0QG/7ebWimWod8o
         fZLz25MC7Dt6GKxUdj3XwXT5/eVaWwwJrd0yjBnLHA20wY6xTVVI8043Cmwaq2KnQ7wJ
         91Uw==
X-Gm-Message-State: AGi0PuYvDTSBaenWEWHcWLaaP0oyJs/OAdwVb+x2Yooy6Ld7TInHpopz
        j4d09Cc96F0s645UIN5nDVxb/g==
X-Google-Smtp-Source: APiQypK+52M5jh5tMkIap1YctDwL5nM0Q2YdPkE9mtpXjfSY9F6Whlp3f9IAQU+9uwYyfn1ELFgsiA==
X-Received: by 2002:a7b:ce89:: with SMTP id q9mr33216701wmj.185.1589197588860;
        Mon, 11 May 2020 04:46:28 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
        by smtp.gmail.com with ESMTPSA id w18sm17682226wro.33.2020.05.11.04.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 04:46:28 -0700 (PDT)
Date:   Mon, 11 May 2020 12:46:24 +0100
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
Subject: Re: [PATCH v7 01/15] PM / EM: change naming convention from
 'capacity' to 'performance'
Message-ID: <20200511114624.GA11091@google.com>
References: <20200511111912.3001-1-lukasz.luba@arm.com>
 <20200511111912.3001-2-lukasz.luba@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200511111912.3001-2-lukasz.luba@arm.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Monday 11 May 2020 at 12:18:58 (+0100), Lukasz Luba wrote:
> The Energy Model uses concept of performance domain and capacity states in
> order to calculate power used by CPUs. Change naming convention from
> capacity to performance state would enable wider usage in future, e.g.
> upcoming support for other devices other than CPUs.
> 
> Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>

Acked-by: Quentin Perret <qperret@google.com>
