Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64374AA564
	for <lists+linux-omap@lfdr.de>; Thu,  5 Sep 2019 16:05:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725945AbfIEOFv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Sep 2019 10:05:51 -0400
Received: from muru.com ([72.249.23.125]:59730 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725290AbfIEOFv (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 5 Sep 2019 10:05:51 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 24F7D810D;
        Thu,  5 Sep 2019 14:06:20 +0000 (UTC)
Date:   Thu, 5 Sep 2019 07:05:46 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Keerthy <j-keerthy@ti.com>
Cc:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Tero Kristo <t-kristo@ti.com>, linux-omap@vger.kernel.org,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: Linux-next: File system over NFS broken on DRA7/AM5 platforms
Message-ID: <20190905140546.GT52127@atomide.com>
References: <c89bd1cb-be2b-eceb-4c3d-144dc9bb951a@ti.com>
 <17acc359-5938-5f43-3f20-c8de93556748@ti.com>
 <20190903140553.GN52127@atomide.com>
 <20190903152427.GO52127@atomide.com>
 <6fa1c2af-457c-3dbc-74a2-72ae539a48b0@ti.com>
 <20190903170107.GP52127@atomide.com>
 <20190903182906.GQ52127@atomide.com>
 <e67d05c7-b35b-1ddc-ca06-9496c3e28f74@ti.com>
 <20190904162223.GR52127@atomide.com>
 <509b8c3f-6788-941c-128d-5ff723f62120@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <509b8c3f-6788-941c-128d-5ff723f62120@ti.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Keerthy <j-keerthy@ti.com> [190905 03:54]:
> On 04/09/19 9:52 PM, Tony Lindgren wrote:
> > * Grygorii Strashko <grygorii.strashko@ti.com> [190904 11:39]:
> > > Module should also enabled here.
> > 
> > You are right, good catch. Maybe this in addition to the clocks is
> > why some dra7 boards fail to enable cpsw depending on the bootloader?
> > 
> > > > @@ -1677,10 +1679,10 @@ static int sysc_init_module(struct sysc *ddata)
> > > >    	if (manage_clocks)
> > > >    		sysc_disable_main_clocks(ddata);
> > > >    err_opt_clocks:
> > > > -	if (manage_clocks) {
> > > > +	if (manage_clocks)
> > > >    		sysc_disable_opt_clocks(ddata);
> > > > -		sysc_clkdm_allow_idle(ddata);
> > > > -	}
> > > > +
> > > > +	sysc_clkdm_allow_idle(ddata);
> > > 
> > > clkdm doesn't have counters while clock do, so if module is in HW_AUTO
> > > and clkdm in HW_AUTO - the module can go IDLE between this point and  ti_sysc_idle() call.
> > > 
> > > Errate i877 required
> > > CM_GMAC_CLKSTCTRL[1:0] CLKTRCTRL = 0x2:SW_WKUP.
> > > to be set at boot time and never changed.
> > > 
> > > and
> > > "In addition to programming SW_WKUP(0x2) on CM_GMAC_CLKSTCTRL, SW should
> > > also program modulemode field as ENABLED(0x2) on CM_GMAC_GMAC_CLKCTRL
> > > register."
> > 
> > OK makes sense now thanks. I've dropped that change and added a comment
> > there. Updated patch below again to test.
> 
> Tony,
> 
> Thanks. The updated patch fixes the NFS boot issue.

OK good to hear and thanks for testing it. I sent out a proper patch
with a description as " [PATCH] bus: ti-sysc: Fix clock handling for
no-idle quirks", please review one more time and I'll apply it to
fixes.

Regards,

Tony
