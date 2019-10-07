Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3AFCCEA22
	for <lists+linux-omap@lfdr.de>; Mon,  7 Oct 2019 19:08:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728083AbfJGRIR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Oct 2019 13:08:17 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39382 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728796AbfJGRIR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 7 Oct 2019 13:08:17 -0400
Received: from pendragon.ideasonboard.com (modemcable118.64-20-96.mc.videotron.ca [96.20.64.118])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 522A9B8C;
        Mon,  7 Oct 2019 19:08:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1570468094;
        bh=N7ISq7NdXSNBI5n1IAaAmaCNu3Aqe5oOlMG9ryV4jx0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vJihZlHHKearzFDPIQbRJMBmk4dQa77vOgzD9+B3PLSv3J08wgfnUb5n2v6+8+U4f
         HH2JipujkTzPu1u44nzcb/XxuhwZDF95a4+nWXhf5DLUD9+8KagFqFcAgFi63gOewM
         z2bF7PxZ1EnXqYbZnrohu9DXDhJy5YlfEKsqkkPM=
Date:   Mon, 7 Oct 2019 20:08:11 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, Tony Lindgren <tony@atomide.com>,
        Jyri Sarha <jsarha@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Letux-kernel] [PATCH] ARM: omap2plus_defconfig: Fix selected
 panels after generic panel changes
Message-ID: <20191007170811.GA11781@pendragon.ideasonboard.com>
References: <20191003165539.50318-1-tony@atomide.com>
 <03ca02c1-2816-17cd-03fd-5b72e5d0ec96@ti.com>
 <39E48EC6-65FE-419B-BBE8-E72CB44B517D@goldelico.com>
 <20191006145348.GD4740@pendragon.ideasonboard.com>
 <20191006223958.67725fdf@aktux>
 <20191007064035.72016c78@aktux>
 <654d00a7-d802-d116-84c4-7c614d0fe272@ti.com>
 <20191007180957.69cf7b55@aktux>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191007180957.69cf7b55@aktux>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Oct 07, 2019 at 06:09:57PM +0200, Andreas Kemnade wrote:
> On Mon, 7 Oct 2019 17:29:20 +0300 Tomi Valkeinen wrote:
> > On 07/10/2019 07:40, Andreas Kemnade wrote:
> > 
> >>>> That's really weird, the driver name, the SPI device table and the OF
> >>>> device table are the same (except for the "omapdss," prefix that we
> >>>> don't add anymore in omapdss-boot-init.c). Would you be able to
> >>>> investigate what broke ?
> >>>>      
> >>> in earlier times:
> >>>
> >>> root@gta04:/sys/bus/spi/devices/spi4.0# cat modalias
> >>> spi:tpo,td028ttec1
> >>>
> >>> now in 5.4-rc1:
> >>> root@gta04:/sys/bus/spi/devices/spi4.0# cat modalias
> >>> spi:td028ttec1
> >>>
> >>> root@gta04:~# modinfo /lib/modules/5.4.0-rc1-letux+/kernel/drivers/gpu/drm/panel/panel-tpo-td028ttec1.ko
> >>> filename:       /lib/modules/5.4.0-rc1-letux+/kernel/drivers/gpu/drm/panel/panel-tpo-td028ttec1.ko
> >>> license:        GPL
> >>> description:    Toppoly TD028TTEC1 panel driver
> >>> author:         H. Nikolaus Schaller <hns@goldelico.com>
> >>> srcversion:     6B3E224BCD3D76253CF361C
> >>> alias:          of:N*T*Ctoppoly,td028ttec1C*
> >>> alias:          of:N*T*Ctoppoly,td028ttec1
> >>> alias:          of:N*T*Ctpo,td028ttec1C*
> >>> alias:          of:N*T*Ctpo,td028ttec1
> >>> alias:          spi:toppoly,td028ttec1
> >>> alias:          spi:tpo,td028ttec1
> >>> depends:        drm
> >>> intree:         Y
> >>> name:           panel_tpo_td028ttec1
> >>> vermagic:       5.4.0-rc1-letux+ SMP preempt mod_unload ARMv7 p2v8
> >>>
> >>> That alias is not in the list.
> >>>  
> >> some more research:
> >> in former times
> >> of_modalias_node() has stripped the omapdss prefix, result: modalias=spi:tpo,td028ttec1
> >> now it strips the tpo prefix because there is no omapdss prefix anymore.  
> > 
> > I haven't studied this more yet, but yes, I can see of_modalias_node 
> > stripping the vendor prefix on purpose. I do wonder how this is supposed 
> > to work, it would make more sense to me to keep the vendor prefix.
> > 
> > Is the spi_device_id supposed to be without vendor prefix? With a quick 
> > grep, this seems to be the case.
>
> as it is done in drivers/spi/spi.c we have no influence from drm side.
> So we must live with it. Also checked several drivers, no vendor-prefix
> there.

I *think* SPI drivers are not supposed to include any prefix. The fix
would then simply be to strip the prefix from the SPI table (leaving it
there for the OF table of course). I've submitted a patch series to do
so.

-- 
Regards,

Laurent Pinchart
