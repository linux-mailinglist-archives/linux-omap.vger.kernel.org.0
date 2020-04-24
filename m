Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E1E71B79FB
	for <lists+linux-omap@lfdr.de>; Fri, 24 Apr 2020 17:44:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728927AbgDXPho (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Apr 2020 11:37:44 -0400
Received: from muru.com ([72.249.23.125]:51218 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728922AbgDXPhn (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 24 Apr 2020 11:37:43 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id CAA4080E7;
        Fri, 24 Apr 2020 15:38:30 +0000 (UTC)
Date:   Fri, 24 Apr 2020 08:37:40 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     linux-clk@vger.kernel.org, sboyd@kernel.org,
        mturquette@baylibre.com, linux-omap@vger.kernel.org
Subject: Re: [PATCH] clk: ti: am33xx: fix RTC clock parent
Message-ID: <20200424153740.GI37466@atomide.com>
References: <20200424152301.4018-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200424152301.4018-1-t-kristo@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tero Kristo <t-kristo@ti.com> [200424 15:23]:
> Right now, trying to use RTC purely with the ti-sysc / clkctrl framework
> fails to enable the RTC module properly. Based on experimentation, this
> appears to be because RTC is sourced from the clkdiv32k optional clock.
> TRM is not very clear on this topic, but fix the RTC to use the proper
> source clock nevertheless.
> 
> Reported-by: Tony Lindgren <tony@atomide.com>
> Signed-off-by: Tero Kristo <t-kristo@ti.com>

This fixes the issue where RTC won't get enabled unless the
clock is enabled by the bootloader or early init code:

Acked-by: Tony Lindgren <tony@atomide.com>
