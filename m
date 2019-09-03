Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFBFEA6AC5
	for <lists+linux-omap@lfdr.de>; Tue,  3 Sep 2019 16:05:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728122AbfICOF4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 3 Sep 2019 10:05:56 -0400
Received: from muru.com ([72.249.23.125]:59602 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725782AbfICOF4 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 3 Sep 2019 10:05:56 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 10F9780CF;
        Tue,  3 Sep 2019 14:06:25 +0000 (UTC)
Date:   Tue, 3 Sep 2019 07:05:53 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Tero Kristo <t-kristo@ti.com>, Keerthy <j-keerthy@ti.com>,
        linux-omap@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: Linux-next: File system over NFS broken on DRA7/AM5 platforms
Message-ID: <20190903140553.GN52127@atomide.com>
References: <b5f54d5f-4790-7be1-cb65-847a98d2e8dd@ti.com>
 <c32b9e04-b230-7634-051b-202868597ec1@ti.com>
 <59564d54-c032-7ca0-3130-6fa7d10f43b7@ti.com>
 <c89bd1cb-be2b-eceb-4c3d-144dc9bb951a@ti.com>
 <17acc359-5938-5f43-3f20-c8de93556748@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17acc359-5938-5f43-3f20-c8de93556748@ti.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Grygorii Strashko <grygorii.strashko@ti.com> [190903 12:46]:
> > The clock definition itself looks fine, however the question is why does someone try to disable it while it
>  is apparently still used (by NFS that is)? If it fails to disable, clock core is trying to disable it, but the IDLEST bit does not switch for some reason.
> 
> I've tried to disable "ti,no-idle" in DT for dra7 cpsw and got below failure
> 
> [    0.634530] gmac-clkctrl:0000:0: failed to enable 08070002
> [    0.634557] ti-sysc: probe of 48485200.target-module failed with error -16
> 
> so samthing is not right with GMAC clocks as it should probe without "ti,no-idle".
> 
> 
> original place of the issue is:
> 
> cpsw_probe()
>  -> pm_runtime_get_sync()
>     -> sysc_runtime_resume()
>        -> sysc_enable_main_clocks()
> 
> Note. the sysc_init_module() for "ti,no-idle" case looks a little bit strange as there is
> no guarantee that target-module or clock were enabled before.

Good point on the "ti,no-idle" handling. That is easy to fix by always enabling
the clocks. The "ti,no-idle-on-init" handling needs probably a flag set for
PM runtime.

Regards,

Tony
