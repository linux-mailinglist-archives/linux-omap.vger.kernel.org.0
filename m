Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 432B9DD4F5
	for <lists+linux-omap@lfdr.de>; Sat, 19 Oct 2019 00:30:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbfJRWaS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Oct 2019 18:30:18 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:55287 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726008AbfJRWaS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 18 Oct 2019 18:30:18 -0400
Received: by mail-wm1-f66.google.com with SMTP id p7so7636688wmp.4;
        Fri, 18 Oct 2019 15:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LDipa+pHzraU7AGfSCkk9cS4X3bVgRZMrlZ0/HVNYsA=;
        b=ustvlh1TIqREMXUWZS1iLAzKjUfrnCI+UqhCZkGebqu8AOs9XDDbRdrD5iy//Uguw8
         Nk4MyI/zsEE0TTz0m5dmFW/i+nrCqGXajx0D2CTeIPh4kezIOMJ/uG5BV6z9Y3KUdvib
         pFTUKcqH4cei8hyXkLhbIjQNSqo+9GarqPwRePCNQ3Kn5IiqHbl9DAZyqutkaJ3+RgVh
         W1+7pVnw+zh3yuv6kbpsZ1uC07oE4hfSeVgHUKJK/T/qOyuj41aI85J9hait2pZj0oUz
         6hZbFuY8i/MW0t7aHElaJUBHdPjy6b+9rKMXnbqr/pwuPnRUBRlEFfM7wUCUyOP/Q1X/
         2TLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LDipa+pHzraU7AGfSCkk9cS4X3bVgRZMrlZ0/HVNYsA=;
        b=eTwXqJtFNenZ4SlgocddGqQXIOYywDjglLjGRK78tj+MMlU1VG4ATc0gmNJo6LCMFn
         0hF8dXb/Q1HbfFReaG+loV+FNzJtu3tRVG9vC4QoYbOsYpqUKC2ne8D3zqbGodFfpyMp
         wsv4a4PalSg0vVMK9BLgAe5SBBJZVrs46fxiyK72rduLRHDk05DiDsXRQwMm4JE+wFzp
         QGTO5xyDf5AME9y2Hf8f6MP6OM9T98kH1JOrXiff4BvE3C8tPJRNBfYLWVm5jIVLoggJ
         S4DC29ZVfCwlZKM6HOaoLnNE65mp2+yd2T0/4ly3DElJoKGTGsrpDTd/BpeNBdlkd4l+
         jDaA==
X-Gm-Message-State: APjAAAVZ3a0JkGvKCzKDc3YBvbJ4SoLtfwVLD9G4+qis70IvbYMx+HQD
        3PDOHL2+z9GvSNNtFhuG+2uAg2gLnDg=
X-Google-Smtp-Source: APXvYqx0nhZn+ANbaDKEXUF+gtPz7+Tpqlx3lB7NVJMmoz+GpA6CPYWuDTVtZ4m90EA2B7Rma8qNrQ==
X-Received: by 2002:a7b:cab1:: with SMTP id r17mr9081696wml.106.1571437815707;
        Fri, 18 Oct 2019 15:30:15 -0700 (PDT)
Received: from debian (host-78-144-219-162.as13285.net. [78.144.219.162])
        by smtp.gmail.com with ESMTPSA id x2sm6728897wrn.81.2019.10.18.15.30.14
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 15:30:15 -0700 (PDT)
Date:   Fri, 18 Oct 2019 23:30:12 +0100
From:   Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To:     Ladislav Michl <ladis@linux-mips.org>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] omapfb: reduce stack usage
Message-ID: <20191018223012.tkpwbo3mg5mthlnz@debian>
References: <20191018163004.23498-1-sudipm.mukherjee@gmail.com>
 <20191018172728.GA11857@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191018172728.GA11857@lenoch>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Oct 18, 2019 at 07:27:28PM +0200, Ladislav Michl wrote:
> On Fri, Oct 18, 2019 at 05:30:04PM +0100, Sudip Mukherjee wrote:
> > The build of xtensa allmodconfig is giving a warning of:
> > In function 'dsi_dump_dsidev_irqs':
> > warning: the frame size of 1120 bytes is larger than 1024 bytes
> > 
> > Allocate the memory for 'struct dsi_irq_stats' dynamically instead
> > of assigning it in stack.
> 
> So now function can fail silently, executes longer, code is sligthly
> bigger... And all that to silent warning about exceeding frame size.
> Is it really worth "fixing"?

The only point of failure is if kmalloc() fails and if kmalloc() fails then
there will be error prints in dmesg to tell the user that there is no
memory left in the system. About the size bigger, it seems
the drivers/video/fbdev/omap2/omapfb/dss/dsi.o file is smaller with the
patch.
This is without the patch:
-rw-r--r-- 1 sudip sudip 316856 Oct 18 22:27 drivers/video/fbdev/omap2/omapfb/dss/dsi.o
And this is with the patch:
-rw-r--r-- 1 sudip sudip 316436 Oct 18 20:09 drivers/video/fbdev/omap2/omapfb/dss/dsi.o

And also, objdump shows me that <dsi_dump_dsidev_irqs> was taking up 0xD7D
bytes, and now with the patch it is taking up 0xBED bytes, thats a saving
of 400 bytes. If it has 400 bytes of less code to execute will it not be
faster now?

But, I may be totally wrong in my thinking, and in that case, please feel
free to reject the patch.

--
Regards
Sudip
