Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89BAD28B79
	for <lists+linux-omap@lfdr.de>; Thu, 23 May 2019 22:27:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387450AbfEWU1o (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 May 2019 16:27:44 -0400
Received: from smtprelay0160.hostedemail.com ([216.40.44.160]:37661 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726451AbfEWU1o (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Thu, 23 May 2019 16:27:44 -0400
X-Greylist: delayed 504 seconds by postgrey-1.27 at vger.kernel.org; Thu, 23 May 2019 16:27:43 EDT
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave04.hostedemail.com (Postfix) with ESMTP id 23F581801B747
        for <linux-omap@vger.kernel.org>; Thu, 23 May 2019 20:19:20 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay08.hostedemail.com (Postfix) with ESMTP id A74F8182CED28;
        Thu, 23 May 2019 20:19:18 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,:::::::::::::::::::::,RULES_HIT:41:355:379:599:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2559:2562:2828:3138:3139:3140:3141:3142:3352:3622:3865:3866:3868:3871:4250:4321:5007:6117:6119:7903:10004:10400:10848:11026:11232:11473:11657:11658:11914:12043:12048:12679:12740:12760:12895:13069:13311:13357:13439:14659:14721:21080:21433:21451:21627:30029:30054:30091,0,RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.8.0.180 64.201.201.201,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:fn,MSBL:0,DNSBL:neutral,Custom_rules:0:0:0,LFtime:28,LUA_SUMMARY:none
X-HE-Tag: lock32_6e24366692258
X-Filterd-Recvd-Size: 2246
Received: from XPS-9350.home (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
        (Authenticated sender: joe@perches.com)
        by omf11.hostedemail.com (Postfix) with ESMTPA;
        Thu, 23 May 2019 20:19:16 +0000 (UTC)
Message-ID: <f1fa87acecc7cb5329d28d42f7327742aceb04db.camel@perches.com>
Subject: Re: [PATCHv6 1/4] drm/omap: use DRM_DEBUG_DRIVER instead of CORE
From:   Joe Perches <joe@perches.com>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Sebastian Reichel <sre@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Tony Lindgren <tony@atomide.com>, Pavel Machek <pavel@ucw.cz>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com
Date:   Thu, 23 May 2019 13:19:15 -0700
In-Reply-To: <20190523200756.25314-2-sebastian.reichel@collabora.com>
References: <20190523200756.25314-1-sebastian.reichel@collabora.com>
         <20190523200756.25314-2-sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.30.1-1build1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 2019-05-23 at 22:07 +0200, Sebastian Reichel wrote:
> This macro is only used by omapdrm, which should print
> debug messages using the DRIVER category instead of the
> default CORE category.
[]
> diff --git a/drivers/gpu/drm/omapdrm/omap_drv.h b/drivers/gpu/drm/omapdrm/omap_drv.h
[]
> @@ -37,8 +37,8 @@
>  #include "omap_irq.h"
>  #include "omap_plane.h"
>  
> -#define DBG(fmt, ...) DRM_DEBUG(fmt"\n", ##__VA_ARGS__)
> -#define VERB(fmt, ...) if (0) DRM_DEBUG(fmt, ##__VA_ARGS__) /* verbose debug */
> +#define DBG(fmt, ...) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
> +#define VERB(fmt, ...) if (0) DRM_DEBUG_DRIVER(fmt, ##__VA_ARGS__) /* verbose debug */

Trivia:

Strictly, this should use do { if (0) etc... } while (0)

Also, none of the VERB uses have a terminating newline
so ideally, this should be:

#define VERB(fmt, ...) do { if (0) DRM_DEBUG_DRIVER(fmt "\n", ##__VA_ARGS__); } while (0) /* verbose debug */

And VERB isn't a particularly intelligible macro name.
Maybe VDBG instead.


