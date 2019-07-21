Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 014D46F696
	for <lists+linux-omap@lfdr.de>; Mon, 22 Jul 2019 01:01:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726167AbfGUXA6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 21 Jul 2019 19:00:58 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:57806 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726022AbfGUXA5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 21 Jul 2019 19:00:57 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 7E59628A24F
Message-ID: <22d7eca4ad8aa2e73933c4f83c92221ce6e0945a.camel@collabora.com>
Subject: Re: [PATCH] Enable backlight when trigger is activated
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Pavel Machek <pavel@ucw.cz>,
        kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, tony@atomide.com, sre@kernel.org,
        nekit1000@gmail.com, mpartap@gmx.net, merlijn@wizzup.org,
        jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org,
        b.zolnierkie@samsung.com, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org
Date:   Sun, 21 Jul 2019 20:00:44 -0300
In-Reply-To: <20190718190849.GA11409@amd>
References: <20190718190849.GA11409@amd>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Pavel,

The commit log is lacking the proper "leds: triggers: ".

Also...

On Thu, 2019-07-18 at 21:08 +0200, Pavel Machek wrote:
> Configuring backlight trigger from dts results in backlight off during
> boot. Machine looks dead upon boot, which is not good.
> 
> Fix that by enabling LED on trigger activation.
> 
> Signed-off-by: Pavel Machek <pavel@ucw.cz>
> 
> diff --git a/drivers/leds/trigger/ledtrig-backlight.c b/drivers/leds/trigger/ledtrig-backlight.c
> index 487577d..6e6bc78 100644
> --- a/drivers/leds/trigger/ledtrig-backlight.c
> +++ b/drivers/leds/trigger/ledtrig-backlight.c
> @@ -114,6 +114,8 @@ static int bl_trig_activate(struct led_classdev *led)
>  	n->old_status = UNBLANK;
>  	n->notifier.notifier_call = fb_notifier_callback;
>  
> +	led_set_brightness(led, LED_ON);
> +

This looks fishy.

Maybe you should use a default-state = "keep" instead? (and you'll have
to support it in the LED driver).

That'll give you proper "don't touch the LED if it was turned on" behavior,
which is what you seem to want.

Regards,
Eze

