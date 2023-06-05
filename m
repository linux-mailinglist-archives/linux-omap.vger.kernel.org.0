Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4BEC723131
	for <lists+linux-omap@lfdr.de>; Mon,  5 Jun 2023 22:23:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232262AbjFEUXO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 5 Jun 2023 16:23:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231610AbjFEUXN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 5 Jun 2023 16:23:13 -0400
Received: from mailrelay1-1.pub.mailoutpod2-cph3.one.com (mailrelay1-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:400::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33C1FF3
        for <linux-omap@vger.kernel.org>; Mon,  5 Jun 2023 13:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=rsa1;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=0rP9lW70v0x0iAyjZ8eGEFTz23i8tjg2WhkGDwg84CM=;
        b=pf6XrMwUsZvTHmwUtpACAPjSvDU9fxXr8pUaFTJyPWQke9OwaCVk8f4jKzLYOOTTM1UypKIMCY3ok
         CHtGVkJSBM255frbHSJlsA5Ym8YtL/nCH9lbqjEjwske0i0EvLOKjDXFKlCArYyt+yCgKSgTBH8A/w
         yuLYYeS5AFX0mywAA4px3xN8/0gW0gZaHtK36fcppyaWhqVb5WBapA8VdsO9yCXsMO9u6z5rDeSCb2
         dkLu8tK7I5+QRe3tBdb6EQ8yZEiW5vvnscAGSzNHlbMby6wY3QJdbYFcQynmFBMYrU78RS+UdJLtM2
         wPx3PglED4vx0iGHAgsazwlJdS66NGw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
        d=ravnborg.org; s=ed1;
        h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
         from:date:from;
        bh=0rP9lW70v0x0iAyjZ8eGEFTz23i8tjg2WhkGDwg84CM=;
        b=H6HLfhIx9eZVBqFxNaSEk4VDVgqlXBMz76k7JenCUo0lDDIvfrLUtnEGwuHgFwgtRSqfcRJKlzuoC
         4cSK0E6BQ==
X-HalOne-ID: c826bbbd-03de-11ee-a08d-99461c6a3fe8
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
        by mailrelay1 (Halon) with ESMTPSA
        id c826bbbd-03de-11ee-a08d-99461c6a3fe8;
        Mon, 05 Jun 2023 20:23:08 +0000 (UTC)
Date:   Mon, 5 Jun 2023 22:23:07 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     "Ruhl, Michael J" <michael.j.ruhl@intel.com>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        "daniel@ffwll.ch" <daniel@ffwll.ch>,
        "javierm@redhat.com" <javierm@redhat.com>,
        "deller@gmx.de" <deller@gmx.de>,
        "geert+renesas@glider.be" <geert+renesas@glider.be>,
        "lee@kernel.org" <lee@kernel.org>,
        "daniel.thompson@linaro.org" <daniel.thompson@linaro.org>,
        "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
        "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
        Rich Felker <dalias@libc.org>,
        "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
        "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Subject: Re: [PATCH 02/30] backlight/gpio_backlight: Compare against struct
 fb_info.device
Message-ID: <20230605202307.GA452402@ravnborg.org>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-3-tzimmermann@suse.de>
 <IA1PR11MB641847841A33FE16F9B96BA7C14DA@IA1PR11MB6418.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA1PR11MB641847841A33FE16F9B96BA7C14DA@IA1PR11MB6418.namprd11.prod.outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Michael.

> >
> >Fixes a bug in the backlight driver and prepares fbdev for making
> >struct fb_info.dev optional.
> 
> I only see a rename from fbdev  to dev...
> 
> Is there missing code?
> 
> Would  a fixes: be useful?
> 
> M
> 
> >@@ -35,7 +35,7 @@ static int gpio_backlight_check_fb(struct
> >backlight_device *bl,
> > {
> > 	struct gpio_backlight *gbl = bl_get_data(bl);
> >
> >-	return gbl->fbdev == NULL || gbl->fbdev == info->dev;
> >+	return !gbl->dev || gbl->dev == info->device;
> > }

The real change is here where info->dev is replaced by info->device.

	Sam
