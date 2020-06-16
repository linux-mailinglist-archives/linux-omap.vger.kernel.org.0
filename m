Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 406A61FAE8E
	for <lists+linux-omap@lfdr.de>; Tue, 16 Jun 2020 12:50:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726805AbgFPKu5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 16 Jun 2020 06:50:57 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:53312 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbgFPKu5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 16 Jun 2020 06:50:57 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 1B0FC1C0BD2; Tue, 16 Jun 2020 12:50:56 +0200 (CEST)
Date:   Tue, 16 Jun 2020 12:50:45 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Merlijn Wajer <merlijn@wizzup.org>
Cc:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Tony Lindgren <tony@atomide.com>,
        Beno??t Cousson <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Borislav Petkov <bp@suse.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mattias Jacobsson <2pi@mok.nu>,
        Mark Gross <mgross@linux.intel.com>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        "open list:OMAP DEVICE TREE SUPPORT" <linux-omap@vger.kernel.org>,
        "open list:OMAP DEVICE TREE SUPPORT" <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." 
        <linux-input@vger.kernel.org>
Subject: Re: [PATCH 1/2] Input: add `SW_MACHINE_COVER`
Message-ID: <20200616105045.GB1718@bug>
References: <20200612125402.18393-1-merlijn@wizzup.org>
 <20200612125402.18393-2-merlijn@wizzup.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200612125402.18393-2-merlijn@wizzup.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri 2020-06-12 14:53:58, Merlijn Wajer wrote:
> This event code represents the state of a removable cover of a device.
> Value 0 means that the cover is open or removed, value 1 means that the
> cover is closed.
> 
> Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com> Acked-by: Tony Lindgren 
> <tony@atomide.com> Signed-off-by: Merlijn Wajer <merlijn@wizzup.org> ---

Dmitry, can we get some kind of comment here, or better yet can we get you to apply this?

Thanks,
										Pavel
> +++ b/include/linux/mod_devicetable.h
> @@ -318,7 +318,7 @@ struct pcmcia_device_id {
>  #define INPUT_DEVICE_ID_LED_MAX		0x0f
>  #define INPUT_DEVICE_ID_SND_MAX		0x07
>  #define INPUT_DEVICE_ID_FF_MAX		0x7f
> -#define INPUT_DEVICE_ID_SW_MAX		0x0f
> +#define INPUT_DEVICE_ID_SW_MAX		0x10
>  #define INPUT_DEVICE_ID_PROP_MAX	0x1f
>  
>  #define INPUT_DEVICE_ID_MATCH_BUS	1
> diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
> index b6a835d37826..0c2e27d28e0a 100644
> --- a/include/uapi/linux/input-event-codes.h
> +++ b/include/uapi/linux/input-event-codes.h
> @@ -888,7 +888,8 @@
>  #define SW_LINEIN_INSERT	0x0d  /* set = inserted */
>  #define SW_MUTE_DEVICE		0x0e  /* set = device disabled */
>  #define SW_PEN_INSERTED		0x0f  /* set = pen inserted */
> -#define SW_MAX			0x0f
> +#define SW_MACHINE_COVER	0x10  /* set = cover closed */
> +#define SW_MAX			0x10
>  #define SW_CNT			(SW_MAX+1)
>  
>  /*
> -- 
> 2.24.1

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
