Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66C753AB024
	for <lists+linux-omap@lfdr.de>; Thu, 17 Jun 2021 11:49:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231767AbhFQJvM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 17 Jun 2021 05:51:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229901AbhFQJvL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 17 Jun 2021 05:51:11 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 265E0C06175F
        for <linux-omap@vger.kernel.org>; Thu, 17 Jun 2021 02:49:04 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id c18-20020a05600c0ad2b02901cee262e45fso3300369wmr.4
        for <linux-omap@vger.kernel.org>; Thu, 17 Jun 2021 02:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=zNblqi4A16LusZtsw5tFWE5wJ+Hx1eY3p82HyQ7W+G8=;
        b=glYcl9SsQNX6C3tl3kYxCGsPvo71wD6vvbCx8fvAR2wvspxEtl6nK57/a12RyE/0bl
         ZUFsekhoUuOv3arOuyv9PXZQatEXXbrBUn4s/ZMhAD9YPN8HShqFoCr90Bl7BTKZp6L3
         uzHWRcxtOcaHLSX1ESUKm+WDTt5YmwV7faFPc5FCOVq3icRfoX0sYNDai99cQ0q9wK5L
         4fAwooEENsAk33BsXWMXKZqHc+Zm5iRIwy44PZtKf7qvJtyjybUoOuzdigSEN9NYl72k
         g67KoUMVvQ1H9blX4TJSo5bxG58TmOy0PGJ2INmLY1wwHSF6wOEH+vfjBBGEvMOLhzyL
         Msxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=zNblqi4A16LusZtsw5tFWE5wJ+Hx1eY3p82HyQ7W+G8=;
        b=I/2jhn6VbBF3m/w8FSo+gUGJrtl6z9GWuXynd6vA0ZuU0fNhl/sB5brnm9Oc5aB3TG
         IBO+o4lzCfk539LqDHMSP1Il/QIKt9lpDj8paQf71YQzD2kXVGvLZbUBj45OhM3k69T2
         t8SGw6cZcqEY9rfdTe/LwjILRlGEzYFIHB6xTkKSRDE6ocQT8MKYSLn7cDN0hi8L+okL
         VH6PK7PMYEananZaob5ZZe+EkIVmxw8ryWckxRnqyqldZ8kJM/qJdaEpkrMeb3/vvB6m
         XuCVPCyvOkaSbMQIFF2hcuXOstQZpR/CCUtJS1JYBgk4uk49f+BtWr0YRNwHvD0K9gJN
         nlFQ==
X-Gm-Message-State: AOAM530gA8r9wANTp0TBzGiEQlu1s+qGxW9SZsMdGhBigGIIMZAh8eKY
        0eZmPayrvjxRD7n8PP0nBybh/A==
X-Google-Smtp-Source: ABdhPJx+BmYtjuPGsIRJoQaUOlMSPBRFI+GChRWobaAhxmRhLOeFtbKO7Cq/SzOReBJYL6b7gnsCrQ==
X-Received: by 2002:a05:600c:3b11:: with SMTP id m17mr4126241wms.150.1623923342777;
        Thu, 17 Jun 2021 02:49:02 -0700 (PDT)
Received: from dell ([91.110.221.170])
        by smtp.gmail.com with ESMTPSA id c7sm4928349wrs.23.2021.06.17.02.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 02:49:02 -0700 (PDT)
Date:   Thu, 17 Jun 2021 10:49:00 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Laurentiu Tudor <laurentiu.tudor@nxp.com>
Cc:     linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        German Rivera <German.Rivera@freescale.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-omap@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stuart Yoder <stuyoder@gmail.com>,
        Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 00/10] Rid W=1 warnings from Bus
Message-ID: <YMsajH2uxw4RHPeF@dell>
References: <20210526081038.544942-1-lee.jones@linaro.org>
 <74eb170b-348b-1bba-432c-52c9541b05fe@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <74eb170b-348b-1bba-432c-52c9541b05fe@nxp.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, 26 May 2021, Laurentiu Tudor wrote:

> Hi Lee,
> 
> On 5/26/2021 11:10 AM, Lee Jones wrote:
> > This set is part of a larger effort attempting to clean-up W=1
> > kernel builds, which are currently overwhelmingly riddled with
> > niggly little warnings.
> > 
> > Lee Jones (10):
> >   bus: fsl-mc: mc-io: Supply function names for 'fsl_create_mc_io()' and
> >     'fsl_destroy_mc_io()'
> >   bus: fsl-mc: mc-sys: Supply missing function names in kernel-doc
> >     headers
> >   bus: fsl-mc: fsl-mc-bus: Demote a bunch of non-conformant kernel-doc
> >     headers and help others
> >   bus: fsl-mc: dprc: Fix a couple of misspelling and formatting issues
> >   bus: fsl-mc: dprc-driver: Fix some missing/incorrect function
> >     parameter descriptions
> >   bus: fsl-mc: fsl-mc-allocator: Fix misspelling of 'new_mc_adev' and
> >     demote non-kernel-doc headers
> >   bus: qcom-ebi2: Fix incorrect documentation for '{slow,fast}_cfg'
> >   bus: fsl-mc-msi: Fix a little doc-rot pertaining to 'np' to 'fwnode'
> >     conversion
> >   bus: ti-sysc: Correct misdocumentation of 'sysc_ioremap()'
> >   bus: fsl-mc: mc-io: Correct misdocumentation of 'dpmcp_dev' param
> > 
> >  drivers/bus/fsl-mc/dprc-driver.c      |  8 +++++---
> >  drivers/bus/fsl-mc/dprc.c             |  4 ++--
> >  drivers/bus/fsl-mc/fsl-mc-allocator.c | 10 +++++-----
> >  drivers/bus/fsl-mc/fsl-mc-bus.c       | 19 ++++++++++---------
> >  drivers/bus/fsl-mc/fsl-mc-msi.c       |  2 +-
> >  drivers/bus/fsl-mc/mc-io.c            |  6 +++---
> >  drivers/bus/fsl-mc/mc-sys.c           | 19 ++++++++++---------
> 
> Thanks for this. For drivers/bus/fsl-mc/*:
> 
> Reviewed-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>

Any idea who will take the 'fsl-mc' patches please?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
