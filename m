Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F34CA2F9ACC
	for <lists+linux-omap@lfdr.de>; Mon, 18 Jan 2021 08:50:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730146AbhARHtf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 18 Jan 2021 02:49:35 -0500
Received: from muru.com ([72.249.23.125]:55340 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726139AbhARHte (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 18 Jan 2021 02:49:34 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 8E4D980AE;
        Mon, 18 Jan 2021 07:48:54 +0000 (UTC)
Date:   Mon, 18 Jan 2021 09:48:51 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Oskar Holmlund <info@ohdata.se>
Cc:     linux-omap@vger.kernel.org
Subject: Re: [am33xx-clocks.dtsi] move ieee5000 ti,gate-clock to a ti,clkctrl?
Message-ID: <YAU9Y0cgtn+pr6Ph@atomide.com>
References: <f4c28638a0c00d1ae988dbebe88a1884@ohdata.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f4c28638a0c00d1ae988dbebe88a1884@ohdata.se>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Oskar Holmlund <info@ohdata.se> [201230 11:05]:
> Hi,
> 
> Is it possible to move
> &prcm_clocks {
> ...
> 	ieee5000_fck: ieee5000_fck@e4 {
> 		#clock-cells = <0>;
> 		compatible = "ti,gate-clock";
> 		clocks = <&dpll_core_m4_div2_ck>;
> 		ti,bit-shift = <1>;
> 		reg = <0x00e4>;
> 	};
> 
> to something like this to better correlate to the TRM 8.1.12.1.40
> CM_PER_IEEE5000_CLKCTRL Register(offset= E4h) ?
> Or is there any reason the ieee5000 is a ti,gate-clock?

For the clkctrl clocks, we should just use cm base + offset. But
somehow we don't have this for ieee5000_clkctrl defined in the
include/dt-bindings/clock/am3.h.

Regards,

Tony
