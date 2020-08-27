Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB490254E9A
	for <lists+linux-omap@lfdr.de>; Thu, 27 Aug 2020 21:31:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726120AbgH0Tbn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 27 Aug 2020 15:31:43 -0400
Received: from mail-ej1-f66.google.com ([209.85.218.66]:33169 "EHLO
        mail-ej1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726197AbgH0Tbm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 27 Aug 2020 15:31:42 -0400
Received: by mail-ej1-f66.google.com with SMTP id a21so9245595ejp.0;
        Thu, 27 Aug 2020 12:31:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2peXTNVB708v8DkOUa4J+wAL01oJLStPeQaycve+FsY=;
        b=P1iDJUwaieI6CUcp/bXx0dBl4GmVQc0StwH+QEimoGQ2fFlPBnMNWIa+WcgDVcRtXt
         4Fs5Ps5NRpZbP+zvLwXEckNm98oI1sxyo891Fw3SCbaW99bDFVXPK4TMBuQCdLtP7StF
         YT03U9KNfL/g1gOvCBamLkyoHZrXY7BMc0OEaQdNcjhAmqs1XLTvMAcsv9pHBRQcKyAC
         dOteSYogKTi0VBMGFLxyb0lx0jT2q+1hF+eW6gwc1V8Lf3cCAP6F/iF8lLpUA0rGX6jP
         Q4yBElCGlgI9cmnUo1GHbbNkzcq+lNcO5ua3gXe2jn5IyMKg1I9vUKYPWutdVvAKZ/ut
         V4xw==
X-Gm-Message-State: AOAM531UfC8mpVThKaqJVRe02vOV+Os1PASa6MpJ5Ho7j41Sas+wgEly
        wHPn749zBhl0tuhvSDCVXWk=
X-Google-Smtp-Source: ABdhPJxdm116OkLqbip153lekykMHJWMkpHyGe+vbfHc3gOq/x3/zBEhfIczX8p6ppfvnA7jJpytwQ==
X-Received: by 2002:a17:906:5383:: with SMTP id g3mr23567780ejo.370.1598556700556;
        Thu, 27 Aug 2020 12:31:40 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
        by smtp.googlemail.com with ESMTPSA id g90sm2278669edd.64.2020.08.27.12.31.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Aug 2020 12:31:39 -0700 (PDT)
Date:   Thu, 27 Aug 2020 21:31:37 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Roger Quadros <rogerq@ti.com>
Cc:     YueHaibing <yuehaibing@huawei.com>, tony@atomide.com,
        ladis@linux-mips.org, bbrezillon@kernel.org, peter.ujfalusi@ti.com,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] memory: omap-gpmc: Fix build error without CONFIG_OF
Message-ID: <20200827193137.GA7882@kozik-lap>
References: <20200826125919.22172-1-yuehaibing@huawei.com>
 <20200827125316.20780-1-yuehaibing@huawei.com>
 <20200827132154.GB4384@kozik-lap>
 <45d3fa05-01e8-c879-e314-ae627ca4c266@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <45d3fa05-01e8-c879-e314-ae627ca4c266@ti.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Aug 27, 2020 at 07:37:18PM +0300, Roger Quadros wrote:
> 
> 
> On 27/08/2020 16:21, Krzysztof Kozlowski wrote:
> > On Thu, Aug 27, 2020 at 08:53:16PM +0800, YueHaibing wrote:
> > > If CONFIG_OF is n, gcc fails:
> > > 
> > > drivers/memory/omap-gpmc.o: In function `gpmc_omap_onenand_set_timings':
> > > omap-gpmc.c:(.text+0x2a88): undefined reference to `gpmc_read_settings_dt'
> > > 
> > > Add gpmc_read_settings_dt() helper function, which zero the gpmc_settings
> > > so the caller doesn't proceed with random/invalid settings.
> > > 
> > > Fixes: a758f50f10cf ("mtd: onenand: omap2: Configure driver from DT")
> > > Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> > > ---
> > > v3: zero gpmc_settings
> > > v2: add gpmc_read_settings_dt() stub
> > > ---
> > >   drivers/memory/omap-gpmc.c | 4 ++++
> > >   1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/drivers/memory/omap-gpmc.c b/drivers/memory/omap-gpmc.c
> > > index cd9e80748591..e026b4cd3612 100644
> > > --- a/drivers/memory/omap-gpmc.c
> > > +++ b/drivers/memory/omap-gpmc.c
> > > @@ -2310,6 +2310,10 @@ static void gpmc_probe_dt_children(struct platform_device *pdev)
> > >   	}
> > >   }
> > >   #else
> > > +void gpmc_read_settings_dt(struct device_node *np, struct gpmc_settings *p)
> > > +{
> > > +	memset(p, 0, sizeof(struct gpmc_settings));
> > 
> > sizeof(*p) but if patch is otherwise ok (got review/ack) then I can fix
> > it while applying.
> > 
> > If there is resend, please fix it as well.
> 
> With the sizeof(*p) change.
> 
> Acked-by: Roger Quadros <rogerq@ti.com>

Thanks, applied.

Best regards,
Krzysztof

