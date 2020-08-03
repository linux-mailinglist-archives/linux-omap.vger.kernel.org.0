Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 203C423ADFC
	for <lists+linux-omap@lfdr.de>; Mon,  3 Aug 2020 22:13:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726457AbgHCUMQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 3 Aug 2020 16:12:16 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:57630 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgHCUMQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 3 Aug 2020 16:12:16 -0400
Received: from ravnborg.org (unknown [188.228.123.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id D00AF20023;
        Mon,  3 Aug 2020 22:12:10 +0200 (CEST)
Date:   Mon, 3 Aug 2020 22:12:09 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Joe Perches <joe@perches.com>
Cc:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Timur Tabi <timur@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Antonino Daplas <adaplas@gmail.com>,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH][next] fbdev: Use fallthrough pseudo-keyword
Message-ID: <20200803201209.GA579791@ravnborg.org>
References: <20200707210539.GA12530@embeddedor>
 <20200803194024.GA525506@ravnborg.org>
 <101585b1d3c2a9db8fe394c51f64115e8bfc1754.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <101585b1d3c2a9db8fe394c51f64115e8bfc1754.camel@perches.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
        a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
        a=kj9zAlcOel0A:10 a=VwQbUJbxAAAA:8 a=JD9iRpnvPCjC92fAJV8A:9
        a=CjuIK1q_8ugA:10 a=1F1461vogZIA:10 a=5kKzt1m56AEA:10
        a=AjGcO6oz07-iQ99wixmX:22
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Aug 03, 2020 at 12:52:40PM -0700, Joe Perches wrote:
> On Mon, 2020-08-03 at 21:41 +0200, Sam Ravnborg wrote:
> > On Tue, Jul 07, 2020 at 04:05:39PM -0500, Gustavo A. R. Silva wrote:
> > > Replace the existing /* fall through */ comments and its variants with
> > > the new pseudo-keyword macro fallthrough[1]. Also, remove unnecessary
> > > fall-through markings when it is the case.
> > > 
> > > [1] https://www.kernel.org/doc/html/latest/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through
> > > 
> > > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> > 
> > Thanks.
> > 
> > Fixed indent in arcfb.c while applying.
> > Applied to drm-misc-next and it will appear in 5.10
> 
> Perhaps better would be to fix all the switch / case
> brace uses so that it looks more typical kernel style.

falltrhough seems like an OK thing to do even if fbdev is in pure
maintenance mode. Mostly so tools do not stumble upon this and
we continue to see patches.

But larger refactorings seems a little pointless.

If we do this change, should we then also start to accept indent fixes
for the other switch () cases in the fbdev drivers.

My initial reaction is therefore thanks, but no thanks.

	Sam

> 
> > > diff --git a/drivers/video/fbdev/arcfb.c b/drivers/video/fbdev/arcfb.c
> > > index 6f7838979f0a..ae3d8e8b8d33 100644
> > > --- a/drivers/video/fbdev/arcfb.c
> > > +++ b/drivers/video/fbdev/arcfb.c
> > > @@ -419,7 +419,7 @@ static int arcfb_ioctl(struct fb_info *info,
> > >  			schedule();
> > >  			finish_wait(&arcfb_waitq, &wait);
> > >  		}
> > > -		/* fall through */
> > > +			fallthrough;
> > >  
> > >  		case FBIO_GETCONTROL2:
> > >  		{
> 
> ---
>  drivers/video/fbdev/arcfb.c | 52 ++++++++++++++++++++++-----------------------
>  1 file changed, 25 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/video/fbdev/arcfb.c b/drivers/video/fbdev/arcfb.c
> index 6f7838979f0a..4419655e3e58 100644
> --- a/drivers/video/fbdev/arcfb.c
> +++ b/drivers/video/fbdev/arcfb.c
> @@ -403,35 +403,33 @@ static int arcfb_ioctl(struct fb_info *info,
>  	unsigned long flags;
>  
>  	switch (cmd) {
> -		case FBIO_WAITEVENT:
> -		{
> -			DEFINE_WAIT(wait);
> -			/* illegal to wait on arc if no irq will occur */
> -			if (!par->irq)
> -				return -EINVAL;
> -
> -			/* wait until the Arc has generated an interrupt
> -			 * which will wake us up */
> -			spin_lock_irqsave(&par->lock, flags);
> -			prepare_to_wait(&arcfb_waitq, &wait,
> -					TASK_INTERRUPTIBLE);
> -			spin_unlock_irqrestore(&par->lock, flags);
> -			schedule();
> -			finish_wait(&arcfb_waitq, &wait);
> -		}
> -		/* fall through */
> +	case FBIO_WAITEVENT: {
> +		DEFINE_WAIT(wait);
> +		/* illegal to wait on arc if no irq will occur */
> +		if (!par->irq)
> +			return -EINVAL;
>  
> -		case FBIO_GETCONTROL2:
> -		{
> -			unsigned char ctl2;
> +		/* wait until the Arc has generated an interrupt
> +		 * which will wake us up */
> +		spin_lock_irqsave(&par->lock, flags);
> +		prepare_to_wait(&arcfb_waitq, &wait, TASK_INTERRUPTIBLE);
> +		spin_unlock_irqrestore(&par->lock, flags);
> +		schedule();
> +		finish_wait(&arcfb_waitq, &wait);
> +		fallthrough;
> +	}
>  
> -			ctl2 = ks108_readb_ctl2(info->par);
> -			if (copy_to_user(argp, &ctl2, sizeof(ctl2)))
> -				return -EFAULT;
> -			return 0;
> -		}
> -		default:
> -			return -EINVAL;
> +	case FBIO_GETCONTROL2: {
> +		unsigned char ctl2;
> +
> +		ctl2 = ks108_readb_ctl2(info->par);
> +		if (copy_to_user(argp, &ctl2, sizeof(ctl2)))
> +			return -EFAULT;
> +		return 0;
> +	}
> +
> +	default:
> +		return -EINVAL;
>  	}
>  }
>  
> 
