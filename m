Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 611936623FE
	for <lists+linux-omap@lfdr.de>; Mon,  9 Jan 2023 12:17:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233339AbjAILQt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Jan 2023 06:16:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233730AbjAILQ3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Jan 2023 06:16:29 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2293415F31
        for <linux-omap@vger.kernel.org>; Mon,  9 Jan 2023 03:16:27 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id g10so6004342wmo.1
        for <linux-omap@vger.kernel.org>; Mon, 09 Jan 2023 03:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IGLyI5wEcgXuRG4qKgW9nkQD5uda7Ch20RGMOQU2FOU=;
        b=BpjMQVSSiInIzATUSKHKx/TB0PAgHuhGpwqrg0yOvpFaOf45mvS+GWvnx67CEXA3H3
         OpJ86BZFVR7wQA+dlKnprx63GQ+n3TtIT3gNtfcwYquJrtGnekG3nzORos283svZUVJ1
         gD/voD8Adfh6f/kRlsfptOQ3FzAtRI57WQUlj9somGfISffT5ucUlRw1oEWN9hMSp8+8
         7Ymx/sq7ntQJ876T0aADIjQ39k6t/AHX2eKWzPuJzBVyDGLq9X87LBaBoOHW3GDSWjSu
         LM5WVxU8BDTwndJbIqjxOt9sHE+yUYYLgWXJYDdzFtoZBGdEV5Y6eR7kko+fa21emUGA
         j1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IGLyI5wEcgXuRG4qKgW9nkQD5uda7Ch20RGMOQU2FOU=;
        b=Fl4P5WuYgCPxTcAwPOYADjo0FZL8U4QPUA6tKP1TNs1yHQ8HkkZOapWssSGE0PHQJW
         iH9Tb3I1BRF1NhqbOXYYVUDBos2KSRf0WZcB9BBCyD8ci+0Bvmol7DUfjwtC2QZH9nnW
         IyHAzYBasG6hh3G3Sdl5JSU/uQpF5phhVK5ykehXeYOgI74atps8ErCjWsoIxc6kGol5
         2DuzcGi/SYQUsDZxigRaKs82hXiMhRUzUOLuozk+MNKVOXKWgEZywAP9BE+sV3yTGWqb
         ed+KI1dog6QkK5n3aTxhNx/PD+e4gANYklxieu0/m3KhwHhn/sBoHqX17EV6fg4DhqzR
         a5gg==
X-Gm-Message-State: AFqh2koZ7Ks51P/HJ4TpZWsB0X9pBYiUNgn0edM4wbeY8bBPEBOY9sWM
        RzDdrxqrUs/fp/ooFE0JCIGHew==
X-Google-Smtp-Source: AMrXdXsoSB+aT78r/3TNZt8Dgl5bAgKCniDPaEeXXf//BrSKda/Imn7sAaZR+/qS1mLHNKNpC03pvA==
X-Received: by 2002:a05:600c:4a90:b0:3d2:3ae8:886a with SMTP id b16-20020a05600c4a9000b003d23ae8886amr49681406wmp.17.1673262985605;
        Mon, 09 Jan 2023 03:16:25 -0800 (PST)
Received: from aspen.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id u21-20020a7bc055000000b003d9aa76dc6asm18341780wmc.0.2023.01.09.03.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 03:16:24 -0800 (PST)
Date:   Mon, 9 Jan 2023 11:16:22 +0000
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Stephen Kitt <steve@sk2.org>,
        Sam Ravnborg via B4 Submission Endpoint 
        <devnull+sam.ravnborg.org@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-staging@lists.linux.dev,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Antonino Daplas <adaplas@gmail.com>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Robin van der Gracht <robin@protonic.nl>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        linuxppc-dev@lists.ozlabs.org,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH 09/15] staging: fbtft: fb_ssd1351.c: Introduce
 backlight_is_blank()
Message-ID: <Y7v3hgcyGpXdlJcE@aspen.lan>
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
 <20230107-sam-video-backlight-drop-fb_blank-v1-9-1bd9bafb351f@ravnborg.org>
 <20230108202817.7890f85c@heffalump.sk2.org>
 <Y7sntztwrNqw41+i@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7sntztwrNqw41+i@ravnborg.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sun, Jan 08, 2023 at 09:29:43PM +0100, Sam Ravnborg wrote:
> Hi Stephen,
>
> On Sun, Jan 08, 2023 at 08:28:17PM +0100, Stephen Kitt wrote:
> > On Sat, 07 Jan 2023 19:26:23 +0100, Sam Ravnborg via B4 Submission Endpoint
> > <devnull+sam.ravnborg.org@kernel.org> wrote:
> >
> > > From: Sam Ravnborg <sam@ravnborg.org>
> > >
> > > Avoiding direct access to backlight_properties.props.
> > >
> > > Access to the deprecated props.fb_blank replaced by backlight_is_blank().
> > > Access to props.power is dropped - it was only used for debug.
> > >
> > > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > > Cc: Stephen Kitt <steve@sk2.org>
> > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Cc: Daniel Thompson <daniel.thompson@linaro.org>
> > > Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > Cc: linux-fbdev@vger.kernel.org
> > > ---
> > >  drivers/staging/fbtft/fb_ssd1351.c | 9 +++------
> > >  1 file changed, 3 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/staging/fbtft/fb_ssd1351.c
> > > b/drivers/staging/fbtft/fb_ssd1351.c index b8d55aa8c5c7..995fbd2f3dc6 100644
> > > --- a/drivers/staging/fbtft/fb_ssd1351.c
> > > +++ b/drivers/staging/fbtft/fb_ssd1351.c
> > > @@ -190,15 +190,12 @@ static struct fbtft_display display = {
> > >  static int update_onboard_backlight(struct backlight_device *bd)
> > >  {
> > >  	struct fbtft_par *par = bl_get_data(bd);
> > > -	bool on;
> > > +	bool blank = backlight_is_blank(bd);
> > >
> > > -	fbtft_par_dbg(DEBUG_BACKLIGHT, par,
> > > -		      "%s: power=%d, fb_blank=%d\n",
> > > -		      __func__, bd->props.power, bd->props.fb_blank);
> > > +	fbtft_par_dbg(DEBUG_BACKLIGHT, par, "%s: blank=%d\n", __func__,
> > > blank);
> > > -	on = !backlight_is_blank(bd);
> > >  	/* Onboard backlight connected to GPIO0 on SSD1351, GPIO1 unused */
> > > -	write_reg(par, 0xB5, on ? 0x03 : 0x02);
> > > +	write_reg(par, 0xB5, !blank ? 0x03 : 0x02);
> > >
> > >  	return 0;
> > >  }
> > >
> > > --
> > > 2.34.1
> >
> > For debugging purposes here, would there be any point in logging props.state?
> > As in
> >
> >         fbtft_par_dbg(DEBUG_BACKLIGHT, par,
> > -                     "%s: power=%d, fb_blank=%d\n",
> > -                     __func__, bd->props.power, bd->props.fb_blank);
> > +                     "%s: power=%d, state=%u\n",
> > +                     __func__, bd->props.power, bd->props.state);
>
> Thanks for the suggestion - and the reviews!
>
> I was tempted to just remove the debugging.
> If we require debugging, then this could be added in the backlight core,
> thus everyone would benefit from it.

I had the same instinct to remove the debug print here (esp. ones with
__func__ in them) but I think that's probably a much more widely scoped
clean up for fbtft ;-).

On that basis:
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
