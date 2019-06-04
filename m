Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF2C634376
	for <lists+linux-omap@lfdr.de>; Tue,  4 Jun 2019 11:44:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727083AbfFDJoS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 4 Jun 2019 05:44:18 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:50372 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727008AbfFDJoS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 4 Jun 2019 05:44:18 -0400
Received: by mail-wm1-f67.google.com with SMTP id f204so10123815wme.0
        for <linux-omap@vger.kernel.org>; Tue, 04 Jun 2019 02:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=EoTFirwkcUMGV6qEYqMa/Ij3w52n1eYJPvzktcK+OLg=;
        b=HeDoLn3rdeogRQmYnMHPU/ZmC8Zb/kA5VmsXkWoAfW7fOX84gcuM1GskRKYU45Mrst
         JsS4AV6TltPnUNef3NilScWqDZ42WRFYwtz+wwz+yHC/pqx/h7YJGFoAfAbBtoBiKn4o
         x+Yt3eda0kzwZES9kgjq43HnwCGmS1XoDdVJEJgM9EvWfob+IV4ZnYdE80iVA6+WNF4r
         JoDLDwMY2RJyA2FEVnF1NdFFTOxaXfnceQlRToSK8RZF0bom3V7+vynObpNf0Qsl0PCI
         ijUi5i5jgh7aqpxcnuh7o+ht/igy6ir3Yn146yt80wfEdQ7AFeK9esF0vKFx0cb7CHMT
         UjDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=EoTFirwkcUMGV6qEYqMa/Ij3w52n1eYJPvzktcK+OLg=;
        b=SjwxnotFGh/zV2Oh45hNOGktTYiWmtzOsTrEdOUHJwtUNB/WtE321lbQgCwehp2cCc
         BNZ8zMtG75+Nm6bhA/se0w+xWkJUa8hzsL6ozXEDkmcb/7lb17JbHltO6IE1jFdDiW+b
         ik/7NtJUO7RLHz8GUyHCWTq5xdHUDeJGBbl0o4r0f7PFZ0o7LWDYDuZc+hTxnBoh/q0m
         +6obUsH4Jj5H1bQ5pNkPHMVYKEeZz6T4eCYEdVK55kwOn8ycmTDd+jc7d8EC3nmCZjQm
         ZnVLdxIHnYGz2VfbFAZFeL+fcjW2pUgdKAfsUfMSWM3p9RMeVmM46eBdm9GCtIRzcqxC
         2teQ==
X-Gm-Message-State: APjAAAXFnAERQaBNnBiBXxAKhQotmr6NRvxHy+ZRL51GZCh6ie6nOfe3
        MsTlayZfP3/cPT8e4CURb3Q=
X-Google-Smtp-Source: APXvYqylyF3vA0f1qgs1OvwYGret4IAxdCHBlxIbs8Z8mlOYygcjNNXipPZP4rfcmoux3aXf3Ve5rw==
X-Received: by 2002:a05:600c:2182:: with SMTP id e2mr13342957wme.55.1559641456303;
        Tue, 04 Jun 2019 02:44:16 -0700 (PDT)
Received: from Red ([2a01:cb1d:147:7200:2e56:dcff:fed2:c6d6])
        by smtp.googlemail.com with ESMTPSA id k66sm6004001wmb.34.2019.06.04.02.44.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Jun 2019 02:44:15 -0700 (PDT)
Date:   Tue, 4 Jun 2019 11:44:13 +0200
From:   Corentin Labbe <clabbe.montjoie@gmail.com>
To:     Aaro Koskinen <aaro.koskinen@iki.fi>
Cc:     Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        qemu-devel@nongnu.org
Subject: Re: Running linux on qemu omap
Message-ID: <20190604094413.GB15484@Red>
References: <20190520190533.GA28160@Red>
 <20190521232323.GD3621@darkstar.musicnaut.iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190521232323.GD3621@darkstar.musicnaut.iki.fi>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, May 22, 2019 at 02:23:23AM +0300, Aaro Koskinen wrote:
> Hi,
> 
> On Mon, May 20, 2019 at 09:05:33PM +0200, Corentin Labbe wrote:
> > Hello
> > 
> > I am working on adding a maximum set of qemu machine on kernelCI.
> 
> That's cool.
> 
> > For OMAP, five machine exists and I fail to boot any of them.
> 
> Which machines?
> 
> > The maximum I can get with omap1_defconfig is
> > qemu-system-arm -kernel zImage -nographic -machine cheetah -append 'root=/dev/ram0 console=ttyO0'
> > Uncompressing Linux... done, booting the kernel.
> > then nothing more.
> 
> It's known that omap1_defconfig doesn't work well for QEMU or
> "multi-board" usage. Perhaps the kernel size is now just too big?
> I'm using a custom config for every OMAP1 board anyway...
> 
> > Does someone have a working config+version to share ?
> 
> I have used the below config for OMAP1 SX1 board (the only one I got
> working with QEMU). Unfortunately the functionality is quite limited,
> but it still allows to run e.g. GCC bootstrap & testsuite, that is rare
> nowadays for armv4t.
> 
> I'm using the following command line with qemu-system-arm 3.1.0:
> 
>         -M sx1 \
>         -kernel "sx1-zImage" \
>         -nographic \
>         -drive file="sx1-mmc",if=sd,format=raw \
>         -no-reboot
> 
> This should work with v5.1 kernel.
> 
> I'm also interested to run other OMAP kernels under QEMU, e.g. cheetah
> (the real device, Palm TE works OK with the current mainline), and it
> would be interesting to know why QEMU/kernel has regressed...
> 

Thanks, with your config as starting point, I was able to boot both sx1 and cheetah

So I now use the omap1_defconfig and the only trick is to disable CONFIG_CPU_DCACHE_WRITETHROUGH.
I need also to disable CONFIG_FB for cheetah to works.

Regards
