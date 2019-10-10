Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 503CBD20C0
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2019 08:25:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726983AbfJJGZp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Oct 2019 02:25:45 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:49564 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726840AbfJJGZp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 10 Oct 2019 02:25:45 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2216855F;
        Thu, 10 Oct 2019 08:25:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1570688743;
        bh=9uHWsReip/AOYfOYUBWN4tt4KeAH5aspiH6FnjmAn0c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kRf8cYjND2w8NWx5L5M7Lyt/zRVdWiRsUGNajyBnaQpb6wMbEl5BQUMFRyfQHvp0Q
         14q1rppfBi9Sml0vsFtFqaqccj7DCe4hcFcNCBGNB0SdJuGaMc/RC3mqL1scHXddSC
         VbhoycF7LUwgMHmYNJA3Gc1jk87H++SJoJ8nHqe0=
Date:   Thu, 10 Oct 2019 09:25:40 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     "H. Nikolaus Schaller" <hns@goldelico.com>,
        linux-omap <linux-omap@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com,
        Sebastian Reichel <sre@kernel.org>
Subject: Re: omapdrm: dsi panels
Message-ID: <20191010062540.GA4756@pendragon.ideasonboard.com>
References: <3C538A9E-BCE9-4ECF-97C2-52E823266296@goldelico.com>
 <a84c175e-3d78-6d51-2018-179d828fc7c7@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a84c175e-3d78-6d51-2018-179d828fc7c7@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Oct 10, 2019 at 09:07:27AM +0300, Tomi Valkeinen wrote:
> On 10/10/2019 09:02, H. Nikolaus Schaller wrote:
> > Hi Tomi,
> > now as DPI panels have been moved to drm/panel are there plans to
> > support DSI panels sitting there as well?
> > 
> > I have looked to move our boe-w677l driver for the omap5/Pyra handheld
> > but it seems there are still some omapdrm dependencies.
> 
> No, OMAPDSS DSI support has not been moved to DRM model yet. I believe 
> Sebastian has been looking at that.

That's my understanding too, if I recall correctly Sebastian told me he
had a working implementation, but I'm not sure if it can be upstreamed
as-is. It would be amazing to get it in mainline, as we'll be able to
drop lots of code from omapdrm.

-- 
Regards,

Laurent Pinchart
