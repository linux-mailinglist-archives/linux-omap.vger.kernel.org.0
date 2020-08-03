Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACA9C23ADCD
	for <lists+linux-omap@lfdr.de>; Mon,  3 Aug 2020 21:52:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728167AbgHCTwq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 3 Aug 2020 15:52:46 -0400
Received: from smtprelay0007.hostedemail.com ([216.40.44.7]:55530 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728069AbgHCTwq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 3 Aug 2020 15:52:46 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay04.hostedemail.com (Postfix) with ESMTP id 8CCEB180A9F23;
        Mon,  3 Aug 2020 19:52:44 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 50,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:69:355:379:599:800:857:960:967:968:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1543:1593:1594:1711:1730:1747:1777:1792:2393:2525:2553:2560:2563:2682:2685:2693:2828:2859:2904:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3355:3622:3865:3867:3868:3870:3871:3872:3874:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4321:5007:6742:7974:9025:9592:10004:10400:10848:11026:11232:11658:11914:12043:12291:12296:12297:12438:12555:12683:12740:12760:12895:13439:14096:14097:14181:14659:14721:21063:21080:21324:21347:21451:21627:21773:21990:30054:30075:30090:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:2,LUA_SUMMARY:none
X-HE-Tag: bath65_48004ae26fa0
X-Filterd-Recvd-Size: 4366
Received: from XPS-9350.home (unknown [47.151.133.149])
        (Authenticated sender: joe@perches.com)
        by omf18.hostedemail.com (Postfix) with ESMTPA;
        Mon,  3 Aug 2020 19:52:42 +0000 (UTC)
Message-ID: <101585b1d3c2a9db8fe394c51f64115e8bfc1754.camel@perches.com>
Subject: Re: [PATCH][next] fbdev: Use fallthrough pseudo-keyword
From:   Joe Perches <joe@perches.com>
To:     Sam Ravnborg <sam@ravnborg.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
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
Date:   Mon, 03 Aug 2020 12:52:40 -0700
In-Reply-To: <20200803194024.GA525506@ravnborg.org>
References: <20200707210539.GA12530@embeddedor>
         <20200803194024.GA525506@ravnborg.org>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, 2020-08-03 at 21:41 +0200, Sam Ravnborg wrote:
> On Tue, Jul 07, 2020 at 04:05:39PM -0500, Gustavo A. R. Silva wrote:
> > Replace the existing /* fall through */ comments and its variants with
> > the new pseudo-keyword macro fallthrough[1]. Also, remove unnecessary
> > fall-through markings when it is the case.
> > 
> > [1] https://www.kernel.org/doc/html/latest/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through
> > 
> > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> 
> Thanks.
> 
> Fixed indent in arcfb.c while applying.
> Applied to drm-misc-next and it will appear in 5.10

Perhaps better would be to fix all the switch / case
brace uses so that it looks more typical kernel style.

> > diff --git a/drivers/video/fbdev/arcfb.c b/drivers/video/fbdev/arcfb.c
> > index 6f7838979f0a..ae3d8e8b8d33 100644
> > --- a/drivers/video/fbdev/arcfb.c
> > +++ b/drivers/video/fbdev/arcfb.c
> > @@ -419,7 +419,7 @@ static int arcfb_ioctl(struct fb_info *info,
> >  			schedule();
> >  			finish_wait(&arcfb_waitq, &wait);
> >  		}
> > -		/* fall through */
> > +			fallthrough;
> >  
> >  		case FBIO_GETCONTROL2:
> >  		{

---
 drivers/video/fbdev/arcfb.c | 52 ++++++++++++++++++++++-----------------------
 1 file changed, 25 insertions(+), 27 deletions(-)

diff --git a/drivers/video/fbdev/arcfb.c b/drivers/video/fbdev/arcfb.c
index 6f7838979f0a..4419655e3e58 100644
--- a/drivers/video/fbdev/arcfb.c
+++ b/drivers/video/fbdev/arcfb.c
@@ -403,35 +403,33 @@ static int arcfb_ioctl(struct fb_info *info,
 	unsigned long flags;
 
 	switch (cmd) {
-		case FBIO_WAITEVENT:
-		{
-			DEFINE_WAIT(wait);
-			/* illegal to wait on arc if no irq will occur */
-			if (!par->irq)
-				return -EINVAL;
-
-			/* wait until the Arc has generated an interrupt
-			 * which will wake us up */
-			spin_lock_irqsave(&par->lock, flags);
-			prepare_to_wait(&arcfb_waitq, &wait,
-					TASK_INTERRUPTIBLE);
-			spin_unlock_irqrestore(&par->lock, flags);
-			schedule();
-			finish_wait(&arcfb_waitq, &wait);
-		}
-		/* fall through */
+	case FBIO_WAITEVENT: {
+		DEFINE_WAIT(wait);
+		/* illegal to wait on arc if no irq will occur */
+		if (!par->irq)
+			return -EINVAL;
 
-		case FBIO_GETCONTROL2:
-		{
-			unsigned char ctl2;
+		/* wait until the Arc has generated an interrupt
+		 * which will wake us up */
+		spin_lock_irqsave(&par->lock, flags);
+		prepare_to_wait(&arcfb_waitq, &wait, TASK_INTERRUPTIBLE);
+		spin_unlock_irqrestore(&par->lock, flags);
+		schedule();
+		finish_wait(&arcfb_waitq, &wait);
+		fallthrough;
+	}
 
-			ctl2 = ks108_readb_ctl2(info->par);
-			if (copy_to_user(argp, &ctl2, sizeof(ctl2)))
-				return -EFAULT;
-			return 0;
-		}
-		default:
-			return -EINVAL;
+	case FBIO_GETCONTROL2: {
+		unsigned char ctl2;
+
+		ctl2 = ks108_readb_ctl2(info->par);
+		if (copy_to_user(argp, &ctl2, sizeof(ctl2)))
+			return -EFAULT;
+		return 0;
+	}
+
+	default:
+		return -EINVAL;
 	}
 }
 


