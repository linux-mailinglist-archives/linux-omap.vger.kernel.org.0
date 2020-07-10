Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B6FF21BBB1
	for <lists+linux-omap@lfdr.de>; Fri, 10 Jul 2020 18:58:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727046AbgGJQ6U (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 10 Jul 2020 12:58:20 -0400
Received: from muru.com ([72.249.23.125]:33300 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726977AbgGJQ6T (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 10 Jul 2020 12:58:19 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 2042980E5;
        Fri, 10 Jul 2020 16:59:11 +0000 (UTC)
Date:   Fri, 10 Jul 2020 09:58:14 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Suman Anna <s-anna@ti.com>
Cc:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Tero Kristo <t-kristo@ti.com>
Subject: Re: [PATCH 00/13] Add IPU & DSP remoteprocs on OMAP4 and OMAP5
Message-ID: <20200710165814.GF5849@atomide.com>
References: <20200709231954.1973-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200709231954.1973-1-s-anna@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Suman Anna <s-anna@ti.com> [200709 16:20]:
> Hi Tony,
> 
> The following series contains all the necessary DT pieces to boot the
> IPU and DSP remote processors on OMAP4 and OMAP5 SoCs. They are
> enabled specifically on the TI OMAP4 PandaBoard and OMAP5 uEVM boards.
> This is the last DT piece that now completes the support for IPUs and
> DSPs on all OMAP4+ SoCs, similar patches were merged for 5.8 covering
> the DRA7xx/AM57xx SoCs. Appreciate it if you can pick up the series for
> 5.9 if it isn't too late.

Great and good to hear things are working with only dts changes now :)
Yes let's try to get these merged.

> There is one issue that I have run into while testing this series on
> the latest kernel. I am seeing a l3_noc error for OMAP4 DSP when it
> attempts to auto-suspend or stop after it is booted. The issue is a
> L4CFG read error that happens in the sysc_disable_module() function
> in ti-sysc code.
> 
> I do not have any issues on my downstream 5.4 based SDK kernel. I have
> root-caused this to the OMAP4 voltage controller patches you added for
> 5.5 kernel through your omap-for-v5.5/pm branch, specifically the
> commit 4873843718f9 ("ARM: OMAP2+: Initialize voltage controller for omap4").
> The VOLTCTRL register value is 0x300 before that patch, and modifying
> this register either through  omap4_vc_init_pmic_signaling() or
> omap4_vc_set_pmic_signaling() will trigger this. A debug print in
> sysc_disable_module() also seems to help.

Hmm interesting, not sure how the VOLTCTRL register affects this.

I wonder the following commit in v5.8-rc3 might help with this though:

5ce8aee81be6 ("bus: ti-sysc: Flush posted write on enable and disable")

I was seeing that occasionally with mcspi, but never had anything
reproducable.

Regards,

Tony
