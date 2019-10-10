Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAA9CD2194
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2019 09:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733025AbfJJHWH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Oct 2019 03:22:07 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:50094 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732792AbfJJHQh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 10 Oct 2019 03:16:37 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A38C655F;
        Thu, 10 Oct 2019 09:16:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1570691794;
        bh=+V/8J1iBkhp1Wk5lpCoil4UR6nN4VKSPzahGVEmLsJs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ug8lhntdgk4cYGVvr5qekVZiafdAS0CSsub9sPNAnlhocj71Cb2YynW7Uv4x/Mvh9
         OjZlVdEcxsNprgi50xR0MKqFR5Oj5wSG8xdbn2yvmkmhKX/pJeX6/z2RdoGwdT7dEU
         4+/gykIXIhnxYAWEK5Ilv51gBwcCcgTERUFPm9MY=
Date:   Thu, 10 Oct 2019 10:16:33 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        linux-omap <linux-omap@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com,
        Sebastian Reichel <sre@kernel.org>
Subject: Re: omapdrm: dsi panels
Message-ID: <20191010071633.GC4756@pendragon.ideasonboard.com>
References: <3C538A9E-BCE9-4ECF-97C2-52E823266296@goldelico.com>
 <a84c175e-3d78-6d51-2018-179d828fc7c7@ti.com>
 <20191010062540.GA4756@pendragon.ideasonboard.com>
 <B5784A6E-1EC1-471C-BE38-F7165002F659@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <B5784A6E-1EC1-471C-BE38-F7165002F659@goldelico.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Nikolaus,

On Thu, Oct 10, 2019 at 08:41:43AM +0200, H. Nikolaus Schaller wrote:
> Am 10.10.2019 um 08:25 schrieb Laurent Pinchart:
> > On Thu, Oct 10, 2019 at 09:07:27AM +0300, Tomi Valkeinen wrote:
> >> On 10/10/2019 09:02, H. Nikolaus Schaller wrote:
> >>> Hi Tomi,
> >>> now as DPI panels have been moved to drm/panel are there plans to
> >>> support DSI panels sitting there as well?
> >>> 
> >>> I have looked to move our boe-w677l driver for the omap5/Pyra handheld
> >>> but it seems there are still some omapdrm dependencies.
> >> 
> >> No, OMAPDSS DSI support has not been moved to DRM model yet. I believe 
> >> Sebastian has been looking at that.
> > 
> > That's my understanding too, if I recall correctly Sebastian told me he
> > had a working implementation, but I'm not sure if it can be upstreamed
> > as-is. It would be amazing to get it in mainline, as we'll be able to
> > drop lots of code from omapdrm.
> 
> Ok, fine. I just wonder if a new driver for omapdrm/displays can then
> be accepted for upstreaming or how long we should have to wait.

I would prefer avoiding new drivers in omapdrm/displays. If you could
collaborate with Sebastian that would be best :-)

-- 
Regards,

Laurent Pinchart
