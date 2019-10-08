Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D765CFC01
	for <lists+linux-omap@lfdr.de>; Tue,  8 Oct 2019 16:09:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726057AbfJHOJa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Oct 2019 10:09:30 -0400
Received: from muru.com ([72.249.23.125]:35926 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725853AbfJHOJa (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 8 Oct 2019 10:09:30 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 222338081;
        Tue,  8 Oct 2019 14:10:04 +0000 (UTC)
Date:   Tue, 8 Oct 2019 07:09:27 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/3] bus: ti-sysc: fix reset sequencing
Message-ID: <20191008140927.GA5610@atomide.com>
References: <20191007122931.18668-1-t-kristo@ti.com>
 <20191007163807.GU5610@atomide.com>
 <32031606-23da-2e0b-6d75-7225a082eb6b@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32031606-23da-2e0b-6d75-7225a082eb6b@ti.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tero Kristo <t-kristo@ti.com> [191007 19:00]:
> On 07/10/2019 19:38, Tony Lindgren wrote:
> > * Tero Kristo <t-kristo@ti.com> [191007 12:30]:
> > > Hi,
> > > 
> > > These three patches make sure that IOMMU/remoteprocs work across
> > > all devices with the latest OMAP PRM series for reset support [1].
> > > The last dangling issues were caused by the removal of the hardlink
> > > between the reset + clock drivers.
> > 
> > OK. I presume these are safe to wait for v5.5 since we don't
> > have the rstctrl driver yet?
> 
> Yeah, they are safe to wait.

OK applying into omap-for-v5.5/ti-sysc thanks.

Tony
