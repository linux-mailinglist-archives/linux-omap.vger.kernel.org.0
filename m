Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AA3D1658B8
	for <lists+linux-omap@lfdr.de>; Thu, 20 Feb 2020 08:49:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbgBTHsY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 20 Feb 2020 02:48:24 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:34556 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726248AbgBTHsY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 20 Feb 2020 02:48:24 -0500
Received: by mail-wr1-f67.google.com with SMTP id n10so3500681wrm.1
        for <linux-omap@vger.kernel.org>; Wed, 19 Feb 2020 23:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=D7/ilOTv/yfu8Ewt4axgtGDzooZ+foxh4W/MQRjliDM=;
        b=jMbZPFgAztkpn/Loio4h8rIr0dDunFm7z6lTmGUQtV5OJrvz92wbttJ/+tMh8NowL2
         z1vThmc3N71RgnHF2+g5tJWWOdEsN4mp5kowlGnMiCD73SOu47thpDOMDGL701pUi5aP
         ryZN4nJLqy7fpegqQeTnLcP4zK0Nf8lysNGi6+569kWsh1Q4kXWMG5Ujv2+fD/U6sq3P
         hH5UD9uG3vxYW5fhUP7Ew97APi3TU6OakDzhqdgDf7ExXffBeuYg09pk5uXU6x26uAYX
         HeBk4GGYaDVxODy/6shfrytrKglqKSrWfHtdQGvW2lstWoKJApx+P3W5W9ayhiRUBZec
         kouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=D7/ilOTv/yfu8Ewt4axgtGDzooZ+foxh4W/MQRjliDM=;
        b=i7JqBJLp7GNyzuRpPyguEIH/fGCJzZXKB5U0zqMpCr6HixkKFwxma7oKvlQkPwJjMc
         CFHeJfMJpJrRee3HhSD7HGyh31DJwnB36YCW72vVAFcz9oUT95UWNgGoIk1oYE1YONDu
         4QZdCUVxosudhByoBXicPJncgOtdXkxyh6H6PsjgPDwqseNha5VswapwBc/91+uZ/4Tb
         BCPnPwo6SN54jakH5iwDiRnC9MBYShO6G+mJL4jBrZLXqxhCOL5+AhsQ0EMmqrcdLq7N
         3MFm0JjKb5ZR4RubcmZ9dxpVX1jmmK0E1NdPRa2kUhT5dpl0qsvadfndozaJqUJooZRp
         jImQ==
X-Gm-Message-State: APjAAAXDXAr0T1UiMq6W2BNMBzYkTglju6wHY7gk71kbe2mlDmnCK7Yd
        JItl3qy4D6gj4HxIX5qaCQy5eg==
X-Google-Smtp-Source: APXvYqzdP9CBfyqkStiBpbb7vc3kk+lFEglaLS3RelisPlykfjRR3shD5qopiw1lOITr4YUmZpWffw==
X-Received: by 2002:adf:f787:: with SMTP id q7mr40744149wrp.297.1582184902510;
        Wed, 19 Feb 2020 23:48:22 -0800 (PST)
Received: from dell ([2.31.163.122])
        by smtp.gmail.com with ESMTPSA id t187sm3571099wmt.25.2020.02.19.23.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 23:48:21 -0800 (PST)
Date:   Thu, 20 Feb 2020 07:48:49 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Pavel Machek <pavel@ucw.cz>,
        kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, sre@kernel.org, nekit1000@gmail.com,
        mpartap@gmx.net, merlijn@wizzup.org, martin_rysavy@centrum.cz,
        agx@sigxcpu.org, daniel.thompson@linaro.org, jingoohan1@gmail.com,
        dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com,
        jjhiblot@ti.com
Subject: Re: [PATCH] backlight: add led-backlight driver
Message-ID: <20200220074849.GF3494@dell>
References: <20200219191412.GA15905@amd>
 <20200219194540.GD37466@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200219194540.GD37466@atomide.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, 19 Feb 2020, Tony Lindgren wrote:

> * Pavel Machek <pavel@ucw.cz> [200219 19:15]:
> > From: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > 
> > This patch adds a led-backlight driver (led_bl), which is similar to
> > pwm_bl except the driver uses a LED class driver to adjust the
> > brightness in the HW. Multiple LEDs can be used for a single backlight.
> > 
> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> > Acked-by: Pavel Machek <pavel@ucw.cz>
> > Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> > Acked-by: Lee Jones <lee.jones@linaro.org>
> > Acked-by: Tony Lindgren <tony@atomide.com>
> > Tested-by: Tony Lindgren <tony@atomide.com>
> > Signed-off-by: Pavel Machek <pavel@ucw.cz>
> > ---
> >  drivers/video/backlight/Kconfig  |   7 ++
> >  drivers/video/backlight/Makefile |   1 +
> >  drivers/video/backlight/led_bl.c | 260 +++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 268 insertions(+)
> >  create mode 100644 drivers/video/backlight/led_bl.c
> > 
> > Hi!
> > 
> > Here's the version of the driver I have. AFAICT
> > default-brightness-level handling is ok, so does not need to be
> > changed.
> > 
> > Lee, it would be easiest for me if you could apply it to your tree and
> > push, but given enough time I can push it to Linus, too.
> 
> Oh you're using quoted-printable for patches.. Got it applied now,
> and it still works. Below is also the related dts change that
> I tested with.
> 
> Feel free to pick the dts change too, naturally that should
> not be applied before the driver.
> 
> If you guys instead want me to pick these both into my fixes
> branch, just let me know and I'll do the explaining why these
> are needed as fixes. Basically we no longer have a way to enable
> the LCD backlight for droid4 manually starting with v5.6-rc1
> unlike earlier.

Please do.  You already have my Ack.

--
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
