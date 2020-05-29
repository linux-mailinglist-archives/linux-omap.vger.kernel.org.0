Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA1BC1E7828
	for <lists+linux-omap@lfdr.de>; Fri, 29 May 2020 10:22:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725913AbgE2IWe (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 29 May 2020 04:22:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:43504 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725775AbgE2IWe (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 29 May 2020 04:22:34 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 32CBE2075A;
        Fri, 29 May 2020 08:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590740553;
        bh=bF+LDFKKjlpS21JygvHXpMb9WnNnBV/JsdAJKAMxjZs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ICjfZOphbFZLG5btT32Hp4tn9NGWybHZBgnR3m2vcuI6BJJr4xsqSbGpskfnXhahr
         Sux2cUhuyBFdlhJ1kX1rXWLGUCS/ZRrNVUzPCWZzCkHnNn8cjsz/4etAhb/A6Zenbh
         lXFsI8hB0AUoZDIo4CEPmuymr7KPrHwkZDH8UXrE=
Date:   Fri, 29 May 2020 10:22:31 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     wu000273@umn.edu
Cc:     kjlu@umn.edu, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Enrico Weigelt <info@metux.net>,
        Allison Randal <allison@lohutok.net>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Rob Clark <robdclark@gmail.com>,
        Dave Airlie <airlied@gmail.com>, linux-omap@vger.kernel.org,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] omapfb: Fix reference count leak in display_init_sysfs.
Message-ID: <20200529082231.GA847132@kroah.com>
References: <20200528194424.11596-1-wu000273@umn.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200528194424.11596-1-wu000273@umn.edu>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, May 28, 2020 at 02:44:23PM -0500, wu000273@umn.edu wrote:
> From: Qiushi Wu <wu000273@umn.edu>
> 
> kobject_init_and_add() takes reference even when it fails.
> If this function returns an error, kobject_put() must be called to
> properly clean up the memory associated with the object.
> Because function omap_dss_put_device() doesn't handle dssdev->kobj,
> thus we need insert kobject_put() to clean up the kobject,
> when kobject_init_and_add() fails.
> 
> Fixes: f76ee892a99e ("omapfb: copy omapdss & displays for omapfb")
> Signed-off-by: Qiushi Wu <wu000273@umn.edu>
> ---
>  drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c b/drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c
> index 6dbe265b312d..51322ac7df07 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/display-sysfs.c
> @@ -316,6 +316,7 @@ int display_init_sysfs(struct platform_device *pdev)
>  			&pdev->dev.kobj, "%s", dssdev->alias);
>  		if (r) {
>  			DSSERR("failed to create sysfs files\n");
> +			kobject_put(&dssdev->kobj);
>  			omap_dss_put_device(dssdev);
>  			goto err;
>  		}

Why is a driver creating "raw" kobjects and the like at all?

/me goes off to look...


Ick, no, that's not ok, this just needs to be an attribute group
attached to the device, no need for a kobject at all.  Having a kobject
means that the files will be ignored totally by userspace tools that
monitor sysfs changes.  So these files are probably not even being
used...

Please fix this up properly.

thanks,

greg k-h
