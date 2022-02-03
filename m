Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 273D94A7FA9
	for <lists+linux-omap@lfdr.de>; Thu,  3 Feb 2022 08:13:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349320AbiBCHNq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 3 Feb 2022 02:13:46 -0500
Received: from muru.com ([72.249.23.125]:45788 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239109AbiBCHNp (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 3 Feb 2022 02:13:45 -0500
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 825D5817C;
        Thu,  3 Feb 2022 07:13:30 +0000 (UTC)
Date:   Thu, 3 Feb 2022 09:13:43 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     peter.vasil@gmail.com
Cc:     linux-omap@vger.kernel.org
Subject: Re: [PATCH 4/6] leds: tahvo: Driver for Tahvo/Betty ASIC LEDPWM
 output
Message-ID: <YfuAp+USR0ryaQ4G@atomide.com>
References: <20211224215635.1585808-3-peter.vasil@gmail.com>
 <20211224215635.1585808-4-peter.vasil@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211224215635.1585808-4-peter.vasil@gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* peter.vasil@gmail.com <peter.vasil@gmail.com> [211224 21:58]:
> From: Peter Vasil <peter.vasil@gmail.com>
> 
> Nokia Tahvo/Betty ASIC is a companion chip for mobile devices. One of
> its outputs is a 127-levels PWM, usually used for LED or backlight
> control.
> Register control code has been written based on original Nokia kernel
> sources for N810 display driver.
> Driver expects a regmap device as parent, usually retu-mfd driver bound
> to the Tahvo ASIC.

The drivers should be sent to the driver maintainers as separate
patches as listed in the MAINTAINERS file. Seems once you have the
bindings can be merged separately to the subsystem trees. And at that
point I can also pick up the dts patch.

Regards,

Tony
