Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8055417C5FA
	for <lists+linux-omap@lfdr.de>; Fri,  6 Mar 2020 20:10:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726171AbgCFTKZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 6 Mar 2020 14:10:25 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:42869 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725873AbgCFTKZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 6 Mar 2020 14:10:25 -0500
Received: by mail-pl1-f194.google.com with SMTP id u3so1240121plr.9;
        Fri, 06 Mar 2020 11:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=oMZcTKmZsDyhLqYK1fx0XvAdxLRsq9ElXtGdsl72qak=;
        b=N/Wns6Jp3DRxwYjftfFCBD4F8DRHzLrzv/zX67fpdV0IPhcTur0o5eWBI0cLUQt5ih
         FgjSFoIQOI163O12QArTLE5UzRTgkRW6AWTyjGelcrZ3LAYreaOvqCLntQq5weHT/VjD
         mQ/YAGVTXd0XQtDpH0XME9a9n9IjzuoqSKz8TdAJOjE6myf3Pjp20hzKmBU0JZdJeOmE
         3zGdSR6W8fTPvoLD6EobzP9jy5yrpR+4c9zH6y+Fu4bG0zSMYd/MkKxwCuEgOkhkUIm0
         z0a7gyb9QfLdptOMl1KUDbVlfsS8Q9x9XZkyZj8uuCmZ4wHNZRdNzwUQhemHs7uWrKxJ
         S5PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=oMZcTKmZsDyhLqYK1fx0XvAdxLRsq9ElXtGdsl72qak=;
        b=UXs+WWugsmdWXFDMBm/vd+GcXYzP/cgCigWTwPJaCvbIhv+pix6oyBIoinKpaDDOco
         ZvrQAiGEK1/iZN48sJUGHjoeitdo28fEDmYZeiLpEHq1N/NxgDuQz/hrxGuCZ6edmqhk
         vvHBKkG9b2TnSbuxBAcBC3Wdt854oyO7jRAprgJd5nVBeZtyeyn5+vw7kXxHQnEGa7+I
         6Dxban8GvTa2QoFML+uyKPE+hs358htBrdSZvx3x/G+/hZvRM1pAmGinwnXFlM6KQDMT
         rqii6hcfB9L8qcjcOIxTqE8Uf2xC+f78Oc4jDgS9cX3JoBF84Cr80hiky4Rpm2I9kMYL
         6yMQ==
X-Gm-Message-State: ANhLgQ25PmYEgwenP3Mdx+PWoE+u/tVPix6Ulm8oPyYKOcxEbNU52oOn
        Yl7NaEY8vo9E6IJAMiSaUW+bqpfC
X-Google-Smtp-Source: ADFU+vuQ6S7GEwKDEbiUD7ol+gheaI8Xr37RWwyCubGvEqiXc6TpibvEZms8x8PGu7JY1gPv0fomuA==
X-Received: by 2002:a17:90a:8d86:: with SMTP id d6mr5115534pjo.119.1583521824264;
        Fri, 06 Mar 2020 11:10:24 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id u23sm36216467pfm.29.2020.03.06.11.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2020 11:10:23 -0800 (PST)
Date:   Fri, 6 Mar 2020 11:10:21 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>, ruleh <ruleh@gmx.de>
Subject: Re: [PATCH 3/3] Input: omap4-keypad - check state again for lost
 key-up interrupts
Message-ID: <20200306191021.GH217608@dtor-ws>
References: <20200228171223.11444-1-tony@atomide.com>
 <20200228171223.11444-4-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200228171223.11444-4-tony@atomide.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Feb 28, 2020 at 09:12:23AM -0800, Tony Lindgren wrote:
> We only have partial errata i689 implemented with Commit 6c3516fed7b6
> ("Input: omap-keypad - fix keyboard debounce configuration"). We are
> still missing the check for lost key-up interrupts as described in the
> omap4 silicon errata documentation as Errata ID i689 "1.32 Keyboard Key
> Up Event Can Be Missed":
> 
> "When a key is released for a time shorter than the debounce time,
>  in-between 2 key press (KP1 and KP2), the keyboard state machine will go
>  to idle mode and will never detect the key release (after KP1, and also
>  after KP2), and thus will never generate a new IRQ indicating the key
>  release."
> 
> Let's check the keyboard state with delayed_work after each event. And
> if the problem state is detect, let's clear all events.
> 
> Cc: Arthur Demchenkov <spinal.by@gmail.com>
> Cc: Merlijn Wajer <merlijn@wizzup.org>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Sebastian Reichel <sre@kernel.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  drivers/input/keyboard/omap4-keypad.c | 56 ++++++++++++++++++++++++---
>  1 file changed, 50 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/input/keyboard/omap4-keypad.c b/drivers/input/keyboard/omap4-keypad.c
> --- a/drivers/input/keyboard/omap4-keypad.c
> +++ b/drivers/input/keyboard/omap4-keypad.c
> @@ -71,6 +71,8 @@ struct omap4_keypad {
>  	void __iomem *base;
>  	bool irq_wake_enabled;
>  	unsigned int irq;
> +	struct delayed_work key_work;
> +	struct mutex lock;		/* for key scan */

I think having threaded interrupt and delayed work together defeats the
purpose of having threaded interrupt. If you want to add a delay before
repeating scan I think you can add it directly in
omap4_keypad_irq_thread_fn(). Or is there a concern that we will not
rely quickly enough on additional key presses? It is unclear to me if
additional key press within the debounce time will result in additional
interrupt.

Thanks.

-- 
Dmitry
