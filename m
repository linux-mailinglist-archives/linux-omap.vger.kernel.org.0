Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74C0A271F82
	for <lists+linux-omap@lfdr.de>; Mon, 21 Sep 2020 11:59:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726477AbgIUJ7R (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 21 Sep 2020 05:59:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726358AbgIUJ7Q (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 21 Sep 2020 05:59:16 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D2FEC0613CF
        for <linux-omap@vger.kernel.org>; Mon, 21 Sep 2020 02:59:16 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id o8so16803625ejb.10
        for <linux-omap@vger.kernel.org>; Mon, 21 Sep 2020 02:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sl8uGkOUAXH9GoQjx9V+JkGylxwKYdt19btYfKxLbmw=;
        b=mnoq6BMhUMKYHNjZLAhOQC5sz2iGfzQxNEvmCunoDgFntNgGc7N1PxAKKBdqnAaFyk
         cfdOwPpq8pXxnJh/d+BGplVMxlXtQg5cRRr4R97rHYN0w/g7M8k9q/ndCWF5bsntgw5r
         cgI2vgLNKHnGWQyBjNFkIKZXcFEra3O0awGEIvA/sTpxFWQrKzanm1JwQmDw/u74vRA8
         ZNINbJTxS8atLiTnmFpxj+eI6lBUPe7TYseFLMNN8le+1ENVRig0jmgvojBIZUqt4Z1Z
         ZmUyg/k2STu11/eNalBHkwiXgkeAJQJPdw4hufpBjKXNU5REWPdFkIBhF0LJPoen+M7V
         VqXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sl8uGkOUAXH9GoQjx9V+JkGylxwKYdt19btYfKxLbmw=;
        b=KQuPrBfah4kyZIzRvZi6Sx/vfyITJO5QqOjxfgOEciDuNnn3tsEKb8B5a9TrH//Nhy
         6tl/2x7IJaZ4W7Nyfj8H4ubCMYbO9UZGc1Wd5Wzfw23PF19uw5BZeBBUMQbDcAn5RZ2D
         uODzyTrteIaRCd8Wt+cPYmo4ul/gp/Yk3qY9rrRM8CYG0ibHe1OTfk3FjYsBVRLsqP3/
         ykUbA215QTg8K2lunsF2ZZjdr/b2cpWkcZKRwX2HHczu/ULQGSt9FKf261u3anY61V3p
         6IIuZOfFdzgUgd+PI+w55uDAOYo2avUhqthROT4i1C3/t2W2hbWT1N0hawFHYZ2if661
         MN6A==
X-Gm-Message-State: AOAM532oqSJ8ICIWCBlLCHisIlnkIc64LamggV9qgn+wBECorDn8+FRz
        0RhM7cQ/3FXvgAdw0fvml3v8Uw==
X-Google-Smtp-Source: ABdhPJwV2XZWvXBk31Ggd3Mw92swsNCTa+hfyEth2y1cYI1jCOhFVLvWbHjmNeuzBB83LG6KVU/cDw==
X-Received: by 2002:a17:906:2e14:: with SMTP id n20mr50204929eji.214.1600682355019;
        Mon, 21 Sep 2020 02:59:15 -0700 (PDT)
Received: from x1 ([2001:16b8:5c50:7f01:652a:68b1:4040:26de])
        by smtp.gmail.com with ESMTPSA id i26sm8303203edq.47.2020.09.21.02.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 02:59:14 -0700 (PDT)
Date:   Mon, 21 Sep 2020 11:59:12 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        Trent Piepho <tpiepho@gmail.com>,
        Christina Quast <cquast@hanoverdisplays.com>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: am335x: guardian: switch to AM33XX_PADCONF
Message-ID: <20200921095912.GA3752675@x1>
References: <20200919195159.3126193-1-drew@beagleboard.org>
 <20200921064707.GN7101@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200921064707.GN7101@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Sep 21, 2020 at 09:47:07AM +0300, Tony Lindgren wrote:
> * Drew Fustini <drew@beagleboard.org> [200919 19:53]:
> > Change the pin defintions from AM33XX_IOPAD to AM33XX_PADCONF macro so
> > that it correctly handles changes to #pinctrl-cells.
> 
> Thanks for fixing this. I wonder if we should now also change the define
> for the old AM33XX_IOPAD macro?
> 
> Or just remove it completely and mention that we've changed nr-pinctrl-cells
> to use 3 now?
> 
> Otherwise the unknown number of out-of-tree boards will be hitting this
> too.
> 

Christina Quast commented in f1ff9be7652b ("ARM: dts: am33xx: Added 
AM33XX_PADCONF macro") that AM33XX_IOPAD() was left in place to avoid
breaking boards not in mainline.

If we follow that logic, then I think that fixing AM33XX_IOPAD() for
#pinctrl-cells = <2> would be the correct solution.

Would this be acceptable?

#define AM33XX_IOPAD(pa, val)          OMAP_IOPAD_OFFSET((pa), 0x0800) (val) (0)


thanks,
drew

