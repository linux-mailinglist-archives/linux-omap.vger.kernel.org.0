Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 617FF9893D
	for <lists+linux-omap@lfdr.de>; Thu, 22 Aug 2019 04:08:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730827AbfHVCI6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 21 Aug 2019 22:08:58 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:37300 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729805AbfHVCI6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 21 Aug 2019 22:08:58 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5E62F2DF;
        Thu, 22 Aug 2019 04:08:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1566439736;
        bh=0w9S0KClv9HhZJalStBBocg/PyE+NQ4Y2Cu4M64hd88=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=O4yf93B3Vcedc3hZEHmf/Tcf4MNjOOzaUKKamlKHbeVbe8sXdskyETqiqrl8DInVL
         YJrkBy6UTLECGJHxaSv+p+aPA1rMJFligG8JbnQMLDak74kGSVuPFiI9LSqyvatdHq
         HBTMhNlsOlbv1bMSgUjG/sRMIHsIft4ipbpiLPAk=
Date:   Thu, 22 Aug 2019 05:08:50 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: Question about drm/omap: Remove panel-dpi driver
Message-ID: <20190822020850.GC17402@pendragon.ideasonboard.com>
References: <CAHCN7x+F9c-_0febeV1EdJqVBs8aOrqYLQdds26MT25t=Sa_Fg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHCN7x+F9c-_0febeV1EdJqVBs8aOrqYLQdds26MT25t=Sa_Fg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hello Adam,

On Wed, Aug 21, 2019 at 08:14:43PM -0500, Adam Ford wrote:
> I know it's been nearly 9 months this this was removed, but for those
> of us who still define our displays in the device tree expecting the
> dpi-panel, we're not getting video.
> 
> The commit message only states:
> 
>     Panels are now supported through the drm_panel infrastructure, remove
>     the omapdrm-specific driver.
> 
> It does not give examples of how to do this, and I feel like we should
> have been given some warning or indication.  Is there an example I can
> follow for linking a dpi panel into the omap DSS?

Sorry to have left you with non-working systems :-(

If the panel is supported by a mainline DRM panel driver the change
should be transparent (provided of course that the driver is compiled in
the kernel or as a module). Most panels are supported by the
panel-simple driver (CONFIG_DRM_PANEL_SIMPLE), with a few dozen of other
panels supported by dedicated drivers (in drivers/gpu/drm/panel/)

Could you point me to the DT sources of one (or all) of the affected
systems ?

-- 
Regards,

Laurent Pinchart
