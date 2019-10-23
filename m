Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97615E2491
	for <lists+linux-omap@lfdr.de>; Wed, 23 Oct 2019 22:28:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733186AbfJWU2N (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 23 Oct 2019 16:28:13 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:33788 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729666AbfJWU2N (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 23 Oct 2019 16:28:13 -0400
Received: by mail-lj1-f194.google.com with SMTP id a22so22532031ljd.0
        for <linux-omap@vger.kernel.org>; Wed, 23 Oct 2019 13:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=T9KQBL6LAJYjkuQGrzhfEUZi7F2d+gu+rzQyfboqTg4=;
        b=f6LOoxDVs4/DvAnaS9H/V3nQ5s19fegLbWq/bDRM0YTRdfAQvVFoGc00O8mT7pPEJV
         5oNprja63HwY/VsxPJqN5QG7bb15/FrYjGoyzSWqlexBDdxghJlpeIPVYDWr8jA9Z01r
         rV577Zj/rzMt9bpw8JSXIpqGLiVsT4XxiySR4VpwUKQEwxYlCEoYJSTIUFGzK+58qUF9
         toVFtJDLNiz9GbpbvTPeIY1V4ZOcWwGZ25gNFYmNMLN/ImsD9wTWsRS60TLj4IxnSHZH
         yqwzRm2TBfOEPy0/Ro51jH0Lif9oNDYFynY/F4CEzcCPqbvwHkau+7c8dqiR8pRXQ6tI
         ZTIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=T9KQBL6LAJYjkuQGrzhfEUZi7F2d+gu+rzQyfboqTg4=;
        b=n61oDk72/3OxTSozz//HhGwNYWtz90JfVlGYGccViTrqJ4axSnB8VUoUoDAyO+KFFA
         83lNpqa/SoEdn5zR8EsUCHWy+tFGBMFlPfyY/6ZYd6RJm3HWdAPLLeYGN1gU0bgN8mg1
         dGSHv+gtlvykvbeQaCxbW+BBnrJJnrzTaUi+99BgJE7F9Ycke9b0lBrswIHK7AGNlune
         iqT8Ad7vuAizvFM+kJeHUhTt2DyUANdw7soKl8f69nMDOK3De1GKjj00ENA6DFYbhF9l
         PPY5nX5x3EgfueLlCrottfcvfCbRcRua2jFvJH23TJ9czWkwERNWP8DZnt++oywW+Tyi
         hrjw==
X-Gm-Message-State: APjAAAVIi9PmLK7LcwETvinS4AY8N0QCQqglsNLbFqdn6kvTI8wlLjvr
        /9/V7tyOx8k0TGgSzbar7Z/gDw==
X-Google-Smtp-Source: APXvYqxSodDem2VxJeSULsc2yK6A+yLio7NbpdwoWeMo0EQlIIPFpuUhQtRJJpl2pfHB2OL5yzoJcg==
X-Received: by 2002:a05:651c:106b:: with SMTP id y11mr7541430ljm.123.1571862489642;
        Wed, 23 Oct 2019 13:28:09 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id r12sm9386450lfp.63.2019.10.23.13.28.08
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2019 13:28:08 -0700 (PDT)
Date:   Wed, 23 Oct 2019 13:22:47 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Tony Lindgren <tony@atomide.com>
Cc:     soc@kernel.org, arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 1/2] omap2plus_defconfig changes for v5.5
Message-ID: <20191023202247.wb2jzwvek7u5korx@localhost>
References: <pull-1571853258-16998@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pull-1571853258-16998@atomide.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Oct 23, 2019 at 10:54:48AM -0700, Tony Lindgren wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit 96d49bbfe6c1a6bb43ccd00fb87aca100e32e5e2:
> 
>   ARM: omap2plus_defconfig: Fix selected panels after generic panel changes (2019-10-03 09:44:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.5/defconfig-signed
> 
> for you to fetch changes up to ec2b31267263cd7d5a7567d315f839796c2a8c87:
> 
>   configs: omap2plus: Enable VIDEO_MT9P031 module (2019-10-22 09:11:03 -0700)
> 
> ----------------------------------------------------------------
> Defconfig changes for omap2plus_defconfig for v5.5
> 
> A series of changes from Adam Ford to update for removed and moved items,
> and then enable crypto devices and MT9P031 video as loadable modules.
> 
> Looks like I missed unifying the subject line for one commit, but I did
> not want to mess with the commit after pushing it out.
> 
> ----------------------------------------------------------------
> Adam Ford (4):
>       ARM: omap2plus_defconfig: Update for removed items
>       ARM: omap2plus_defconfig: Update for moved item
>       ARM: omap2plus_defconfig: Enable HW Crypto engine modules
>       configs: omap2plus: Enable VIDEO_MT9P031 module

Looks like this branch had a minor conflict with one of your fixes branches.
Easy to patch up, but feel free to use your fixes as a base for the topics if
needed.


-Olof
