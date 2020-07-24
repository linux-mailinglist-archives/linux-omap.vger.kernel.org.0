Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4638222BB56
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jul 2020 03:24:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726259AbgGXBYW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Jul 2020 21:24:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726010AbgGXBYV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 23 Jul 2020 21:24:21 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 777D9C0619D3
        for <linux-omap@vger.kernel.org>; Thu, 23 Jul 2020 18:24:21 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BEFF4279;
        Fri, 24 Jul 2020 03:24:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1595553857;
        bh=/92mB/UdrhoQAGBthcAox6PzBUiTSEUE3eKH/3iQbtc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=c2UBXGjG3+6JNc1XRdxR3qW6bc6cJbwpwy8WlZI43P0ogdaKGwd0Cag5i2IIYQ16I
         ZMdy9ogIyWNb1J4kzsU2MttbRFoKTmVlXKPe1eQnvs2rngKiTkplheAbyyH4FF60SX
         1S0tWt8nNRZrspP1eolHk2Yu7cNijFBs5ssmhsSM=
Date:   Fri, 24 Jul 2020 04:24:11 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Jyri Sarha <jsarha@ti.com>, kernel@pyra-handheld.com,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Subject: Re: module_mipi_dsi_driver panel with omapdrm?
Message-ID: <20200724012411.GJ21353@pendragon.ideasonboard.com>
References: <5F4C23B0-A82B-4F94-BD74-D04F6D798FC0@goldelico.com>
 <20200705142653.GQ37466@atomide.com>
 <20200705143614.GR37466@atomide.com>
 <E200E98D-A4F8-4270-B192-33733F4C7235@goldelico.com>
 <20200706143613.GS37466@atomide.com>
 <E4616E3C-2519-4421-BC75-87A5CA2BB9EF@goldelico.com>
 <20200707180115.GB5849@atomide.com>
 <ECE29C41-DFE5-4A50-9206-6FB3183824C3@goldelico.com>
 <6E0A9415-9AB5-48D9-9E61-12D20655D04D@goldelico.com>
 <EE54FB82-C18E-4B81-AB38-E9453A32406B@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <EE54FB82-C18E-4B81-AB38-E9453A32406B@goldelico.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Nikolaus,

On Thu, Jul 23, 2020 at 09:03:49AM +0200, H. Nikolaus Schaller wrote:
> > Am 08.07.2020 um 09:52 schrieb H. Nikolaus Schaller <hns@goldelico.com>:
> >> Am 07.07.2020 um 21:04 schrieb H. Nikolaus Schaller <hns@goldelico.com>:
> >> 
> >> And what I would need to know before I start to write new code is
> >> if is possible to operate a video mipi dsi panel with driver from
> >> gpu/drm/panel together with omapdrm (v5.7 and later).
> > 
> > I did a quick test on a 5.7.6 kernel with the sysc fixes as
> > suggested by Tony.
> > 
> > Then I overwrote the compatible entry of our display to be
> > orisetech,otm8009a and configured to build the otm8009a panel driver.
> > 
> > The panel driver is loaded, but not probed (no call to otm8009a_probe).
> > It is shown in /sys/bus/mipi-dsi/drivers (and lsmod) but not /sys/bus/mipi-dsi/devices.
> > 
> > So what should I try next?
> 
> Any suggestions if and how it is possible to use a gpu/drm/panel MIPI DSI
> video mode panel with omapdrm (on OMAP5)?

For the DSI panel to probe, the display driver needs to register a DSI
host with mipi_dsi_host_register(). omapdrm doesn't do so yet, we need
to integrate Sebastian's "[PATCHv2 00/56] drm/omap: Convert DSI code to
use drm_mipi_dsi and drm_panel" series first. I'll try to review it in
the near future.

> The problem is that our old omapdrm/display driver is broken since v5.7 and
> an experimental gpu/drm/panel driver does not probe. And I assume that
> omapdrm/display will disappear completely soon.

Not before Sebastian's series gets integrated.

-- 
Regards,

Laurent Pinchart
