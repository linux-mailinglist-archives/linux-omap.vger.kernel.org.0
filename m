Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38A7917C5BE
	for <lists+linux-omap@lfdr.de>; Fri,  6 Mar 2020 19:58:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726231AbgCFS6K (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 6 Mar 2020 13:58:10 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:38239 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726083AbgCFS6K (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 6 Mar 2020 13:58:10 -0500
Received: by mail-pj1-f67.google.com with SMTP id a16so1465169pju.3;
        Fri, 06 Mar 2020 10:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/3ZCx8Mk5y6afBQJbD91M79OAuuEzd2TaW08kA7f5KY=;
        b=c9/JHYbHnoaDMHxNuq/i5rixydL75M2u7TZTUwYMaEH8wpqa4/2Glko1W+a+iqSdwn
         K028oePje6EeAIJoA5le77wT+qtnRg9hixyYz9yj3Hv9wBM7OYHgaYR7OLi+npV+Y9B1
         oSBnJSICJhL6mZRSZK1NKIIoQWBdXnVfoRPZIpkcGQK7+WPc51g1J2tQbi0cd2eSvY75
         t/ySuN8HqlWD6EGQc/Dz61xbYe47s2WcHjPMxn6ceCoIBotXx6MUT+oaRq9uR340Zgva
         mWS3nt4Nk/XA2WcPdwcBYDZ5qpXPKoOVbbpVqfjuLXZ8aRhNOrWSQy7V0q78R4FzDPIL
         kZpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/3ZCx8Mk5y6afBQJbD91M79OAuuEzd2TaW08kA7f5KY=;
        b=JH9kMC26EIemOAvmT9oWGcLG8x+b97ItA79jqkSe688ENUiB9pKOI31Kap6Z0wRGw5
         NGVpyOH5r7bzP2c3OBRNjz3u/0jKGjG4vy5DBL33K07bOlC/sXM6uR+gL2jUjG69jlv7
         ga/EigqypXuYQz7eR3zDhQoSVVDs6pl7gM/ScrcAV3yhSyeCURufXNLcW7LhZG2xh/qt
         UIwe/pTXM1VaKl2Gr14Bo/bLrUyCoFER5r5uM+crzXZq+6aMlj+qIe8zMDH7GkW0qrSB
         h16SCde6BYjVBScYdQKo7qwzpFYQ9El+qwigAClG4aZhXB1cdTeL5EnOQa+bv2Q1FGIN
         xR6Q==
X-Gm-Message-State: ANhLgQ1rcTDvGlhlG0iy7ttXFFTNBIOsrulO3fmxJKDkfwPePhBNP1iU
        2mkroqbgnLb04TPJoChW7bk=
X-Google-Smtp-Source: ADFU+vtAPxxg885xqv5i4oOfx3VxR255wgtLVm1r02ZXIJAdR8wVYGcYKAIDbmturb8Dd6qnXUdwuA==
X-Received: by 2002:a17:90b:1947:: with SMTP id nk7mr5007306pjb.92.1583521088464;
        Fri, 06 Mar 2020 10:58:08 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id w81sm23136173pff.22.2020.03.06.10.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2020 10:58:07 -0800 (PST)
Date:   Fri, 6 Mar 2020 10:58:05 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH 1/2] Input: omap4-keypad - Configure interrupt as level
Message-ID: <20200306185805.GF217608@dtor-ws>
References: <20200227020407.17276-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200227020407.17276-1-tony@atomide.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On Wed, Feb 26, 2020 at 06:04:06PM -0800, Tony Lindgren wrote:
> The interrupt should be level high for SoC internal devices.
> Otherwise interrupts may not be seen after a wake-up event.
> 
> Cc: Arthur Demchenkov <spinal.by@gmail.com>
> Cc: Merlijn Wajer <merlijn@wizzup.org>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Sebastian Reichel <sre@kernel.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  drivers/input/keyboard/omap4-keypad.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/keyboard/omap4-keypad.c b/drivers/input/keyboard/omap4-keypad.c
> --- a/drivers/input/keyboard/omap4-keypad.c
> +++ b/drivers/input/keyboard/omap4-keypad.c
> @@ -344,7 +344,8 @@ static int omap4_keypad_probe(struct platform_device *pdev)
>  	}
>  
>  	error = request_threaded_irq(keypad_data->irq, omap4_keypad_irq_handler,
> -				     omap4_keypad_irq_thread_fn, IRQF_ONESHOT,
> +				     omap4_keypad_irq_thread_fn,
> +				     IRQF_TRIGGER_HIGH | IRQF_ONESHOT,

Can't we rely on DT/platform to configure this properly?

Thanks.

-- 
Dmitry
