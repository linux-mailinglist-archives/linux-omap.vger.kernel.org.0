Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A4BF290242
	for <lists+linux-omap@lfdr.de>; Fri, 16 Oct 2020 11:53:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405485AbgJPJxg convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-omap@lfdr.de>); Fri, 16 Oct 2020 05:53:36 -0400
Received: from mx2.suse.de ([195.135.220.15]:42070 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406400AbgJPJxg (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 16 Oct 2020 05:53:36 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 1A87CACF1;
        Fri, 16 Oct 2020 09:53:34 +0000 (UTC)
Date:   Fri, 16 Oct 2020 11:53:31 +0200
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     Xu Wang <vulab@iscas.ac.cn>
Cc:     b.zolnierkie@samsung.com, pakki001@umn.edu, yuehaibing@huawei.com,
        linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] omapfb/dss: Remove redundant null check before
 clk_prepare_enable/clk_disable_unprepare
Message-ID: <20201016115331.0dd4341e@linux-uq9g>
In-Reply-To: <20201015100827.1115fa9b@linux-uq9g>
References: <20201014084920.25813-1-vulab@iscas.ac.cn>
        <20201015100827.1115fa9b@linux-uq9g>
Organization: SUSE Software Solutions Germany GmbH
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 15 Oct 2020 10:08:27 +0200 Thomas Zimmermann <tzimmermann@suse.de>
wrote:

> On Wed, 14 Oct 2020 08:49:20 +0000 Xu Wang <vulab@iscas.ac.cn> wrote:
> 
> > Because clk_prepare_enable() and clk_disable_unprepare() already checked
> > NULL clock parameter, so the additional checks are unnecessary, just
> > remove them.
> > 
> > Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> 

Merged into drm-misc-next. Thanks!

> > ---
> >  drivers/video/fbdev/omap2/omapfb/dss/venc.c | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/video/fbdev/omap2/omapfb/dss/venc.c
> > b/drivers/video/fbdev/omap2/omapfb/dss/venc.c index
> > 0b0ad20afd63..8895fb8493d8 100644 ---
> > a/drivers/video/fbdev/omap2/omapfb/dss/venc.c +++
> > b/drivers/video/fbdev/omap2/omapfb/dss/venc.c @@ -890,8 +890,7 @@ static
> > int venc_remove(struct platform_device *pdev) 
> >  static int venc_runtime_suspend(struct device *dev)
> >  {
> > -	if (venc.tv_dac_clk)
> > -		clk_disable_unprepare(venc.tv_dac_clk);
> > +	clk_disable_unprepare(venc.tv_dac_clk);
> >  
> >  	dispc_runtime_put();
> >  
> > @@ -906,8 +905,7 @@ static int venc_runtime_resume(struct device *dev)
> >  	if (r < 0)
> >  		return r;
> >  
> > -	if (venc.tv_dac_clk)
> > -		clk_prepare_enable(venc.tv_dac_clk);
> > +	clk_prepare_enable(venc.tv_dac_clk);
> >  
> >  	return 0;
> >  }
> 
> 
> 



-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
