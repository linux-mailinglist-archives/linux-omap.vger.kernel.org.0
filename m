Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7305ABDB3
	for <lists+linux-omap@lfdr.de>; Fri,  6 Sep 2019 18:28:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388960AbfIFQ2J (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 6 Sep 2019 12:28:09 -0400
Received: from muru.com ([72.249.23.125]:60026 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388816AbfIFQ2J (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 6 Sep 2019 12:28:09 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 5221180CC;
        Fri,  6 Sep 2019 16:28:39 +0000 (UTC)
Date:   Fri, 6 Sep 2019 09:28:06 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-omap@vger.kernel.org, adam.ford@logicpd.com
Subject: Re: [PATCH] ARM: dts: logicpd-som-lv: Fix i2c2 and i2c3 Pin mux
Message-ID: <20190906162806.GF52127@atomide.com>
References: <20190820121727.3883-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190820121727.3883-1-aford173@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Adam Ford <aford173@gmail.com> [190820 05:18]:
> When the pinmux configuration was added, it was accidentally placed into
> the omap3_pmx_wkup node  when it should have been placed into the
> omap3_pmx_core.  This error was accidentally propagated to stable by
> me when I blindly requested the pull after seeing I2C issues without
> actually reviewing the content of the pinout.  Since the bootloader
> previously muxed these correctly in the past, was a hidden error.
> 
> This patch moves the i2c2_pins and i2c3_pins to the correct node
> which should eliminate i2c bus errors and timeouts due to the fact
> the bootloader uses the save device tree that no longer properly
> assigns these pins.
> 
> Fixes: 5fe3c0fa0d54 ("ARM: dts: Add pinmuxing for i2c2 and i2c3
> for LogicPD SOM-LV") #4.9+

Applying into fixes thanks.

Tony
