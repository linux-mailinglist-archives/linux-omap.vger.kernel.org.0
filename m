Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C1972356C1
	for <lists+linux-omap@lfdr.de>; Sun,  2 Aug 2020 13:54:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727992AbgHBLxj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 2 Aug 2020 07:53:39 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:50886 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726908AbgHBLxj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 2 Aug 2020 07:53:39 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id AEA661C0BDA; Sun,  2 Aug 2020 13:53:36 +0200 (CEST)
Date:   Sun, 2 Aug 2020 13:53:30 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
Cc:     ssantosh@kernel.org, s-anna@ti.com, santosh.shilimkar@oracle.com,
        robh+dt@kernel.org, lee.jones@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        wmills@ti.com, praneeth@ti.com
Subject: Re: [PATCH 0/6] Add TI PRUSS platform driver
Message-ID: <20200802115330.GA1090@bug>
References: <1596020528-19510-1-git-send-email-grzegorz.jaszczyk@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1596020528-19510-1-git-send-email-grzegorz.jaszczyk@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi!

> A typical usage scenario would be to load the application firmware into one or
> more of the PRU cores, initialize one or more of the peripherals and perform I/O
> through shared RAM from either a kernel driver or directly from userspace.
> 
> This series contains the PRUSS platform driver. This is the parent driver for
> the entire PRUSS and is used for managing the subsystem level resources like
> various memories and the CFG module.  It is responsible for the creation and
> deletion of the platform devices for the child PRU devices and other child
> devices (like Interrupt Controller, MDIO node and some syscon nodes) so that
> they can be managed by specific platform drivers.

>  drivers/soc/ti/Kconfig | 11 + drivers/soc/ti/Makefile | 1 + drivers/soc/ti/pruss.c | 

Is drivers/soc right place for that? We already have subsystem for various
programmable accelerators...


									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
