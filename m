Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D22717046C
	for <lists+linux-omap@lfdr.de>; Wed, 26 Feb 2020 17:31:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727860AbgBZQbp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 Feb 2020 11:31:45 -0500
Received: from muru.com ([72.249.23.125]:57758 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726905AbgBZQbp (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 26 Feb 2020 11:31:45 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 9BCE38022;
        Wed, 26 Feb 2020 16:32:28 +0000 (UTC)
Date:   Wed, 26 Feb 2020 08:31:40 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     afzal mohammed <afzal.mohd.ma@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, Krzysztof Halasa <khalasa@piap.pl>,
        Russell King <linux@armlinux.org.uk>,
        Hartley Sweeten <hsweeten@visionengravers.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Kevin Hilman <khilman@kernel.org>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Viresh Kumar <vireshk@kernel.org>,
        Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>, Enrico Weigelt <info@metux.net>
Subject: Re: [PATCH v2 02/18] ARM: replace setup_irq() by request_irq()
Message-ID: <20200226163140.GP37466@atomide.com>
References: <cover.1582471508.git.afzal.mohd.ma@gmail.com>
 <cbc4859788bd30d6ddc9d9483ed641d6f2d0fd42.1582471508.git.afzal.mohd.ma@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cbc4859788bd30d6ddc9d9483ed641d6f2d0fd42.1582471508.git.afzal.mohd.ma@gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* afzal mohammed <afzal.mohd.ma@gmail.com> [200224 00:49]:
> request_irq() is preferred over setup_irq(). The early boot setup_irq()
> invocations happen either via 'init_IRQ()' or 'time_init()', while
> memory allocators are ready by 'mm_init()'.
> 
> Per tglx[1], setup_irq() existed in olden days when allocators were not
> ready by the time early interrupts were initialized.
> 
> Hence replace setup_irq() by request_irq().
> 
> Seldom remove_irq() usage has been observed coupled with setup_irq(),
> wherever that has been found, it too has been replaced by free_irq().
> 
> [1] https://lkml.kernel.org/r/alpine.DEB.2.20.1710191609480.1971@nanos
> 
> Signed-off-by: afzal mohammed <afzal.mohd.ma@gmail.com>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> Acked-by: Alexander Sverdlin <alexander.sverdlin@gmail.com> # EP93xx
> Tested-by: Alexander Sverdlin <alexander.sverdlin@gmail.com> # EP93xx

Works for me:

Tested-by: Tony Lindgren <tony@atomide.com> # omap1 osk
