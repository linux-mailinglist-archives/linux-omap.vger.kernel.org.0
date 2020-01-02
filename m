Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83EC712E91C
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jan 2020 18:09:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726207AbgABRJ5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 Jan 2020 12:09:57 -0500
Received: from muru.com ([72.249.23.125]:49878 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726125AbgABRJ5 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 2 Jan 2020 12:09:57 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 418E08087;
        Thu,  2 Jan 2020 17:10:37 +0000 (UTC)
Date:   Thu, 2 Jan 2020 09:09:49 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, sre@kernel.org, nekit1000@gmail.com,
        mpartap@gmx.net, merlijn@wizzup.org, martin_rysavy@centrum.cz
Subject: Re: Droid 4 on 5.5-rc3
Message-ID: <20200102170949.GA16702@atomide.com>
References: <20191228162929.GA29269@duo.ucw.cz>
 <20191228193622.GA13047@duo.ucw.cz>
 <20191230173507.GM35479@atomide.com>
 <20200101201132.GA9612@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200101201132.GA9612@amd>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Pavel Machek <pavel@ucw.cz> [200101 20:12]:
> I tried v5.5-rc4, and it does not boot either. I'm kexecing from
> 5.3-rc2. Maybe there's Kconfig difference? This is my...

I also tested with your .config and v5.4-rc4 boots just fine
for me on two different droid4s.

The regulator warning is there with built-in drivers that's probably
related to deferred probe and should be fixed though.

But wlan and mmc work meaning what you're seeing is not a regulator
issue.

Regards,

Tony
