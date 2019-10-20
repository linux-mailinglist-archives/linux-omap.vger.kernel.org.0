Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F76BDDFE0
	for <lists+linux-omap@lfdr.de>; Sun, 20 Oct 2019 20:02:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726561AbfJTSCz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 20 Oct 2019 14:02:55 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:55732 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726559AbfJTSCz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 20 Oct 2019 14:02:55 -0400
Received: from pendragon.ideasonboard.com (143.121.2.93.rev.sfr.net [93.2.121.143])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DF1BFA2C;
        Sun, 20 Oct 2019 20:02:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1571594573;
        bh=8vyI44a9dzD71i+OR0dZy/5su9zXiDuDnsVP0Xd/hvs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YjSq4sfWi8JBSQG0xeq0opCzUmVQwckSNUCWMje4rTWSaLQ+gEKUuHlrXN3VK0aSc
         lv3+07l2u+ekAkhDa86b2TgQtGJyAd5rwXDpuULMXDgmLNap90UJK+hz8tQt6iuvy5
         ye0LaTgbOn+zZEChknhqwyGwGvl2V8HVpauq6qto=
Date:   Sun, 20 Oct 2019 21:02:48 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: V4L2 runs out of memory when OMAP3 ISP parallel pixel clock is
 high
Message-ID: <20191020180248.GD11723@pendragon.ideasonboard.com>
References: <CAHCN7xLMTDondeiYiYHwGG5HYEaRwY9S4uoqQ-Eq6b8ksSS+NA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHCN7xLMTDondeiYiYHwGG5HYEaRwY9S4uoqQ-Eq6b8ksSS+NA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Adam,

On Sun, Oct 20, 2019 at 09:45:25AM -0500, Adam Ford wrote:
> I am running a DM3730 connected to an mt9p031 sensor, and the ISP is
> running in 8-bit parallel mode.
> 
> I have the sensor endpoint configured as:
> 
> mt9p031_out: endpoint {
>      input-clock-frequency = <24000000>;
>      pixel-clock-frequency = <72000000>;
>      remote-endpoint = <&ccdc_ep>;
> };
> 
> I was looking through the datasheet, and it appears as if the pixel
> clock frequency can go up to 96MHz, so I tried to increase the
> pixel-clock-frequency to 96MHz, but v4l2 seems to get an out of memory
> error.
> 
> libv4l2: error turning on stream: No space left on device
> ERROR: from element /GstPipeline:pipeline0/GstV4l2Src:v4l2src0: Failed
> to allocate required memory.
> Additional debug info:
> gstv4l2src.c(658): gst_v4l2src_decide_allocation ():
> /GstPipeline:pipeline0/GstV4l2Src:v4l2src0:
> Buffer pool activation failed
> Execution ended after 0:00:00.019073486

The error code may be misleading. ENOSPC is used here to report that the
maximum CCDC bandwidth has been exceeded, not that the driver is running
out of memory.

The check is performed in isp_video_check_external_subdevs(), and the
maximum CCDC bandwidth is calculated by omap3isp_ccdc_max_rate():

	/*
	 * TRM says that for parallel sensors the maximum data rate
	 * should be 90% form L3/2 clock, otherwise just L3/2.
	 */
	if (ccdc->input == CCDC_INPUT_PARALLEL)
		rate = pipe->l3_ick / 2 * 9 / 10;
	else
		rate = pipe->l3_ick / 2;

Could you point me to the part of the OMAP3 datasheet that you think
allows for 96 MHz ?

> Through trial and error, I was able to get push the sensor's
> pixel-clock-frequency to work at 90MHz, but no higher.  I have also
> tried experimenting with the input clock frequency without success.
> 
> If I can get the clock to run at 96MHz, which the ISP and sensor
> documentation appears to permit, I am hoping to be able to achieve a
> little higher frame rate.
> 
> Is there something I need to do to allocate more memory to V4L2 or is
> there some other limitation causing the out of memory at higher pixel
> clock frequencies?

-- 
Regards,

Laurent Pinchart
