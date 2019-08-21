Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54B57982CE
	for <lists+linux-omap@lfdr.de>; Wed, 21 Aug 2019 20:31:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728044AbfHUSbb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 21 Aug 2019 14:31:31 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60230 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726513AbfHUSbb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 21 Aug 2019 14:31:31 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AD03E33D;
        Wed, 21 Aug 2019 20:31:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1566412289;
        bh=ZQMon4Bsj4tN2eCs+vBULpxfTnRnRgRzIrpjScdpz6k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dDRVg5c1btysM5JFkfuWc9O5A9rcr27yc0Szzqj0qaOcl5OB73V872vB9AKhOVjHC
         CrG9BC6dXDYhH5ycwvtoY6vLMzT8o3eGiZagsGCH19ZciaV/6FadidKDRDJgowEabr
         +WpvrnhnF7C00KNiQKEqPEtgpQRXnWd/KpkojuLU=
Date:   Wed, 21 Aug 2019 21:31:23 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Aaro Koskinen <aaro.koskinen@iki.fi>
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: OMAP DRM regression on N900
Message-ID: <20190821183123.GC26759@pendragon.ideasonboard.com>
References: <20190818140838.GC30291@darkstar.musicnaut.iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190818140838.GC30291@darkstar.musicnaut.iki.fi>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Aaro,

On Sun, Aug 18, 2019 at 05:08:38PM +0300, Aaro Koskinen wrote:
> Hi,
> 
> I haven't got display working on N900 since v5.1. Bisected to:
> 
> d17eb4537a7eb16da9eafbfd5717e12b45b77251 is the first bad commit
> commit d17eb4537a7eb16da9eafbfd5717e12b45b77251
> Author: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Date:   Wed Sep 12 19:41:31 2018 +0300
> 
>     drm/omap: Factor out common init/cleanup code for output devices

Sorry :-(

I'll send a tentative fix, I'd appreciate if you could test it.

> looks like with this commit I get only the TV out:
> 
> $ ls -l /sys/class/drm/
> total 0
> lrwxrwxrwx    1 root     root             0 Aug 18 16:15 card0 -> ../../devices/platform/omapdrm.0/drm/card0
> lrwxrwxrwx    1 root     root             0 Aug 18 16:15 card0-SVIDEO-1 -> ../../devices/platform/omapdrm.0/drm/card0/card0-SVIDEO-1
> lrwxrwxrwx    1 root     root             0 Aug 18 16:15 renderD128 -> ../../devices/platform/omapdrm.0/drm/renderD128
> -r--r--r--    1 root     root          4096 Aug 18 16:15 version
> 
> with the previous commit both outputs are there:
> 
> $ ls -l /sys/class/drm/
> total 0
> lrwxrwxrwx    1 root     root             0 Aug 18 16:28 card0 -> ../../devices/platform/omapdrm.0/drm/card0
> lrwxrwxrwx    1 root     root             0 Aug 18 16:28 card0-LVDS-1 -> ../../devices/platform/omapdrm.0/drm/card0/card0-LVDS-1
> lrwxrwxrwx    1 root     root             0 Aug 18 16:28 card0-SVIDEO-1 -> ../../devices/platform/omapdrm.0/drm/card0/card0-SVIDEO-1
> lrwxrwxrwx    1 root     root             0 Aug 18 16:28 renderD128 -> ../../devices/platform/omapdrm.0/drm/renderD128
> -r--r--r--    1 root     root          4096 Aug 18 16:28 version
> 
> Used .config below.

[snip]

-- 
Regards,

Laurent Pinchart
