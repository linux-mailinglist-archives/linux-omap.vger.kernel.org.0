Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6E73DD7A2
	for <lists+linux-omap@lfdr.de>; Sat, 19 Oct 2019 11:12:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728560AbfJSJMB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 19 Oct 2019 05:12:01 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36327 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725797AbfJSJMA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 19 Oct 2019 05:12:00 -0400
Received: by mail-wm1-f66.google.com with SMTP id m18so8236512wmc.1;
        Sat, 19 Oct 2019 02:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+LSfVcGVgC2SgP+Cklux+YdmwHzIVlEqLbQ9PbRxrCg=;
        b=CeWcpr6NT8ySjUyYXyaxdJuNWlxeqsR23HWvVpfZAYYVwszdHchrTotikgKwz/A5gc
         6EI61leoFAqj+lUg0s5q6g5dHFRcGa4uxeeKPdwMt4DzLNJp9hF0HMv4DNxjWhT0BI3T
         /+9QVX78U2Lj3lnlbOmibWKjsKL7JgXoc6Ffs3fVHDtdi4kulpzJsitGtzu4f2DWFuyI
         A9JCqe694gIJSetB7O13NSGUhGUdfj1Q04rOV4xeeam7IOnV+pm7GsNZH/gkcdZ4bx9O
         r4JPSKL1RCKNjA0WJS/UqP+k0RWvi9c8Leb8pmKm/d65oFvERfMpvL2j22jRoEsc1kuK
         bp5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+LSfVcGVgC2SgP+Cklux+YdmwHzIVlEqLbQ9PbRxrCg=;
        b=FwIqMlo7xQRFw4BtaDU1siQH+N3Wff7wqjJx9D0Lmql0bG/nPqEOUoh/0Wo9PsF9JC
         oBetIurAvoZQB54rQvMdKf7pUxbIbX3ocmtqve5sZSWHdsCHqZ2EM3AtYH+cnlGkZY7T
         tF9HBfoKdNdNFiNCYkusCYQFxQRW+O9BOUQkSjbGVgSxQmDV0vf6b23l36OhE+JWUpXc
         jRvW66zICkIzpaPsVixXQ3epiGNfDE2egyMfE/+9l0dkaItIRSXo0Ve0xpFaoaDJEvmS
         ufOLPotW4FyFzfSh0FEcp38wMhWoM3GEACyFPKgXI6VcdFOlyUl+/LDZuxU6+KWfV0Gq
         M3qw==
X-Gm-Message-State: APjAAAWnafYPvyaSxAnq7GZ9epdiuzKF7roLi8NaXrfJd6sq1oicpNyr
        +HIrtg5mJrCTjqQeGPMEfATDS/bGey0=
X-Google-Smtp-Source: APXvYqyDsmrzv4Z1LGUFeuwlx9LTPnznWL1nXliIIrNPSfZ1mxs55/yuuVKfkVko8zJsU0ET6HYBKQ==
X-Received: by 2002:a1c:2d4d:: with SMTP id t74mr10508690wmt.108.1571476316579;
        Sat, 19 Oct 2019 02:11:56 -0700 (PDT)
Received: from debian (host-78-144-219-162.as13285.net. [78.144.219.162])
        by smtp.gmail.com with ESMTPSA id m16sm6785683wml.11.2019.10.19.02.11.55
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 19 Oct 2019 02:11:56 -0700 (PDT)
Date:   Sat, 19 Oct 2019 10:11:54 +0100
From:   Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To:     Joe Perches <joe@perches.com>
Cc:     Ladislav Michl <ladis@linux-mips.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] omapfb: reduce stack usage
Message-ID: <20191019091154.qlmb7abqoqdmtz7f@debian>
References: <20191018163004.23498-1-sudipm.mukherjee@gmail.com>
 <20191018172728.GA11857@lenoch>
 <20191018223012.tkpwbo3mg5mthlnz@debian>
 <184cdd47d4064420b05c16f10588595c65f789e5.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <184cdd47d4064420b05c16f10588595c65f789e5.camel@perches.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Oct 18, 2019 at 06:19:15PM -0700, Joe Perches wrote:
> On Fri, 2019-10-18 at 23:30 +0100, Sudip Mukherjee wrote:
> > On Fri, Oct 18, 2019 at 07:27:28PM +0200, Ladislav Michl wrote:
> > > On Fri, Oct 18, 2019 at 05:30:04PM +0100, Sudip Mukherjee wrote:
> > > > The build of xtensa allmodconfig is giving a warning of:
> > > > In function 'dsi_dump_dsidev_irqs':
> > > > warning: the frame size of 1120 bytes is larger than 1024 bytes
<snip>
> 
> Without your patch:
> 
> $ objdump -x drivers/video/fbdev/omap2/omapfb/dss/dsi.o | grep dsi_dump_dsidev_irqs
> 00000d20 l     F .text	0000061c dsi_dump_dsidev_irqs
> 
> With your patch:
> 
> $ objdump -x drivers/video/fbdev/omap2/omapfb/dss/dsi.o | grep dsi_dump_dsidev_irqs
> 00000d20 l     F .text	00000638 dsi_dump_dsidev_irqs

I did objdump -d and then compared where it started and where it ended.

But, in anycase, this driver is framebuffer driver for omap2 and in
reality, can only be used on arm platform and when I build the driver
with arm compiler I am not getting this warning. This is not a valid
concern, please reject this patch.

--
Regards
Sudip
