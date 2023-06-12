Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4D9E72CAC6
	for <lists+linux-omap@lfdr.de>; Mon, 12 Jun 2023 17:56:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234689AbjFLP4P (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 12 Jun 2023 11:56:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239183AbjFLP4G (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 12 Jun 2023 11:56:06 -0400
Received: from mailrelay3-1.pub.mailoutpod2-cph3.one.com (mailrelay3-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:402::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 099BEE5
        for <linux-omap@vger.kernel.org>; Mon, 12 Jun 2023 08:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=rsa1;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=tcWQA5H4cR6MataMzwJ5cbMtnnuXfycrMduhjpzg6mY=;
        b=l1dEhqZiVA11X8jRcxeaKLJVjbDp1IRR3pJ4vE8vdNDGEvR2qJW7d/btnEtqBSHr12W03ZpTSUMQH
         pJJdyB6y+KYujR2IqTqp2Oqt9GwjtpTgWEIFtXT+8KSZw6nAeNMbIjmP2go2tjnZTdT9Cx4IW6k+TH
         NTHVUG7yceI70VZjPYzQBoMmdVBpwiO4toZLqtcuqLcjJmsjPXWzuMW47LezJD+qlOOVbqJi9DifB5
         81u/Z9WRP70LlJgfi+SI8UI+7Kz1S/qC8kWvnlxURG6QYxdoEpqHELukBMTyOsRM4w6it6w6G8xWdA
         b3hsmV19baTbyVJxqlVekNr1JjywSGg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=ed1;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=tcWQA5H4cR6MataMzwJ5cbMtnnuXfycrMduhjpzg6mY=;
        b=aSgCOaxOGroedAbPmjXgq95MpFal+EdzSiNZWiLk9LijKWg9Injw7SY6uYrEM/GK/EsF5kiKeJIu9
         7OdWa67AQ==
X-HalOne-ID: a08419ff-0939-11ee-921f-b90637070a9d
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
        by mailrelay3 (Halon) with ESMTPSA
        id a08419ff-0939-11ee-921f-b90637070a9d;
        Mon, 12 Jun 2023 15:56:03 +0000 (UTC)
Date:   Mon, 12 Jun 2023 17:56:01 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     daniel@ffwll.ch, javierm@redhat.com, deller@gmx.de,
        geert+renesas@glider.be, lee@kernel.org,
        daniel.thompson@linaro.org, jingoohan1@gmail.com,
        dan.carpenter@linaro.org, michael.j.ruhl@intel.com,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-sh@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/38] fbdev: Make userspace interfaces optional
Message-ID: <20230612155601.GC1243864@ravnborg.org>
References: <20230612141352.29939-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612141352.29939-1-tzimmermann@suse.de>
X-Spam-Status: No, score=-0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLACK autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Thomas,

Nice series, quite some preparations.

On Mon, Jun 12, 2023 at 04:07:38PM +0200, Thomas Zimmermann wrote:
> Add the new config option FB_DEVICE. If enabled, fbdev provides
> traditional userspace interfaces in devfs, sysfs and procfs, such
> as /dev/fb0 or /proc/fb.
> 
> Modern Linux distrobutions have adopted DRM drivers for graphics
> output and use fbdev only for the kernel's framebuffer console.
> Userspace has also moved on, with no new fbdev code being written
> and existing support being removed.
> 
> OTOH, fbdev provides userspace a way of accessing kernel or I/O
> memory, which might compromise the system's security. See the recent
> commit c8687694bb1f ("drm/fbdev-generic: prohibit potential
> out-of-bounds access") for an example. Disabling fbdev userspace
> interfaces is therefore a useful feature to limit unnecessary
> exposure of fbdev code to processes of low privilegues.
> 
> Patches 1 to 31 fix various bugs and issues in fbdev-related code.
> In most cases the code uses the fbdev device where it should use
> the Linux hardware device or something else. Most of these patches
> fix existing problems and should therefore be considered in any case.
> 
> Patches 32 to 37 refactor the fbdev core code. The patches move
> support for backlights, sysfs, procfs and devfs into separate files
> and hide it behind simple interfaces. These changes will allow to
> easily build the userspace support conditionally.
> 
> Patch 38 introduces the config option FB_DEVICE and adapts the fbdev
> core to support it. The field struct fb_info.dev is now optional,
> hence the name of the config option.
> 
> Tested on simpledrm and i915, including the device handover.
> 
> Future directions: With the support for disabling fbdev userspace
> interfaces in place, it will be possible to make most fbdev drivers'
> file-I/O code in struct fb_ops optional as well. 
> 
> v2:
> 	* fix fsl-diu-fb and sh7760fb
> 	* split backlight patches
> 	* set 'default y' for FB_CONFIG
> 	* minor fixes and corrections
> 
> Thomas Zimmermann (38):
>   backlight/bd6107: Compare against struct fb_info.device
>   backlight/bd6107: Rename struct bd6107_platform_data.fbdev to 'dev'
>   backlight/gpio_backlight: Compare against struct fb_info.device
>   backlight/gpio_backlight: Rename field 'fbdev' to 'dev'
>   backlight/lv5207lp: Compare against struct fb_info.device
>   backlight/lv5207lp: Rename struct lv5207lp_platform_data.fbdev to
>     'dev'
>   fbdev/atyfb: Reorder backlight and framebuffer init/cleanup
>   fbdev/atyfb: Use hardware device as backlight parent
>   fbdev/aty128fb: Reorder backlight and framebuffer init/cleanup
>   fbdev/aty128fb: Use hardware device as backlight parent
>   fbdev/broadsheetfb: Call device_remove_file() with hardware device
>   fbdev/ep93xx-fb: Output messages with fb_info() and fb_err()
>   fbdev/ep93xx-fb: Do not assign to struct fb_info.dev
>   fbdev/fsl-diu-fb: Output messages with fb_*() helpers
>   fbdev/mb862xxfb: Output messages with fb_dbg()
>   fbdev/metronomefb: Use hardware device for dev_err()
>   fbdev/nvidiafb: Reorder backlight and framebuffer init/cleanup
>   fbdev/nvidiafb: Use hardware device as backlight parent
>   fbdev/pxa168fb: Do not assign to struct fb_info.dev
>   fbdev/radeonfb: Reorder backlight and framebuffer cleanup
>   fbdev/radeonfb: Use hardware device as backlight parent
>   fbdev/rivafb: Reorder backlight and framebuffer init/cleanup
>   fbdev/rivafb: Use hardware device as backlight parent
>   fbdev/sh7760fb: Use fb_dbg() in sh7760fb_get_color_info()
>   fbdev/sh7760fb: Output messages with fb_dbg()
>   fbdev/sh7760fb: Use hardware device with dev_() output during probe
>   fbdev/sm501fb: Output message with fb_err()
>   fbdev/tdfxfb: Set i2c adapter parent to hardware device
The above are all:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

>   fbdev/smscufx: Detect registered fb_info from refcount
I did not try to understand the code, so others must review.

>   fbdev/ep93xx-fb: Alloc DMA memory from hardware device
>   fbdev/sh7760fb: Alloc DMA memory from hardware device
This smells like bug-fixes, and I do not see what impact the change has.
So again, someone else needs to provide review here.

The rest are already reviewed or got a dedicated reply.

	Sam
