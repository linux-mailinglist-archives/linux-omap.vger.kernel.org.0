Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F134215F6C3
	for <lists+linux-omap@lfdr.de>; Fri, 14 Feb 2020 20:24:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388175AbgBNTYT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 14 Feb 2020 14:24:19 -0500
Received: from eddie.linux-mips.org ([148.251.95.138]:38744 "EHLO
        cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729320AbgBNTYT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 14 Feb 2020 14:24:19 -0500
X-Greylist: delayed 459 seconds by postgrey-1.27 at vger.kernel.org; Fri, 14 Feb 2020 14:24:17 EST
Received: (from localhost user: 'ladis' uid#1021 fake: STDIN
        (ladis@eddie.linux-mips.org)) by eddie.linux-mips.org
        id S23994981AbgBNTQgVDTwM (ORCPT
        <rfc822;linux-input@vger.kernel.org> + 3 others);
        Fri, 14 Feb 2020 20:16:36 +0100
Date:   Fri, 14 Feb 2020 20:16:34 +0100
From:   Ladislav Michl <ladis@linux-mips.org>
To:     Merlijn Wajer <merlijn@wizzup.org>
Cc:     =?iso-8859-2?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mattias Jacobsson <2pi@mok.nu>,
        "Darren Hart (VMware)" <dvhart@infradead.org>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] Input: add `SW_MACHINE_COVER`
Message-ID: <20200214191634.GA6251@lenoch>
References: <20200214130249.6845-1-merlijn@wizzup.org>
 <20200214130249.6845-2-merlijn@wizzup.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200214130249.6845-2-merlijn@wizzup.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Merlijn,

On Fri, Feb 14, 2020 at 02:02:47PM +0100, Merlijn Wajer wrote:
> This event code represents the state of a removable cover of a device.
> Value 1 means that the cover is open or removed, value 0 means that the
> cover is closed.
> 
> This can be used to preempt users removing a removable mmc card or even
> the battery, allowing userspace to attempt to safely unmount a card.
> ---
>  include/linux/mod_devicetable.h        | 2 +-
>  include/uapi/linux/input-event-codes.h | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
> index 448621c32e4d..4c692cb3cc1d 100644
> --- a/include/linux/mod_devicetable.h
> +++ b/include/linux/mod_devicetable.h
> @@ -299,7 +299,7 @@ struct pcmcia_device_id {
>  #define INPUT_DEVICE_ID_LED_MAX		0x0f
>  #define INPUT_DEVICE_ID_SND_MAX		0x07
>  #define INPUT_DEVICE_ID_FF_MAX		0x7f
> -#define INPUT_DEVICE_ID_SW_MAX		0x0f
> +#define INPUT_DEVICE_ID_SW_MAX		0x10
>  #define INPUT_DEVICE_ID_PROP_MAX	0x1f
>  
>  #define INPUT_DEVICE_ID_MATCH_BUS	1
> diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
> index 64cee116928e..318a6387cdfb 100644
> --- a/include/uapi/linux/input-event-codes.h
> +++ b/include/uapi/linux/input-event-codes.h
> @@ -807,7 +807,8 @@
>  #define SW_LINEIN_INSERT	0x0d  /* set = inserted */
>  #define SW_MUTE_DEVICE		0x0e  /* set = device disabled */
>  #define SW_PEN_INSERTED		0x0f  /* set = pen inserted */
> -#define SW_MAX			0x0f
> +#define SW_MACHINE_COVER	 0x10 /* set = cover closed */

There is an extra space above ^

> +#define SW_MAX			0x10
>  #define SW_CNT			(SW_MAX+1)
>  
>  /*
> -- 
> 2.23.0
