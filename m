Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C530211FB9D
	for <lists+linux-omap@lfdr.de>; Sun, 15 Dec 2019 23:03:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726351AbfLOWDh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 15 Dec 2019 17:03:37 -0500
Received: from mail.andi.de1.cc ([85.214.55.253]:46694 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726260AbfLOWDh (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 15 Dec 2019 17:03:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=j61D3HGEJXdBDHMeL0WoNw5Ytq0J/SM0rRu+UJnmkj4=; b=SWE01EqywgiRXpRhLnUihSrKpi
        IeLkqnORO0u2YszBzlaHaCI18N8rcW1PHoh+U8soCb3zIxm5oXL/0asUhLI1dsVqOlTttQWPc1YFg
        vadaJDie+Ny3Ia4EbnQOgLt8gfCFljWkAWkAHqMHltHzO5PjKinGVkBwRLyC/zNe34nY=;
Received: from p200300ccff4bb7001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff4b:b700:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1igbzA-0004oC-8T; Sun, 15 Dec 2019 23:03:32 +0100
Date:   Sun, 15 Dec 2019 23:03:31 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Evgeniy Polyakov <zbr@ioremap.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        Adam Ford <aford173@gmail.com>,
        "Andrew F . Davis" <afd@ti.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Vignesh R <vigneshr@ti.com>
Subject: Re: [PATCH] w1: omap-hdq: Simplify driver with PM runtime
 autosuspend
Message-ID: <20191215230331.645b9064@aktux>
In-Reply-To: <20191215173817.47918-1-tony@atomide.com>
References: <20191215173817.47918-1-tony@atomide.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0 (-)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sun, 15 Dec 2019 09:38:17 -0800
Tony Lindgren <tony@atomide.com> wrote:

> We've had generic code handling module sysconfig and OCP reset registers
> for omap variants for many years now and all the drivers really needs to
> do is just call runtime PM functions.
> 
> Looks like the omap-hdq driver got only partially updated over the years
> to use runtime PM, and still has lots of custom PM code left.
> 
> We can replace all the custom code for sysconfig, OCP reset, and PM with
> just a few lines of runtime PM autosuspend code.
> 
> Note that the earlier driver specific usage count limit of four seems
> completely artificial and should not be an issue in normal use.
> 
> Cc: Adam Ford <aford173@gmail.com>
> Cc: Andrew F. Davis <afd@ti.com>
> Cc: Andreas Kemnade <andreas@kemnade.info>
> Cc: H. Nikolaus Schaller <hns@goldelico.com>
> Cc: Vignesh R <vigneshr@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
> 
> 
> Can you guys please review and and test on gta04 and torpedo?
> 
[...]
>  
> -static int _omap_hdq_reset(struct hdq_data *hdq_data)
> -{
> -	int ret;
> -	u8 tmp_status;
> -
> -	hdq_reg_out(hdq_data, OMAP_HDQ_SYSCONFIG,
> -		    OMAP_HDQ_SYSCONFIG_SOFTRESET);
> -	/*
> -	 * Select HDQ/1W mode & enable clocks.
> -	 * It is observed that INT flags can't be cleared via a read and GO/INIT
> -	 * won't return to zero if interrupt is disabled. So we always enable
> -	 * interrupt.
> -	 */

If I remember correctly this thing is critical to get the hwmod out of
reset but I need to examine that again:

> -	hdq_reg_out(hdq_data, OMAP_HDQ_CTRL_STATUS,
> -		OMAP_HDQ_CTRL_STATUS_CLOCKENABLE |
> -		OMAP_HDQ_CTRL_STATUS_INTERRUPTMASK);
> -
> -	/* wait for reset to complete */
> -	ret = hdq_wait_for_flag(hdq_data, OMAP_HDQ_SYSSTATUS,
> -		OMAP_HDQ_SYSSTATUS_RESETDONE, OMAP_HDQ_FLAG_SET, &tmp_status);
> -	if (ret)
> -		dev_dbg(hdq_data->dev, "timeout waiting HDQ reset, %x",
> -				tmp_status);
> -	else {
> -		hdq_reg_out(hdq_data, OMAP_HDQ_CTRL_STATUS,
> -			OMAP_HDQ_CTRL_STATUS_CLOCKENABLE |
> -			OMAP_HDQ_CTRL_STATUS_INTERRUPTMASK |
> -			hdq_data->mode);
> -		hdq_reg_out(hdq_data, OMAP_HDQ_SYSCONFIG,
> -			OMAP_HDQ_SYSCONFIG_AUTOIDLE);
> -	}
> -
> -	return ret;
> -}

I will probably do more testing the next days.

Regards,
Andreas
