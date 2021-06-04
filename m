Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B10D239BB12
	for <lists+linux-omap@lfdr.de>; Fri,  4 Jun 2021 16:45:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbhFDOq6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Jun 2021 10:46:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229702AbhFDOq6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 4 Jun 2021 10:46:58 -0400
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84C46C061766;
        Fri,  4 Jun 2021 07:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=dffAPnLk2EQKt/idtjOQOBBmEYeqTi/iMTS2rYi5YIE=; b=R69m74SviFE5CBFZZatkGxasxK
        psfrxq7jvjgeBDxR7p7CMD27Wyvqf6br892wxFXcVNlkOD7lpbavqZr0wymseoj7oEfsd7pliD+Uk
        lXkAml6U5cBX+/vo1Px/QLZlIkBqBJ/k5Wevz3ULCuYlE3yTCVhTcoOFbs/Njqx4dKdc=;
Received: from p200300ccff0b2a001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff0b:2a00:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1lpB4I-0008JE-Cn; Fri, 04 Jun 2021 16:45:06 +0200
Date:   Fri, 4 Jun 2021 16:45:01 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        letux-kernel@openphoenux.org
Subject: Re: [PATCH] usb: musb: Check devctl status again for a spurious
 session request
Message-ID: <20210604164501.5d2f3ce8@aktux>
In-Reply-To: <YLn06uuntThMlaTQ@atomide.com>
References: <20210518150615.53464-1-tony@atomide.com>
        <20210527211501.70d176b4@aktux>
        <YLCGZEan87yp9Eeq@atomide.com>
        <20210604103533.6392beeb@aktux>
        <YLn06uuntThMlaTQ@atomide.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0 (-)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On Fri, 4 Jun 2021 12:39:54 +0300
Tony Lindgren <tony@atomide.com> wrote:

[...]
> Does the following patch fix things for you or does something else break again? :)
> 
It fixes things mostly. If I quickly enter suspend after usb
disconnect, current is still high in suspend (limit approx 2-3 seconds).
But I think this is the right track and these two patches are clearly an
improvement if applied together.

Regards,
Andreas


> Regards,
> 
> Tony
> 
> 8< --------------
> diff --git a/drivers/usb/musb/omap2430.c b/drivers/usb/musb/omap2430.c
> --- a/drivers/usb/musb/omap2430.c
> +++ b/drivers/usb/musb/omap2430.c
> @@ -332,6 +332,7 @@ static int omap2430_probe(struct platform_device *pdev)
>  	glue->musb			= musb;
>  	glue->status			= MUSB_UNKNOWN;
>  	glue->control_otghs = ERR_PTR(-ENODEV);
> +	glue->is_runtime_suspended	= 1;
>  
>  	pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
>  	if (!pdata)
> @@ -453,6 +454,9 @@ static int omap2430_runtime_suspend(struct device *dev)
>  	if (!musb)
>  		return 0;
>  
> +	if (glue->is_runtime_suspended)
> +		return 0;
> +
>  	musb->context.otg_interfsel = musb_readl(musb->mregs,
>  						 OTG_INTERFSEL);
>  
> @@ -474,6 +478,9 @@ static int omap2430_runtime_resume(struct device *dev)
>  	if (!musb)
>  		return 0;
>  
> +	if (!glue->is_runtime_suspended)
> +		return 0;
> +
>  	phy_init(musb->phy);
>  	phy_power_on(musb->phy);
>  

