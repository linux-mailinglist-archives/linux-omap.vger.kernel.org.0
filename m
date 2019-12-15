Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 120DF11FACB
	for <lists+linux-omap@lfdr.de>; Sun, 15 Dec 2019 20:35:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726295AbfLOTd3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 15 Dec 2019 14:33:29 -0500
Received: from mail.andi.de1.cc ([85.214.55.253]:45884 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726267AbfLOTd2 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 15 Dec 2019 14:33:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=66GL6uEMhL/IBdQ3j8dGFVszWMz92MKvrMh/IitWSgw=; b=fV42WMmwbpzdggy7SHL6TptND+
        u/3IjtbOdXfdoFhjGGeq5gihZoRGVv6xSZ2uposkH3gyBB324LvG+MArY+4ePRDymXqevik2o0PLp
        F+UUKL4+o/+jsCLNz/U8WYXvZw4YHtX1jr2t+hBx3ptQsqQHBr+8ITCZ63f+AZDFXCXs=;
Received: from p200300ccff4bb7001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff4b:b700:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1igZdr-00014T-ND; Sun, 15 Dec 2019 20:33:24 +0100
Date:   Sun, 15 Dec 2019 20:33:19 +0100
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
Message-ID: <20191215203319.2874ac04@aktux>
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
I tried this after booting with init=/bin/bash and mounting kernel
filesystems (no off mode enabled):
root@(none):/# echo on >/sys/bus/platform/devices/480b2000.1w/power/control
root@(none):/# modprobe omap_hdq
[   49.590820] Driver for 1-wire Dallas network protocol.
[   49.598327] omap_hdq 480b2000.1w: OMAP HDQ Hardware Rev 0.5. Driver in Interrupt mode
root@(none):/# [   49.624572] w1_master_driver w1_bus_master1: Attaching one wire slave 01.000000000000 crc 3d
[   49.660980] power_supply bq27000-battery: power_supply_get_battery_info currently only supports devicetree

root@(none):/# time cat /sys/class/power_supply/bq27000-battery/voltage_now 
0

real    0m2.561s
user    0m0.008s
sys     0m0.002s
root@(none):/# time cat /sys/class/power_supply/bq27000-battery/voltage_now 
0

real    0m12.601s
user    0m0.010s
sys     0m0.002s
root@(none):/# time cat /sys/class/power_supply/bq27000-battery/voltage_now 
0

real    0m12.601s
user    0m0.010s
sys     0m0.002s
root@(none):/# 

No data could be read but some detection work seem to be done.
Of course, I also tried without that forced power on.

I hope I can find more time to analyze.
Looks like a nice cleanup but needs some work.

Regards,
Andreas
