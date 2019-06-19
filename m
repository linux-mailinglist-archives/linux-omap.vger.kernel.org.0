Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09CBD4BC63
	for <lists+linux-omap@lfdr.de>; Wed, 19 Jun 2019 17:06:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730217AbfFSPGZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 19 Jun 2019 11:06:25 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42078 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730164AbfFSPGY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 19 Jun 2019 11:06:24 -0400
Received: by mail-lj1-f195.google.com with SMTP id t28so1350995lje.9
        for <linux-omap@vger.kernel.org>; Wed, 19 Jun 2019 08:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=nDfkV8NBGFiURwassxD7ytfC0t1CNDepFq+TNmyLZT8=;
        b=oqMO/sHA/5NxzzT0yRXmVS1fov/gCBmlfxV3B0SZ3ubCH3qvBQq6dq2bhZA/OUg3Xv
         1mwhfi7d8DblOgSZg2KH27JNOEFCkUGTmTIjqBQa5tkKbJRLWZLzYFT16hcJh+j/Syp+
         29LEvGQIXavrXVXrXbaS/KFO2Wit0+kCy7JgfWxWX69KL6iZth0DCR3slFQqOx6/HW4V
         LdXg/GimvZP4Ccsge79zv2H1Ozk8Mif58qENy+l8WgHm4+SvduSJkkwCYioICI7g0ggr
         6dyQdufK1G3ho2rZBJi6gxJqSqooFfquIN1xmQ/iAGtGW0gnqs1RAE2rGfofviAc1my7
         wvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nDfkV8NBGFiURwassxD7ytfC0t1CNDepFq+TNmyLZT8=;
        b=sWEdkrAVhzTqI2Pqf26K+OT357SV86Vt0+fqPobEF8nob5bwi/z0+PdAFJn7gBRwxB
         5k5RSbolOxYztILPdSvZ5oyhk9kGMbTN+YYVmovIBpkj5QFxOxqvyakVWROBkp3x8YmC
         XCyPTceYL8itQs/4+Y2O1sDlZbSrOaG/h/9S8EiMmIINiVIOYSR5kh5Z87bASIHZCFMr
         usnqYpx6O3/JPU8YooQbKUtoRqS99Y4Pupr6oUtOYGLsZddaOzQvytGMWctSzSvV2ghU
         sKz1l08LlkrWhB7COQZlgPWfn3iP9Eh5Ly/rwQiJzAJlz2rrDz22KSoDcs7oBb/VrR0x
         Rh4w==
X-Gm-Message-State: APjAAAUBGTRKwGDb/+nSnrYIuOY2rtemyyEenSkA+YIUerPBnqZaYGN+
        pkBnVlHy+JNzFJiUZFo2E9zgcA==
X-Google-Smtp-Source: APXvYqwiPMgPFpFbn6wMYwgtQdGcIZYTj3+AlxXKYiQQRRTPfzxTxIpULnMpbXQpRHYQpiV76HJLNw==
X-Received: by 2002:a2e:5b0f:: with SMTP id p15mr48417670ljb.82.1560956783120;
        Wed, 19 Jun 2019 08:06:23 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
        by smtp.gmail.com with ESMTPSA id p2sm1747407lfc.89.2019.06.19.08.06.21
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Jun 2019 08:06:22 -0700 (PDT)
Date:   Wed, 19 Jun 2019 07:27:22 -0700
From:   Olof Johansson <olof@lixom.net>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     arm@kernel.org, Nathan Chancellor <natechancellor@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Paul Walmsley <paul@pwsan.com>, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: omap2: remove incorrect __init annotation
Message-ID: <20190619142722.hsujtf3svd7p2pt4@localhost>
References: <20190619130529.1502322-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190619130529.1502322-1-arnd@arndb.de>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Jun 19, 2019 at 03:04:54PM +0200, Arnd Bergmann wrote:
> omap3xxx_prm_enable_io_wakeup() is marked __init, but its caller is not, so
> we get a warning with clang-8:
> 
> WARNING: vmlinux.o(.text+0x343c8): Section mismatch in reference from the function omap3xxx_prm_late_init() to the function .init.text:omap3xxx_prm_enable_io_wakeup()
> The function omap3xxx_prm_late_init() references
> the function __init omap3xxx_prm_enable_io_wakeup().
> This is often because omap3xxx_prm_late_init lacks a __init
> annotation or the annotation of omap3xxx_prm_enable_io_wakeup is wrong.
> 
> When building with gcc, omap3xxx_prm_enable_io_wakeup() is always
> inlined, so we never noticed in the past.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> Acked-by: Tony Lindgren <tony@atomide.com>

Applied to fixes. Thanks!


-Olof
