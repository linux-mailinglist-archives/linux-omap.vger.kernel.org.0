Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C989F17061D
	for <lists+linux-omap@lfdr.de>; Wed, 26 Feb 2020 18:29:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726671AbgBZR35 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 Feb 2020 12:29:57 -0500
Received: from muru.com ([72.249.23.125]:57796 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726661AbgBZR35 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 26 Feb 2020 12:29:57 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 299058022;
        Wed, 26 Feb 2020 17:30:42 +0000 (UTC)
Date:   Wed, 26 Feb 2020 09:29:54 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Lokesh Vutla <lokeshvutla@ti.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        linux-kernel@vger.kernel.org, narmstrong@baylibre.com,
        Sekhar Nori <nsekhar@ti.com>, Tero Kristo <t-kristo@ti.com>
Subject: Re: [PATCH 2/2] clocksource: timer-ti-dm: Do not update counter on
 updating the period
Message-ID: <20200226172954.GR37466@atomide.com>
References: <20200224050753.17784-1-lokeshvutla@ti.com>
 <20200224050753.17784-3-lokeshvutla@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200224050753.17784-3-lokeshvutla@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Lokesh Vutla <lokeshvutla@ti.com> [200224 05:09]:
> Write to trigger register(OMAP_TIMER_TRIGGER_REG) will load the value
> in Load register(OMAP_TIMER_LOAD_REG) into Counter register
> (OMAP_TIMER_COUNTER_REG).
> 
> omap_dm_timer_set_load() writes into trigger register every time load
> register is updated. When timer is configured in pwm mode, this causes
> disruption in current pwm cycle, which is not expected especially when
> pwm is used as PPS signal for synchronized PTP clocks. So do not write
> into trigger register on updating the period.

This patch without patch 1/2 applied still works for me:

Tested-by: Tony Lindgren <tony@atomide.com>
