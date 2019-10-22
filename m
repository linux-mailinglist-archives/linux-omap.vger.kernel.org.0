Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E01C8E0826
	for <lists+linux-omap@lfdr.de>; Tue, 22 Oct 2019 18:01:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389013AbfJVQBP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 22 Oct 2019 12:01:15 -0400
Received: from muru.com ([72.249.23.125]:38950 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387746AbfJVQBP (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 22 Oct 2019 12:01:15 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 449F980FA;
        Tue, 22 Oct 2019 16:01:49 +0000 (UTC)
Date:   Tue, 22 Oct 2019 09:01:11 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Sebastian Reichel <sre@kernel.org>
Cc:     Marcel Holtmann <marcel@holtmann.org>,
        Adam Ford <aford173@gmail.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        linux-bluetooth@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCHv2 0/4] Convert all btwilink users to hci_ll and drop
 btwilink
Message-ID: <20191022160111.GP5610@atomide.com>
References: <20191003134147.9458-1-sre@kernel.org>
 <20191008143116.GF5610@atomide.com>
 <20191020203352.rh3n6qpagiyift7d@earth.universe>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191020203352.rh3n6qpagiyift7d@earth.universe>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Sebastian Reichel <sre@kernel.org> [191020 20:34]:
> Hi Tony,
> 
> On Tue, Oct 08, 2019 at 07:31:16AM -0700, Tony Lindgren wrote:
> > * Sebastian Reichel <sre@kernel.org> [191003 06:42]:
> > > This moves the remaining users of btwilink to the "new" serdev based hci_ll
> > > driver and drops the btwilink driver afterwards. The patches were only compile
> > > tested by me, but Enric tested the IGEP platform and Adam will test the LogicPD
> > > platform.
> > > 
> > > I kept the TI_ST driver for now, since I plan to send a second patchset for the
> > > FM radio driver. Once the FM driver has been converted to also use hci_ll, we
> > > can remove TI_ST completly.
> > > 
> > > My suggestion is for the patch handling is, that everything simply goes through
> > > Tony's tree.
> > 
> > Sounds good to me, good to see kim gone with patch 3/4 :)
> > 
> > Marcel, care to ack the old driver removal patch?
> 
> Looks like Marcel missed the extra messages and merged the 4th
> patch, so I guess you can just merge patches 1-3. Technically that
> might lead to temporarily missing BT support on those two devices
> when the BT tree is merged before ARM tree during the merge window.
> Not a big issue I guess.

Sure no problem. Applying dts changes into omap-for-v5.5/dt
and the pdata quirk removal to omap-for-v5.5/soc.

I guess ti_wilink_st.h will need some follow-up patch to
remove unused platform data, but best to wait on that.

Regards,

Tony



